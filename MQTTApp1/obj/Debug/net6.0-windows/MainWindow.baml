   M S B A M L   `   `   `  ????C  ?MQTTApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:MQTTApp1MQTTApp1  5   	   1clr-namespace:MQTTApp1.ModelsMQTTApp1.Models  5   	       MQTTApp1.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:MQTTApp1     5   	   0modelsclr-namespace:MQTTApp1.Models     5   	     ? Title$  MainWindow1??5	   	   $	??450??6   $	??800??6*    ? 	Resources 5
         bru ?? Color3  -System.Windows.Media.Effects.DropShadowEffect  myshadow   
BlurRadius   ShadowDepth   Color??%y   &	        &	 #     ?? 5   
   $ 	AliceBlue??6&     5   
   $ 10Q?6,   $ 2Q?5      $ Black??5      5      .??5      ?  ? RowDefinitions 5   
   ?? 5      $
??Auto ?6   ?? 5      $??30 ?6   ?? 5      $??* ?6   .+?5   
   ? $??0??6   $??5q?6    ? ColumnDefinitions 5      ?? 5      $??* ?6#   ?? 5      $
??Auto ?6#   .+?5      ?? -   5         ??Name$ sendTxt??5      $??0??6'   ??67   ?? *	Message+	 ?? Mode$	 TwoWay=?
 ?? UpdateSourceTrigger$
 PropertyChanged=??? 5      $	??100??61   $
??Send??6=   $??1??6L   ??6   ?? *	SendCMD+6L   5      ?? 5   
   $??1??6   $??5q?6?   ??6!   ?? *CurrentState+6?   ?? 5   
   $??2??6   $??5q?6   $??0q?6)   ._?5       ??  ?? SelectionMode$ Single=?6e   $??0q?6|   ??6   ?? *
Messages+ ?? SelectedItem 68   ?? *SelectedMessageData+??5!      ?? 5"       ?? 
TargetType" ??6   .?5#      ??  ?? Property ? ?? ?? Value 6G   ?? *	Alignment+?? 5$       ? ??
 ?????67   ?? 5%       ? ??$ 0q?6<    ?? Triggers 5&      P? 5'       P? Property ?@J?IsMouseOver P? Value$
 True??6=   . ?5(   "   ??  ? ??
 ?????6?   ?? 5)   "    ? ??$ 0q?6D   5*      P? 5+       ?@J?	IsFocused$
 True??6;   . ?5,   "   ??  ? ??
 ?????6?   ?? 5-   "    ? ??$ 0q?6D   5.      P? 5/       ?@??
IsSelected$
 True??6<   . ?50   "   ??  ? ??
 ?????6?   ?? 51   "    ? ??$ 0q?6D   52      P? 53       ?@??
IsSelected$ False??6<   . ?54   "   ??  ? ??
 ?????6?   ?? 55   "    ? ??$ 0q?6D   56      58      ??5:      ?? 5;      .R?5<      ??  ?? Orientation$ Vertical=?6%   
???????5>      5?      ??5A      ?? 5B      .R?5C      ?? ??6!   ?? *	BackColor+ ?? CornerRadius 6B   ?? *MsgCornerRadius+._?5D      ?? $??5q?6_   ??6(   ?? *Owner+??6F   ?? *	Message+6_   5E       ?? Triggers 5F      P? 5G       ?@J?IsMouseOver$
 True??6=   . ?5H   "   ?? # [ 6;    ?@J?Effect5I      5K      5M      5O      5P      5Q      