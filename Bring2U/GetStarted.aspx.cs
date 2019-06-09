using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Bring2U
{
    public partial class GetStarted : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string uname = username.Value;
                string pwd = password.Value;
                string selectSQL = $"SELECT * from Users where username='{uname}'";
                DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Users");
                DataRow dr = dt.Rows[0];
                if(string.Equals(pwd,dr["Password"].ToString().Trim()))
                {
                    Session["UID"] = dr["Id"].ToString();
                    Session["Username"] = dr["Username"].ToString();
                    Session["Type"] = dr["Type"].ToString();
                    switch (dr["Type"].ToString().Trim())
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
                Console.WriteLine(ex.Message);
            }
        }

        protected void BtnSignup_Click(object sender, EventArgs e)
        {
            string uname = uname2.Value;
            string pwd = pwd2.Value; 
            string name = name2.Value; 
            string zip = zip2.Value;
            string type = string.Empty;
            if (DonorRadio.Checked)
            {
                type = "Donor";
            }else if (ReceiverRadio.Checked)
            {
                type = "Receiver";
            }else if (BusinessRadio.Checked)
            {
                type = "Business";
            }
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
            catch(Exception ex)
            {

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpPage.aspx");
        }
    }
}