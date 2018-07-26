using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
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
                    lblLogin.Text = Session["Login"].ToString();
                }
            }
        }
        catch { Response.Redirect("~/Login.aspx"); }
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Logout.aspx");
    }
    protected void lnkCp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/change_pass.aspx");
    }
}