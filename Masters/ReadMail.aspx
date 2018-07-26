<%@ Page Language="C#" MasterPageFile="~/MDIAdmin.master" AutoEventWireup="true"
    CodeFile="ReadMail.aspx.cs" Inherits="Masters_ViewMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/Global.css" rel="stylesheet" type="text/css" />
    <style>
        .LeftSetWidth
        {
            width: 20%;
            vertical-align: middle;
        }
        .RightSetWidth
        {
            width: 80%;
            vertical-align: top;
        }
        .MainTbl
        {
            width: 100%;
        }
        .style1
        {
            width: 100%;
            float: left;
        }
        .style7
        {
            width: 20%;
            vertical-align: middle;
            height: 56px;
        }
        .style8
        {
            width: 20%;
            vertical-align: middle;
            height: 54px;
        }
        .style9
        {
            width: 20%;
            vertical-align: middle;
            height: 60px;
        }
        .style10
        {
            width: 20%;
            vertical-align: middle;
            height: 52px;
        }
        .style11
        {
            width: 20%;
            vertical-align: middle;
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="left" class="MainTbl">
        <tr>
            <td class="LeftSetWidth">
                &nbsp;
            </td>
            <td class="RightSetWidth">
                <table align="left" class="style1">
                    <tr>
                        <td align="left" valign="middle" width="25%">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete Mails" CssClass="btn" OnClick="btnDelete_Click"
                                Visible="false" />
                        </td>
                        <td align="left" valign="middle" width="50%">
                            <table align="left" class="style1">
                                <tr>
                                    <td width="20%" style="font-family: cursive; color: #000080;">
                                        Search
                                    </td>
                                    <td width="80%">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="90%" CssClass="Searchtextbox"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" valign="middle" width="25%">
                            <asp:Label ID="lblRecordsCount" runat="server" Text="SFdadkhlsa" style="display:none"></asp:Label>
                            &nbsp;<asp:LinkButton ID="lnkOldMails" runat="server" CssClass="LinkBtn" style="display:none">Old Mails</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;
                <asp:LinkButton ID="lnkComposeMail" runat="server" CssClass="LinkBtn" OnClick="lnkComposeMail_Click">Compose Mail</asp:LinkButton>
            </td>
            <td class="RightSetWidth" rowspan="5">
                <asp:FormView ID="frmReadMail" runat="server" Width="100%">
                    <ItemTemplate>
                        <table align="left" class="style1">
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdnMailId" runat="server" Value='<%# Bind("MailId") %>'>
                                    </asp:HiddenField>
                                    <asp:Label ID="Label2" runat="server" Style="font-weight: 700" Text='<%# Bind("Subject") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MailStatus") %>'></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Print"  style="display:none" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text='<%# string.Concat("<b>",Eval("DisplayName"),"</b> < ",Eval("Email")," >") %>'></asp:Label>
                                </td>
                                <td align="right">
                                </td>
                                <td align="right">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                    <asp:Button ID="btnReply" runat="server" Text="Reply" OnClick="btnReply_Click" />
                                    <asp:Button ID="btnForward" runat="server" Text="Forward" OnClick="btnForward_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td align="right">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="padding: 10px; margin: 10px">
                                    <asp:Label ID="lblMessage" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;
                <asp:LinkButton ID="lnkInbox" runat="server" OnClick="lnkInbox_Click" CssClass="LinkBtn">Inbox</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;
                <asp:LinkButton ID="lnkSendBox" runat="server" OnClick="lnkSendBox_Click" CssClass="LinkBtn">Send Box</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
                <asp:LinkButton ID="lnkDrafts" runat="server" OnClick="lnkDrafts_Click" CssClass="LinkBtn">Drafts</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;
                <asp:LinkButton ID="lnkTrash" runat="server" OnClick="lnkTrash_Click" CssClass="LinkBtn">Trash</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
