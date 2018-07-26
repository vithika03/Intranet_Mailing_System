<%@ Page Language="C#" MasterPageFile="~/MDIAdmin.master" AutoEventWireup="true"
    CodeFile="ComposeMail.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/Global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 80px;
        }
        .style3
        {
            width: 13px;
        }
        .style4
        {
            width: 80px;
            height: 64px;
        }
        .style5
        {
            width: 13px;
            height: 64px;
        }
        .style6
        {
            height: 64px;
        }
        .style7
        {
            width: 80px;
            height: 137px;
        }
        .style8
        {
            width: 13px;
            height: 137px;
        }
        .style9
        {
            height: 137px;
        }
    </style>
    <style type="text/css">
        pre
        {
            background-color: #f5f5f5;
            padding: 5px;
            border: #d3d3d3 1px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="style1">
        <tr>
            <td align="right" class="style4" style="font-family: cursive; color: #000080" width="10%">
                To
            </td>
            <td class="style5">
                :
            </td>
            <td class="style6" width="88%">
                <asp:TextBox ID="TxtTo" runat="server" placeholder="Recipients" Height="41px" Style="margin-top: 0px"
                    Width="612px" TextMode="MultiLine" CssClass="textbox" OnTextChanged="TxtTo_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style2" style="font-family: cursive; color: #000080" width="10%">
                Cc
            </td>
            <td class="style3">
                :
            </td>
            <td width="88%">
                <asp:TextBox ID="TxtCc" runat="server" Width="612px" placeholder="Cc" CssClass="textbox" OnTextChanged="TxtTo_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style2" style="font-family: cursive; color: #000080" width="10%">
                Bcc
            </td>
            <td class="style3">
                :
            </td>
            <td width="88%">
                <asp:TextBox ID="TxtBcc" runat="server" Width="612px" placeholder="Bcc" CssClass="textbox" OnTextChanged="TxtTo_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style2" style="font-family: cursive; color: #000080" width="10%">
                Subject
            </td>
            <td class="style3">
                :
            </td>
            <td width="88%">
                <asp:TextBox ID="TxtSubject" runat="server" Width="612px" placeholder="Subject" CssClass="textbox"></asp:TextBox>
            </td>
        </tr>
        <tr style="display:none">
            <td align="right" class="style2" style="font-family: cursive; color: #000080" width="10%">
                Attachments
            </td>
            <td class="style3">
                :
            </td>
            <td width="88%">
                <asp:FileUpload ID="fileUpload" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="MoreFiles" runat="server" Text="Attach More Files" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style7" width="10%">
            </td>
            <td class="style8">
            </td>
            <td class="style9" width="88%" valign="top">
                <CKEditor:CKEditorControl ID="txtBody" runat="server">
                </CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td class="style2" width="10%">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td width="88%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2" width="10%">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
            <td width="88%">
                <asp:Button ID="Send" runat="server" Text="SEND" Width="81px" CssClass="btn" OnClick="Send_Click" />
                <asp:Button ID="SaveDraft" runat="server" Style="margin-left: 73px" Text="Save Draft"
                    Width="90px" CssClass="btn" OnClick="Send_Click" />
                <asp:Button ID="Discard" runat="server" Style="margin-left: 100px" Text="Discard"
                    Width="81px" CssClass="btn" onclick="Discard_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
