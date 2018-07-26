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
                    BindControls.HoldMailType = "Inbox";
                    CallConnection(lnkInbox.Text);
                    if (Request.QueryString.Count > 0)
                    {
                        lblError.Text = Request.QueryString[0].ToString();
                    }
                    else
                    {
                        lblError.Text = "";
                    }
                }
            }
        }
        catch { Response.Redirect("~/Login.aspx"); }
    }

    public void CallConnection(string MailType)
    {
        if (Session["Data"] == null)
        {
            ClsSqlConnection obj = new ClsSqlConnection();
            DataSet ds = obj.Select(int.Parse(Session["CustomerId"].ToString()), MailType);
            if (ds.Tables.Count > 0)
            {
                BindControls.BindGridView(gvwMails, ds.Tables[0]);
            }
        }
        else if (Session["Data"] != null)
        {
            BindControls.BindGridView(gvwMails, (Session["Data"] as DataSet).Tables[0]);
            Session["Data"] = null;
        }
    }
    public void CallConnectionDelete(int MailDetailId)
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Delete(MailDetailId, BindControls.HoldMailType);
    }
    protected void lnkInbox_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        BindControls.HoldMailType = lnkInbox.Text;
        CallConnection(lnkInbox.Text);
    }
    protected void lnkSendBox_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        BindControls.HoldMailType = "Send";
        CallConnection("Send");
    }
    protected void lnkDrafts_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        BindControls.HoldMailType = lnkDrafts.Text;
        CallConnection(lnkDrafts.Text);
    }
    protected void lnkTrash_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        BindControls.HoldMailType = lnkTrash.Text;
        CallConnection(lnkTrash.Text);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < gvwMails.Rows.Count; i++)
        {
            CheckBox chkSelect = (gvwMails.Rows[i].FindControl("chkSelect") as CheckBox);
            HiddenField hdnMailDetailId = (gvwMails.Rows[i].FindControl("hdnMailDetailId") as HiddenField);
            if (chkSelect.Checked == true)
            {
                CallConnectionDelete(int.Parse(hdnMailDetailId.Value));
            }
        }
        CallConnection(BindControls.HoldMailType);
    }
    protected void lnkComposeMail_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        Response.Redirect("~/ComposeMail.aspx");
    }
    protected void btnReadMail_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        int index = gvr.RowIndex;
        Response.Redirect("~/Masters/ReadMail.aspx?val=" + (gvwMails.Rows[index].FindControl("btnReadMail") as Button).CssClass);
    }
}