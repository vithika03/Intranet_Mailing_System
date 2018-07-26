<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forget_pass.aspx.cs" Inherits="forget_pass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 90%;
            margin-right: 269px;
        }
        .style3
        {
            width: 10px;
        }
        .style4
        {
            width: 51px;
        }
        .style5
        {
            width: 48%;
        }
        .style6
        {
            width: 212px;
        }
        .style7
        {
            width: 6px;
        }
        .style8
        {
            width: 41px;
            height: 37px;
        }
        .style9
        {
            width: 10px;
            height: 37px;
        }
        .style10
        {
            width: 51px;
            height: 37px;
        }
        .style11
        {
            width: 41px;
        }
        .style15
        {
            width: 41px;
            height: 58px;
        }
        .style16
        {
            width: 10px;
            height: 58px;
        }
        .style17
        {
            width: 51px;
            height: 58px;
        }
        .style18
        {
            width: 41px;
            height: 93px;
        }
        .style19
        {
            width: 10px;
            height: 93px;
        }
        .style20
        {
            width: 51px;
            height: 93px;
        }
    </style>
</head>
<body style="width: 766px; margin-left: 154px">
    <form id="form1" runat="server">
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <asp:Panel ID="pnlFP" runat="server" GroupingText="Forget Password" BorderColor="#003399"
        Font-Bold="False" Font-Names="cursive" ForeColor="#003399">
        <table class="style1">
            <tr>
                <td class="style18" style="font-family: cursive; color: #000080">
                    Login id
                </td>
                <td class="style19">
                    :
                </td>
                <td class="style20" width="70px">
                    <asp:TextBox ID="Email_id" runat="server" ValidationGroup="email" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail_id" runat="server" ErrorMessage="Email id is must"
                        ControlToValidate="Email_id" Display="Dynamic" ValidationGroup="next"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail_id" runat="server" ErrorMessage="Enter Valid Email"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="email"
                        Display="Dynamic" ControlToValidate="Email_id" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style15" style="font-family: cursive; color: #000080">
                    Recovery Hint
                </td>
                <td class="style16">
                    :
                </td>
                <td class="style17" width="100%">
                    <asp:TextBox ID="txtRecoveryHint" runat="server" CssClass="textbox" 
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRecoveryHint" runat="server" ErrorMessage="Recovery Hint is must"
                        ControlToValidate="txtRecoveryHint" Display="Dynamic" ValidationGroup="next"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8" style="font-family: cursive; color: #000080">
                </td>
                <td class="style9">
                </td>
                <td class="style10" width="100%">
                    <asp:Label ID="lblHint" runat="server" ForeColor="Red" Text="Kindly enter your Hint and DOB in the given format"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8" style="font-family: cursive; color: #000080">
                    &nbsp;
                </td>
                <td class="style9">
                    &nbsp;
                </td>
                <td class="style10" width="100%">
                    <asp:Label ID="lblFormat" runat="server" ForeColor="Red" Text="HintMMDDYYYY"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td class="style4">
                    &nbsp;
                    <asp:Button ID="next" runat="server" CssClass="btn" OnClick="next_Click" Style="margin-left: 97px"
                        Text="NEXT" ValidationGroup="next" Width="100px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <table class="style5">
        <tr>
            <td class="style6">
                <asp:Label ID="new_pass" runat="server" Text="New Password" Visible="False" Font-Names="cursive"
                    ForeColor="#000099"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;
            </td>
            <td>
                <asp:TextBox ID="newpass" runat="server" Visible="False" ValidationGroup="validate"
                    CssClass="textbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvnewpass" runat="server" ErrorMessage="Password is must"
                    ControlToValidate="newpass" Display="Dynamic" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regnew_pass" runat="server" ErrorMessage="Password must contain combination of alphanumeric & special characters and of size 7-10"
                    ControlToValidate="newpass" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$"
                    ValidationGroup="validate" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="confirm_pass" runat="server" Text=" Confirm Password" Visible="False"
                    Font-Names="cursive" ForeColor="#003399"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;
            </td>
            <td>
                <asp:TextBox ID="conpass" runat="server" Visible="False" ValidationGroup="pass" 
                    CssClass="textbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvconpass" runat="server" ErrorMessage="Confirm pass is must"
                    ControlToValidate="conpass" Display="Dynamic" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="Cmpconpass" runat="server" ErrorMessage="New Pass & confirm pass don't match"
                    ControlToValidate="conpass" Display="Dynamic" Operator="Equal" ControlToCompare="newpass"
                    ValidationGroup="pass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;
            </td>
            <td class="style7">
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:Button ID="change" runat="server" Style="margin-left: 47px" Text="Reset Password"
                    Visible="False" Width="127px" ValidationGroup="submit" CssClass="btn" 
                    onclick="change_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
