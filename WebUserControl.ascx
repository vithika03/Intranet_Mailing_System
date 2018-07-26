<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>
<style type="text/css">
    .style1
    {
        width: 100%;
        float: left;
    }
</style>

<table align="left" class="style1">
    <tr>
        <td width="25%">
            <asp:Image ID="Image1" runat="server" Height="50px" 
                ImageUrl="~/images/logo.PNG" Width="50px" />
        </td>
        <td width="25%">
            &nbsp;</td>
        <td width="25%" align="right" valign="top">
            <asp:Label ID="lblLogin" runat="server" Font-Bold="True"></asp:Label>
        </td>
        <td align="right" width="25%" valign="top">
&nbsp;<asp:LinkButton ID="lnkCp" runat="server" onclick="lnkCp_Click">Change Password</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="lnkLogout" runat="server" onclick="lnkLogout_Click">Sign Out</asp:LinkButton>
        </td>
    </tr>
</table>

