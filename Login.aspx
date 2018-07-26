<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        div 
        {   
            align:center;
            margin:250px auto;
            
        }
        
        #form1
        {
            width: 349px;
            margin-left: 185px;
        }
        .style1
        {
            width: 100%;
            float: left;
        }
        .style2
        {
            height: 12px;
        }
    </style>
</head>
<body bgcolor="#00ccff" style="margin-left: 300px; margin-bottom: 0px">
   <div> <form id="form1" runat="server">
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <table align="left" class="style1">
        <tr>
            <td style="width: 49%; font-family: cursive; color: #000080;" dir="ltr">
                Login Id :
            </td>
            <td style="width: 2%">
                :
            </td>
            <td style="width: 49%">
                <asp:TextBox ID="txtLoginId" runat="server" ValidationGroup="email" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtLoginId" runat="server" ErrorMessage="Login Id is must"
                    ControlToValidate="txtLoginId" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revLoginId" runat="server" ErrorMessage="Enter Valid Email."
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="email"
                    Display="Dynamic" ControlToValidate="txtLoginId" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 49%; font-family: cusive; color: #000080; font-size: larger;">
                Password :
            </td>
            <td style="width: 2%">
                :
            </td>
            <td style="width: 49%">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtPassword" runat="server" ErrorMessage="Password is must"
                    ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 49%">
                &nbsp;
            </td>
            <td style="width: 2%">
                &nbsp;
            </td>
            <td style="width: 49%">
                <asp:Label ID="lblCaptcha" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Brush Script MT"
                    Font-Size="XX-Large" Font-Strikeout="True" CssClass="captcha"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 49%; font-family: cursive; color: #000080;">
                Enter Captcha
            </td>
            <td style="width: 2%" valign="middle">
                :
            </td>
            <td style="width: 49%" valign="middle">
                <asp:TextBox ID="txtCaptcha" runat="server" CssClass="textbox" Width="140px"></asp:TextBox>
                <asp:ImageButton ID="refresh" runat="server" Text="Refresh" OnClick="Refresh_click"
                    Height="25px" ImageUrl="~/images/refresh.png" Width="25px" />
            </td>
        </tr>
        <tr>
            <td style="width: 49%">
                &nbsp;
            </td>
            <td style="width: 2%">
                &nbsp;
            </td>
            <td style="width: 49%">
                <asp:LinkButton ID="btnFP" runat="server" Text="FORGOT PASSWORD" 
                    text-align="center" Font-Size="10px" onclick="btnFP_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 49%">
                &nbsp;<asp:Button ID="btnSignup" 
                    runat="server" Text="Sign Up" 
                    Style="margin-left: 63px"
                    BackColor="Aqua" BorderColor="#003300" BorderStyle="Solid" 
                    BorderWidth="2px" CssClass="btn" text-align="center" 
                    onclick="btnSignup_Click" />
            </td>
            <td style="width: 2%">
                &nbsp;
            </td>
            <td style="width: 49%" align="right">
                <asp:Button ID="login" runat="server" Text="LOGIN" OnClick="Login_click" Style="margin-left: 63px"
                    BackColor="Aqua" BorderColor="#003300" BorderStyle="Solid" BorderWidth="2px"
                    ValidationGroup="Login" CssClass="btn" text-align="center" />
            </td>
            </tr>
            <tr>
                <td colspan="3" class="style2">
                    &nbsp; &nbsp;
                </td>
        </tr>
    </table>
    </form>
    </div>
</body>
</html>
