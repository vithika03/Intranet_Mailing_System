using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
            txtMobileNo.Text = "";
            txtPassword.Text = "";
        }
    }

    protected void Refresh_click(object sender, ImageClickEventArgs e)
    {
        lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
        txtCaptcha.Text = "";
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        CallConnection();
    }

    public void CallConnection()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Insert1(txtFirstName.Text, txtLastName.Text, txtEmailAddress.Text, datepicker.Text, rblGender.SelectedItem.Text, txtMobileNo.Text, txtHint.Text, txtPassword.Text);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["code"].ToString() == "200")
            {
                txtCaptcha.Text = txtFirstName.Text = txtLastName.Text = txtEmailAddress.Text = datepicker.Text = txtMobileNo.Text = txtHint.Text = txtPassword.Text = "";
                rblGender.SelectedIndex = 0;
            }
            else
            {
                lblCaptcha.Text = Guid.NewGuid().ToString().Substring(0, 5);
                txtCaptcha.Text = "";
            }
            lblError.Text = ds.Tables[0].Rows[0]["Message"].ToString();
        }
    }
}