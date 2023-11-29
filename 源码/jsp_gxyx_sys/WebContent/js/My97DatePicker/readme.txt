1. 在使用该日期控件的文件中加入JS库(仅这一个文件即可,其他文件会自动引入,请勿删除或改名), 代码如下 <script language="javascript" type="text/javascript" src="datepicker/WdatePicker.js"></script>
注:src="datepicker/WdatePicker.js" 请根据你的实际情况改变路径

2. 加上主调函数 WdatePicker

示例：
<asp:TextBox ID="TextBox1" runat="server" Width="70px" onclick="WdatePicker()"></asp:TextBox>
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>