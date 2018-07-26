using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Masters_ViewMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Login"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    CallConnection(int.Parse(Request.QueryString["val"].ToString()), "ReadMail");
                }
            }
        }
        catch { Response.Redirect("~/Login.aspx"); }
    }

    public void CallConnection(int id, string MailType)
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select(id, MailType);
        Session["Data"] = ds;
        if (MailType == "ReadMail")
        {
            if (ds.Tables.Count > 0)
            {
                BindControls.BindFormView(frmReadMail, ds.Tables[0]);
            }
        }
        else
        {
            Response.Redirect("~/Masters/ViewMail.aspx");
        }
    }
    public void CallConnectionDelete(int MailDetailId)
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Delete(MailDetailId, BindControls.HoldMailType);
    }
    protected void lnkInbox_Click(object sender, EventArgs e)
    {
        BindControls.HoldMailType = lnkInbox.Text;
        CallConnection(int.Parse(Session["CustomerId"].ToString()), lnkInbox.Text);
    }
    protected void lnkSendBox_Click(object sender, EventArgs e)
    {
        BindControls.HoldMailType = "Send";
        CallConnection(int.Parse(Session["CustomerId"].ToString()), "Send");
    }
    protected void lnkDrafts_Click(object sender, EventArgs e)
    {
        BindControls.HoldMailType = lnkDrafts.Text;
        CallConnection(int.Parse(Session["CustomerId"].ToString()), lnkDrafts.Text);
    }
    protected void lnkTrash_Click(object sender, EventArgs e)
    {
        BindControls.HoldMailType = lnkTrash.Text;
        CallConnection(int.Parse(Session["CustomerId"].ToString()), lnkTrash.Text);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //for (int i = 0; i < gvwMails.Rows.Count; i++)
        //{
        //    CheckBox chkSelect = (gvwMails.Rows[i].FindControl("chkSelect") as CheckBox);
        //    HiddenField hdnMailDetailId = (gvwMails.Rows[i].FindControl("hdnMailDetailId") as HiddenField);
        //    if (chkSelect.Checked == true)
        //    {
        //        CallConnectionDelete(int.Parse(hdnMailDetailId.Value));
        //    }
        //}
        //CallConnection(BindControls.HoldMailType);
    }
    protected void lnkComposeMail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ComposeMail.aspx");
    }
    protected void btnReply_Click(object sender, EventArgs e)
    {
        Session["DMaildId"] = (frmReadMail.Row.FindControl("hdnMailId") as HiddenField).Value;
        Session["ComeFrom"] = (frmReadMail.Row.FindControl("Label1") as Label).Text;
        Response.Redirect("~/ComposeMail.aspx?val=reply&reply=" + int.Parse((frmReadMail.Row.FindControl("hdnMailId") as HiddenField).Value));
    }
    protected void btnForward_Click(object sender, EventArgs e)
    {
        Session["DMaildId"] = int.Parse((frmReadMail.Row.FindControl("hdnMailId") as HiddenField).Value);
        Session["ComeFrom"] = int.Parse((frmReadMail.Row.FindControl("Label1") as Label).Text);
        Response.Redirect("~/ComposeMail.aspx?val=forward&forward=" + int.Parse(Request.QueryString["val"].ToString()) + "&From=" + BindControls.passwordEncrypt((frmReadMail.Row.FindControl("Label3") as Label).Text, "encryptionkey"));
    }
}