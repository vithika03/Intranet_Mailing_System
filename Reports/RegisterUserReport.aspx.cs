using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Reports_RegisterUserReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CallConnection();
        }
    }
    public void CallConnection()
    {
        ClsSqlConnection obj = new ClsSqlConnection();
        DataSet ds = obj.Select("spRegisterUserReport");
        if (ds.Tables.Count > 0)
        {
            BindControls.BindGridView(gvwUsers, ds.Tables[0]);
        }
    }
}