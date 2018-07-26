using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
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
                    if (Request.QueryString.Count > 0)
                    {
                        if (Request.QueryString["val"].ToString() == "reply")
                        {
                            CallConnection1(int.Parse(Request.QueryString["reply"].ToString()), Request.QueryString["val"].ToString());
                        }
                        else if (Request.QueryString["val"].ToString() == "forward")
                        {
                            CallConnection1(int.Parse(Request.QueryString["forward"].ToString()), Request.QueryString["val"].ToString());
                        }
                    }
                    else
                    {
                        CallConnection1(0, "ComposeMail");
                    }
                }
            }
        }
        catch { Response.Redirect("~/Login.aspx"); }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        try
        {
            CallConnection(((sender) as Button).Text);
            Response.Redirect("~/Masters/ViewMail.aspx?Msg='Mail Sent Successfully'");
        }
        catch
        {

        }
    }
    public void CallConnection(string sender)
    {
        string To = "";
        string Cc = "";
        string BCc = "";
        if (TxtTo.Text.Contains(','))
        {
            To = TxtTo.Text.Replace(",", ";");
        }
        else To = TxtTo.Text;
        if (TxtCc.Text.Contains(','))
        {
            Cc = TxtCc.Text.Replace(",", ";");
        }
        else Cc = TxtCc.Text;
        if (TxtBcc.Text.Contains(','))
        {
            BCc = TxtBcc.Text.Replace(",", ";");
        }
        else BCc = TxtBcc.Text;
        ClsSqlConnection obj = new ClsSqlConnection();
        string mailid = "";
        if (Session["ComeFrom"] != null)
        {
            if (Session["ComeFrom"].ToString() == "Drafts")
            {
                mailid = Session["DMaildId"].ToString();
            }
        }
        DataSet ds = obj.Insert(TxtSubject.Text, txtBody.Text, "192.168.1.1", Session["CustomerId"].ToString(), To, Cc, BCc, "", sender, mailid);
        if (ds.Tables.Count > 0)
        {
            Session.Remove("DMaildId");
            Session.Remove("ComeFrom");
        }
    }

    public void CallConnection1(int id, string Type)
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select1(id, Type);
        if (ds.Tables.Count > 0)
        {
            if (Request.QueryString.Count > 0)
            {
                if (Request.QueryString["val"].ToString() == "reply")
                {
                    TxtSubject.Text = ds.Tables[0].Rows[0]["Subject"].ToString();
                    TxtSubject.Enabled = false;
                    TxtTo.Text = ds.Tables[0].Rows[0]["ToEmail"].ToString();
                }
                else if (Request.QueryString["val"].ToString() == "forward")
                {
                    TxtSubject.Text = ds.Tables[0].Rows[0]["Subject"].ToString();
                    TxtSubject.Enabled = false;
                    txtBody.Text = "<br/>---------- Forwarded message ----------<br/>From: " + BindControls.passwordDecrypt(Request.QueryString["From"].ToString(), "encryptionkey") + ds.Tables[0].Rows[0]["Text"].ToString();
                }
            }
            else if (Type == "ComposeMail")
            {
                ViewState["EmailIds"] = ds.Tables[0];
            }
        }
    }

    protected void Discard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Masters/ViewMail.aspx");
    }

    protected void TxtTo_TextChanged(object sender, EventArgs e)
    {
        if (((sender) as TextBox).Text != "")
        {
            ChkEmails(sender);
        }
    }
    public bool ChkEmails(object sender)
    {
        int f1 = 0;
        DataTable dt = (ViewState["EmailIds"] as DataTable);
        bool chk = false;
        string[] sp = ((sender) as TextBox).Text.Split(',');
        for (int i = 0; i < sp.Length; i++)
        {
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                if (dt.Rows[j]["EmailId"].ToString() != sp[i] && sp[i] != "")
                {
                    chk = true;
                    if (!ClientScript.IsStartupScriptRegistered(typeof(Page), "alert"))
                    {
                        string script = "<script>";
                        script += "alert('" + sp[i];
                        script += " Not Exists in DataBase!!";
                        script += "');";
                        script += "</script>";
                        ClientScript.RegisterStartupScript(typeof(Page), "alert", script);
                    }
                    break;
                }
                else
                {
                    f1 = 1;
                    break;
                }
            }
        }
        return chk;
    }
}