   M S B A M L   `   `   `  ????C  ?MQTTApp2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:MQTTApp2MQTTApp2  5   	       MQTTApp2.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:MQTTApp2     5   	     ? Title$  MainWindow2??5   	   $	??450??6   $	??800??6*    ? 	Resources 5	         bru ?? Color3  -System.Windows.Media.Effects.DropShadowEffect  myshadow   
BlurRadius   ShadowDepth   Color??%y   &	        &	 #     ?? 5
   
   $ 	AliceBlue??6&     5   
   $ 10Q?6,   $ 2Q?5      $ Black??5      5      .??5      ?  ? RowDefinitions 5   
   ?? 5      $
??Auto ?6   ?? 5      $??30 ?6   ?? 5      $??* ?6   .+?5   
   ? $??0??6   $??5q?6    ? ColumnDefinitions 5      ?? 5      $??* ?6#   ?? 5      $
??Auto ?6#   .+?5      ?? -   5         ??Name$ sendTxt??5      $??0??6'   ??67   ?? *	Message+	 ?? Mode$	 TwoWay=?
 ?? UpdateSourceTrigger$
 PropertyChanged=??? 5      $	??100??61   $
??Send??6=   $??1??6L   ??6   ?? *	SendCMD+6L   5      ?? 5   
   $??1??6   $??5q?6?   ??6!   ?? *CurrentState+6?   ?? 5   
   $??2??6   $??5q?6   $??0q?6)   ._?5      ??  ?? SelectionMode$ Single=?6e   $??0q?6|   ??6   ?? *
Messages+ ?? SelectedItem 68   ?? *SelectedMessageData+??5       ?? 5!       ?? 
TargetType" ??6   .?5"      ??  ?? Property ? ?? ?? Value 6G   ?? *	Alignment+?? 5#       ? ??
 ?????67   ?? 5$       ? ??$ 0q?6<    ?? Triggers 5%      P? 5&       P? Property ?@J?IsMouseOver P? Value$
 True??6=   . ?5'   "   ??  ? ??
 ?????6?   ?? 5(   "    ? ??$ 0q?6D   5)      P? 5*       ?@J?	IsFocused$
 True??6;   . ?5+   "   ??  ? ??
 ?????6?   ?? 5,   "    ? ??$ 0q?6D   5-      P? 5.       ?@??
IsSelected$
 True??6<   . ?5/   "   ??  ? ??
 ?????6?   ?? 50   "    ? ??$ 0q?6D   51      P? 52       ?@??
IsSelected$ False??6<   . ?53   "   ??  ? ??
 ?????6?   ?? 54   "    ? ??$ 0q?6D   55      57      ??59      ?? 5:      .R?5;      ??  ?? Orientation$ Vertical=?6%   
???????5=      5>      ??5@      ?? 5A      .R?5B      ?? ??6!   ?? *	BackColor+ ?? CornerRadius 6B   ?? *MsgCornerRadius+._?5C      ?? $??5q?6_   ??6(   ?? *Owner+??6F   ?? *	Message+6_   5D       ?? Triggers 5E      P? 5F       ?@J?IsMouseOver$
 True??6=   . ?5G   "   ?? # [ 6;    ?@J?Effect5H      5J      5L      5N      5O      5P      