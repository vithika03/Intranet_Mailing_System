<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MDIAdmin.master"
    CodeFile="ViewMail.aspx.cs" Inherits="Masters_ViewMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/Global.css" rel="stylesheet" type="text/css" />
    <script src="../JS/jquery.min.js" type="text/javascript"></script>
    <script src="../JS/Search.js" type="text/javascript"></script>
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
    <script>
        $(document).ready(function () {
            $("[id*=txtSearch]").live("keyup", function () {
                SearchGrid('txtSearch', 'gvwMails');
            });
        });
    </script>
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
                            <asp:Button ID="btnDelete" runat="server" Text="Delete Mails" CssClass="btn" OnClick="btnDelete_Click" />
                        </td>
                        <td align="left" valign="middle" width="50%">
                            <table align="left" class="style1">
                                <tr>
                                    <td width="20%" style="font-family: cursive; color: #000080;">
                                        Search
                                    </td>
                                    <td width="80%">
                                        <asp:TextBox ID="txtSearch" runat="server" Width="90%" CssClass="Searchtextbox"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" valign="middle" width="25%">
                            <asp:Label ID="lblRecordsCount" runat="server" Text="SFdadkhlsa" Visible="false"></asp:Label>
                            &nbsp;<asp:LinkButton ID="lnkOldMails" runat="server" CssClass="LinkBtn" Visible="false">Old Mails</asp:LinkButton>
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
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <asp:GridView ID="gvwMails" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="hdnMailDetailId" runat="server" Value='<%# Bind("MailDetailId") %>'>
                                </asp:HiddenField>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="2%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnReadMail" runat="server" Text="Open Mail" CssClass='<%# Bind("MailDetailId") %>'
                                    OnClick="btnReadMail_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblDisplayName" runat="server" Text='<%# Bind("DisplayName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="83%" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="5%" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
        </tr>
        <tr >
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
