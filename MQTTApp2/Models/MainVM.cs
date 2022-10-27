using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MessageDto;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace MQTTApp2.Models
{
    public class MainVM : ViewModelBase
    {
        private ICommand _sendCMD;
        private string _output = string.Empty;
        private string _msg = string.Empty;
        private MqttClient mqttClient;
        private string[] currentTopic = new string[] { "Application2/Message", "Application2/Typing" };
        private string targetTopic = "Application1/Message";
        private string targetTyping = "Application1/Typing";
        private string clientID = Guid.NewGuid().ToString();
        private byte[] qosLevels = new byte[] { MqttMsgBase.QOS_LEVEL_AT_LEAST_ONCE, MqttMsgBase.QOS_LEVEL_AT_LEAST_ONCE };
        private string currentState = string.Empty;
        private MessageData messageData;
        private ObservableCollection<MessageData> messages = new ObservableCollection<MessageData>();

        public string CurrentState
        {
            get => currentState;
            set => Set(ref currentState, value);
        }

        public ObservableCollection<MessageData> Messages
        {
            get => messages;
            set => Set(ref messages, value);
        }
        public MessageData SelectedMessageData
        {
            get => messageData;
            set => Set(ref messageData, value);
        }
        public string OutPut
        {
            get => _output;
            set => Set(ref _output, value);
        }
        public string Message
        {
            get => _msg;
            set { Set(ref _msg, value); IsTyping(); }
        }
        public ICommand SendCMD
        {
            get
            {
                if (_sendCMD == null)
                    _sendCMD = new RelayCommand(sendFunc);
                return _sendCMD;
            }
        }

        private void IsTyping()
        {
            try
            {
                if (string.IsNullOrEmpty(Message))
                    return;
                MessageData tmp = new MessageData() { IsTyping = true };
                tmp.To = targetTyping;
                tmp.From = currentTopic[0];
                var msgJson = JsonConvert.SerializeObject(tmp);
                var bytes = Encoding.UTF8.GetBytes(msgJson);
                mqttClient.Publish(tmp.To, bytes);
            }
            catch (Exception ex)
            {

            }
        }

        private void AddMessage(MessageData msg)
        {
            if (msg == null)
                return;
            if (!Application.Current.Dispatcher.CheckAccess())
            {
                Application.Current.Dispatcher.Invoke(() =>
                {

                    Messages.Add(msg);
                    SelectedMessageData = msg;
                });
            }
            else
            {
                Messages.Add(msg);
                SelectedMessageData = msg;
            }
        }

        private void sendFunc()
        {
            if(mqttClient != null && mqttClient.IsConnected)
            {
                var msgData = new MessageData();
                msgData.From = currentTopic[0];
                msgData.To = targetTopic;
                msgData.Message = Message;
                var msgJson = JsonConvert.SerializeObject(msgData);
                var bytes = Encoding.UTF8.GetBytes(msgJson);
                mqttClient.Publish(msgData.To, bytes);
                Message = String.Empty;
                AddMessage(msgData);
            }
        }

        public void BindData()
        {
            Task.Factory.StartNew(() => 
            {
                try
                {
                    mqttClient = new MqttClient("broker.hivemq.com");
                    mqttClient.MqttMsgPublishReceived += MqttClient_MqttMsgPublishReceived;
                    mqttClient.Subscribe(currentTopic, qosLevels);
                    mqttClient.Connect("App2");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            });
        }

        Stopwatch typeWatcher = new Stopwatch();
        Thread typeThread;
        bool received = false;
        private void MqttClient_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e)
        {
            var message = Encoding.UTF8.GetString(e.Message);
            var msgData = JsonConvert.DeserializeObject<MessageData>(message);
            if (msgData != null)
            {
                if (e.Topic == currentTopic[0])
                {
                    msgData.IsOwner = false;
                    received = true;
                    AddMessage(msgData);
                    OutPut += string.Format("From {0} to {1}: Message: {2}\n", new string[] { msgData.From, msgData.To, msgData.Message });
                }
                else if(e.Topic == currentTopic[1])
                {
                    if (msgData.IsTyping)
                    {
                        CurrentState = "Is typing...";
                        typeWatcher.Restart();
                        if (typeThread == null)
                        {
                            typeThread = new Thread(watchTyping);
                            typeThread.Start();
                        }
                        else if (!typeThread.IsAlive)
                        {
                            typeThread = new Thread(watchTyping);
                            typeThread.Start();
                        }
                    }
                }
            }
        }

        private void watchTyping()
        {
            while (typeWatcher.ElapsedMilliseconds < 2000 && !received) ;
            Application.Current.Dispatcher.Invoke(() => CurrentState = string.Empty);
            received = false;
        }
    }
}
