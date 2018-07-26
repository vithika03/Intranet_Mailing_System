<%@ Page Language="C#" MasterPageFile="~/MDIAdmin.master" AutoEventWireup="true"
    CodeFile="change_pass.aspx.cs" Inherits="change_pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/Global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 122px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <table align="left" class="style1">
        <tr>
            <td class="style2" style="font-family: cursive; color: #000080;">
                Current Password
            </td>
            <td width="2">
                :
            </td>
            <td>
                <asp:TextBox ID="currpass" runat="server" TextMode="Password" ValidationGroup="validate"
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvcurrpass" runat="server" ErrorMessage="Current Pass is must"
                    ControlToValidate="currpass" Display="Dynamic" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="Regcurrpass" runat="server" ErrorMessage="Password must contain combination of alphanumeric & special characters and of size 7-10"
                    ControlToValidate="currpass" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$"
                    ValidationGroup="validate" Display="Dynamic" />--%>
            </td>
        </tr>
        <tr>
            <td class="style2" style="color: #000080; font-family: cursive">
                New Password
            </td>
            <td width="2">
                :
            </td>
            <td>
                <asp:TextBox ID="newpass" runat="server" TextMode="Password" ValidationGroup="validate2"
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvnewpass" runat="server" ErrorMessage="New Pass is must"
                    ControlToValidate="newpass" Display="Dynamic" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regnewpass" runat="server" ErrorMessage="Password must contain combination of alphanumeric & special characters and of size 7-10"
                    ControlToValidate="newpass" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$"
                    ValidationGroup="validate2" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="style2" style="color: #000080; font-family: cursive">
                Confirm Password
            </td>
            <td width="2">
                :
            </td>
            <td>
                <asp:TextBox ID="conpass" runat="server" TextMode="Password" ValidationGroup="pass"
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvconpass" runat="server" ErrorMessage="Confirm pass is must"
                    ControlToValidate="conpass" Display="Dynamic" ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="Cmpconpass" runat="server" ErrorMessage="New Pass & confirm pass don't match"
                    ControlToValidate="conpass" Display="Dynamic" Operator="Equal" ControlToCompare="newpass"
                    ValidationGroup="pass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td width="2">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="submit" runat="server" Text="Change Password" Style="margin-left: 62px"
                    Width="117px" ValidationGroup="submit" CssClass="btn" OnClick="submit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
