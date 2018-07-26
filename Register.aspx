<%@ Page Language="C#" Title="Create Account" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 256px;
        }
        .style3
        {
            width: 11px;
        }
        .style4
        {
            width: 256px;
            height: 12px;
        }
        .style5
        {
            width: 11px;
            height: 12px;
        }
        .style6
        {
            height: 12px;
            width: 950px;
        }
        
        .textbox
        {
            overflow: hidden;
            border-radius: 0.5em;
            padding-left: 2px;
            padding-right: 2px;
            height: 25px;
        }
        .btn
        {
            background: #3498db;
            background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
            background-image: -moz-linear-gradient(top, #3498db, #2980b9);
            background-image: -ms-linear-gradient(top, #3498db, #2980b9);
            background-image: -o-linear-gradient(top, #3498db, #2980b9);
            background-image: linear-gradient(to bottom, #3498db, #2980b9);
            -webkit-border-radius: 10;
            -moz-border-radius: 10;
            border-radius: 10px;
            font-family: cursive;
            color: #ffffff;
            font-size: 14px;
            padding: 5px 5px 5px 5px;
            text-decoration: none;
        }
        
        .style7
        {
            width: 950px;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</head>
<body style="width: 1075px; height: 380px; margin-left: 356px">
    <form id="form1" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <table class="style1">
        <tr>
            <td class="style2" style="font-family: cursive; color: #000080">
                First Name
            </td>
            <td class="style3">
                :
            </td>
            <td class="style7">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtFirstName" runat="server" ErrorMessage="First Name is must"
                    ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-family: cursive; color: #000080">
                Last Name
            </td>
            <td class="style3">
                :
            </td>
            <td class="style7">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" placeholder="Last Name"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-family: cursive; color: #000080">
                Email Address
            </td>
            <td class="style3">
                :
            </td>
            <td class="style7" width="30">
                <asp:TextBox ID="txtEmailAddress" runat="server" ValidationGroup="email" CssClass="textbox" placeholder="Email Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtEmailAddress" runat="server" ErrorMessage="Email Address is must"
                    ControlToValidate="txtEmailAddress" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" ErrorMessage="Enter Valid Email."
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="email"
                    Display="Dynamic" ControlToValidate="txtEmailAddress" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" style="font-family: cursive; color: #000080">
                DOB</td>
            <td class="style3">
                :
            </td>
            <td class="style7">
                <asp:TextBox ID="datepicker" runat="server" ValidationGroup="email" CssClass="textbox" placeholder="DOB" onkeypress="return false;"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                Gender
            </td>
            <td class="style5">
                :
            </td>
            <td class="style6">
                <asp:RadioButtonList ID="rblGender" runat="server" Font-Names="cursive" 
                    ForeColor="#003399" RepeatDirection="Horizontal">
                    <asp:ListItem Selected>MALE</asp:ListItem>
                    <asp:ListItem>FEMALE</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                Mobile No
            </td>
            <td class="style5">
                :
            </td>
            <td class="style6">
                <asp:TextBox ID="txtMobileNo" runat="server" ValidationGroup="Co2" CssClass="textbox" placeholder="Mobile No"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtMobileNo" runat="server" ErrorMessage="Mobile No. is must"
                    ControlToValidate="txtMobileNo" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revtxtMobileNo" runat="server" ErrorMessage="Enter Valid Mobile No."
                    ValidationExpression="^[0-9]*$" ValidationGroup="Co2" Display="Dynamic" ControlToValidate="txtMobileNo"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                Password
            </td>
            <td class="style5">
                :
            </td>
            <td class="style6">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" 
                    placeholder=" Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtPassword" runat="server" ErrorMessage="Password is must"
                    ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                Hint
            </td>
            <td class="style5">
                :
            </td>
            <td class="style6">
                <asp:TextBox ID="txtHint" runat="server" CssClass="textbox" placeholder=" Hint"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtHint" runat="server" ErrorMessage="Hint is must"
                    ControlToValidate="txtHint" Display="Dynamic" ValidationGroup="register"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style6">
                <asp:Label ID="Label1" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="Note : Kindly remember this hint in case you forget your password in future." 
                    Width="250px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;
            </td>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style6">
                <asp:Label ID="lblCaptcha" runat="server" Text="Label" Font-Names="Brush Script MT"
                    Font-Size="XX-Large" Font-Strikeout="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4" style="font-family: cursive; color: #000080">
                Enter Captcha
            </td>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style6">
                <asp:TextBox ID="txtCaptcha" runat="server" CssClass="textbox" Width="140px"></asp:TextBox>
                <asp:ImageButton ID="refresh" runat="server" Text="Refresh" OnClick="Refresh_click"
                    Height="25px" ImageUrl="~/images/refresh.png" Width="25px" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;
            </td>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style6">
                <asp:Button ID="btnRegister" runat="server" Text="REGISTER" Style="margin-left: 63px"
                    BackColor="Aqua" BorderColor="#003300" BorderStyle="Solid" BorderWidth="2px"
                    ValidationGroup="register" CssClass="btn" text-align="center" OnClick="btnRegister_Click" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;
            </td>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style6">
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
