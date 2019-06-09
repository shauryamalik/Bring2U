using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Bring2U
{
    public partial class SignUpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["UID"] != null)
            {
                Label1.Text = "Somebody is already login. First logout to sign up.";
            }
            else
            {
                string uname = TextBox2.Text;
                string pwd = TextBox3.Text;
                string name = TextBox1.Text;
                string zip = TextBox4.Text;
                string type = RadioButtonList1.SelectedValue;
                string selectSQL = "SELECT max(ID) as id from Users";
                int newID = -1, rowsAffected = -2;
                string insertSQL = string.Empty;
                try
                {
                    DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Users");
                    DataRow dr = dt.Rows[0];
                    newID = 0;
                    Int32.TryParse(dr["id"].ToString(), out newID);
                    newID += 1;
                    insertSQL = $"INSERT INTO Users VALUES ({newID}, '{uname}', '{pwd}', '{type}'" +
                        $", '{zip}', 0, '{name}')";
                    rowsAffected = DatabaseHelper.sqlInsertUpdateDelete(insertSQL);
                    if (rowsAffected != -1)
                    {
                        Session["UID"] = newID.ToString();
                        Session["Username"] = uname;
                        Session["Type"] = type;
                        switch (type)
                        {
                            case "Donor":
                                Response.Redirect("Donor.aspx");
                                break;
                            case "Receiver":
                                Response.Redirect("NewReceiver.aspx");
                                break;
                            case "Business":
                                Response.Redirect("Business.aspx");
                                break;
                            default:
                                Response.Redirect("Donor.aspx");
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error Encountered.";
                }
            }
        }
    }
}