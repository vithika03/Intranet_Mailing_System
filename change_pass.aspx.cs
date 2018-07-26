using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class change_pass : System.Web.UI.Page
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

            }
        }
        catch { Response.Redirect("~/Login.aspx"); }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        if (Session["Login"] != null)
            CallConnection();
    }
    public void CallConnection()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select(Session["Login"].ToString(), newpass.Text, currpass.Text, "ChangePassword");
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["Code"].ToString() == "200")
            {
                Session["Login"] = ds.Tables[0].Rows[0]["Login"].ToString();
                Response.Redirect("~/Masters/ViewMail.aspx");
            }
            else if (ds.Tables[0].Rows[0]["Code"].ToString() == "404")
            {
                lblError.Text = ds.Tables[0].Rows[0]["Message"].ToString();
            }
        }
    }
}