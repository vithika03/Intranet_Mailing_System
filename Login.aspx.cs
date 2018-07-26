using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
        }
    }
    protected void Login_click(object sender, EventArgs e)
    {
        if (txtCaptcha.Text != lblCaptcha.Text)
        {
            lblError.Text = "Invalid Captcha";
            lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
            txtCaptcha.Text = "";
            return;
        }
        else
        {
            CallConnection();
        }
    }
    protected void Refresh_click(object sender, ImageClickEventArgs e)
    {
        lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
        txtCaptcha.Text = "";
    }
    public void CallConnection()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select(txtLoginId.Text, txtPassword.Text, txtPassword.Text, "Login");
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["Code"].ToString() == "200")
            {
                Session["Login"] = ds.Tables[0].Rows[0]["Login"].ToString();
                Session["CustomerId"] = ds.Tables[0].Rows[0]["CustomerId"].ToString();
                if (txtLoginId.Text == "12345@g.c")
                {
                    Response.Redirect("~/Reports/RegisterUserReport.aspx");
                }
                else
                {
                    Response.Redirect("~/Masters/ViewMail.aspx");
                }
            }
            else if (ds.Tables[0].Rows[0]["Code"].ToString() == "404")
            {
                lblError.Text = ds.Tables[0].Rows[0]["Message"].ToString();
                lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
                txtCaptcha.Text = "";
                txtPassword.Text = "";
                return;
            }
        }
    }
    protected void btnFP_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/forget_pass.aspx");
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register.aspx");

    }
}