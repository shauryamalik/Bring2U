using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Bring2U
{
    public partial class Business : System.Web.UI.Page
    {
        public string uid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] != null && string.Equals("Business", Session["Type"].ToString().Trim()))
            {
                uid = Session["UID"].ToString();
                SqlDataSource1.SelectCommand += $"where UserID='{Session["UID"].ToString()}'";
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string veg = RadioButtonList1.SelectedValue == "Veg" ? "True" : "False";
            string cooked = RadioButtonList2.SelectedValue == "Cooked" ? "True" : "False";
            int price, mrp;

            string selectSQL = "SELECT max(ID) as id from donation";
            int newID, rowsAffected;
            try
            {
                Int32.TryParse(TextBoxPrice.Text, out price);
                Int32.TryParse(TextBoxMRP.Text, out mrp);
                if (!(price <= (0.5 * mrp)))
                    Label1.Text = "Price !< 50% of MRP. Error!";
                else
                {
                    DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Donation");
                    DataRow dr = dt.Rows[0];
                    newID = 0;
                    Int32.TryParse(dr["id"].ToString(), out newID);
                    newID += 1;
                    string insertSQL = $"INSERT INTO DONATION VALUES ({newID}, {Session["UID"].ToString()}, '{TextBox1.Text}', '{veg}'" +
                $", '{TextBox2.Text.ToString()}', '{cooked}', '{Calendar1.SelectedDate.ToString()}'" +
                $", '{TextBox3.Text}', '{TextBox4.Text}', 'False','{TextBoxMRP.Text}', '{TextBoxPrice.Text}')";
                    rowsAffected = DatabaseHelper.sqlInsertUpdateDelete(insertSQL);
                    if (rowsAffected != -1)
                    {
                        Label1.Text = "Submitted!";
                    }
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
}