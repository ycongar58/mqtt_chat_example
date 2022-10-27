using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media;

namespace MessageDto
{
    public class MessageData
    {
        public string From { get; set; } = string.Empty;
        public string To { get; set; } = string.Empty;
        public string Message { get; set; } = string.Empty;
        public Bitmap AttachedImage { get; set; } = null;
        public bool IsOwner { get; set; } = true;

        public bool IsTyping { get; set; } = false;

        public SolidColorBrush BackColor
        {
            get => IsOwner ? new SolidColorBrush(System.Windows.Media.Color.FromRgb(153, 204, 255)) : new SolidColorBrush(System.Windows.Media.Color.FromRgb(102, 204, 0));
        }

        public HorizontalAlignment Alignment
        {
            get => IsOwner ? HorizontalAlignment.Right : HorizontalAlignment.Left;
        }

        public CornerRadius MsgCornerRadius
        {
            get => IsOwner ? new CornerRadius(5, 5, 0, 5) : new CornerRadius(0, 5, 5, 5);
        }

        public TextAlignment TextAlignment
        {
            get => IsOwner ? TextAlignment.Right : TextAlignment.Left;
        }

        public int OwnerColumn
        {
            get => IsOwner ? 1 : 0;
        }
    }
}
