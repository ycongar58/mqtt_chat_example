using MQTTApp1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MQTTApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MainVM MyMainVM;
        public MainWindow()
        {
            InitializeComponent();
            MyMainVM = new MainVM();
            this.DataContext = MyMainVM;
            Loaded += MainWindow_Loaded;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            //TcpListener server = new TcpListener(IPAddress.Any, 1883);
            //server.Start();
            //server.BeginAcceptSocket(AcceptedSocketCallback, server);
            //server.BeginAcceptTcpClient(AcceptedTcpClientCallback, server);
            
            if (MyMainVM != null)
                MyMainVM.BindData();
        }

        private void AcceptedSocketCallback(IAsyncResult result)
        {
            var tmp = result.IsCompleted;
        }

        private void AcceptedTcpClientCallback(IAsyncResult result)
        {
            var tmp = result.IsCompleted;
        }
    }
}
