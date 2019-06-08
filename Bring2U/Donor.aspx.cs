using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Bring2U
{
    public partial class Donor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string veg = RadioButtonList1.SelectedValue == "Veg" ? "True" : "False";
            string cooked = RadioButtonList2.SelectedValue == "Cooked" ? "True" : "False";

            string selectSQL = "SELECT max(ID) as id from donation";
            int newID, rowsAffected;
            try
            {
                DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Donation");
                DataRow dr = dt.Rows[0];
                newID = 0;
                Int32.TryParse(dr["id"].ToString(), out newID);
                newID += 1;
                        string insertSQL = $"INSERT INTO DONATION VALUES ({newID}, 10, '{TextBox1.Text}', '{veg}'" +
                    $", '{TextBox2.Text.ToString()}', '{cooked}', '{Calendar1.SelectedDate.ToString()}'" +
                    $", '{TextBox3.Text}', '{TextBox4.Text}', 'False', null, null)";
                rowsAffected = DatabaseHelper.sqlInsertUpdateDelete(insertSQL);
                if (rowsAffected != -1)
                {
                    Label1.Text = "Submitted!";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error!";
                Console.WriteLine(ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();   
        }
    }
};