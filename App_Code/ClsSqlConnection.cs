using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for ClsSqlConnection
/// </summary>
public class ClsSqlConnection
{
    SqlConnection con;
    SqlCommand cmd;
    DataTable dt = new DataTable();
    DataSet ds;
    SqlDataAdapter dap;

    public DataSet Select(int Receiver, string MailStatus)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spViewMails '" + Receiver + "','" + MailStatus + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Select(string Procname)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand(Procname, con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Select1(int MailId, string Type)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spReadData '" + MailId + "','" + Type + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Select(string LoginId, string Password, string OldPassword, string Type)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spChkLogin '" + LoginId + "','" + Password + "','" + OldPassword + "','" + Type + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Insert(string Subject, string Message, string IPAddress, string Sender, string ToReceiver, string CcReceiver, string BccReceiver, string Attachments, string BtnText, string MailId)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spInsertMails '" + Subject + "','" + Message + "','" + IPAddress + "','" + Sender + "','" + ToReceiver + "','" + CcReceiver + "','" + BccReceiver + "','" + BtnText + "','" + MailId + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Insert1(string FirstName, string LastName, string EmailId, string DOB, string Gender, string Mobile, string ForgetPassHint, string Password)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spRegisterCustomer '" + FirstName + "','" + LastName + "','" + EmailId + "','" + DOB + "','" + Gender + "','" + Mobile + "','" + ForgetPassHint + "','" + Password + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }

    public DataSet Delete(int MailDetailId, string MailStatus)
    {
        try
        {
            con = new SqlConnection("Server=.;database=MailingSystem;uid=sa;pwd=server");
            cmd = new SqlCommand("spDeleteMails '" + MailDetailId + "','" + MailStatus + "'", con);
            dap = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dap.Fill(ds);
        }
        catch { }
        finally
        {
            con = null;
            cmd = null;
            dap = null;
        }
        return ds;
    }
}