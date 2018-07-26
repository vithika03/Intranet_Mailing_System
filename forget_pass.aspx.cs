using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class forget_pass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }
    protected void next_Click(object sender, EventArgs e)
    {
        CallConnection();
    }

    public void CallConnection()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select(Email_id.Text, "", txtRecoveryHint.Text, "ChkHint");
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["Code"].ToString() == "200")
            {
                Session["Login"] = ds.Tables[0].Rows[0]["Login"].ToString();
                confirm_pass.Visible = true;
                new_pass.Visible = true;
                newpass.Visible = true;
                conpass.Visible = true;
                change.Visible = true;
                pnlFP.Visible = pnlFP.Enabled = false;
            }
            else if (ds.Tables[0].Rows[0]["Code"].ToString() == "404")
            {
                confirm_pass.Visible = false;
                new_pass.Visible = false;
                newpass.Visible = false;
                conpass.Visible = false;
                change.Visible = false;
                pnlFP.Visible = pnlFP.Enabled = true;
                lblError.Text = ds.Tables[0].Rows[0]["Message"].ToString();
            }
        }
    }

    public void CallConnection1()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select(Email_id.Text, newpass.Text, "", "ForgotPassword");
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["Code"].ToString() == "200")
            {
                Session["Login"] = ds.Tables[0].Rows[0]["Login"].ToString();
                lblError.Text = ds.Tables[0].Rows[0]["Message"].ToString();
            }
        }
    }
    protected void change_Click(object sender, EventArgs e)
    {
        CallConnection1();
    }
}