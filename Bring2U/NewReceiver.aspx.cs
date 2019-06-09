using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

namespace Bring2U
{
    public partial class NewReceiver : System.Web.UI.Page
    {
        public string uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] != null && string.Equals("Receiver", Session["Type"].ToString().Trim()))
            {
                uid = Session["UID"].ToString();
                //SqlDataSource1.SelectCommand += $"where UserID='{Session["UID"].ToString()}'";
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            this.EnableViewState = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string typefood = "NULL";
            string typeprice = "NULL";
            string selectSQL = string.Empty;

            if (togBtn.Checked == true)
                typefood = "True";
            else
                typefood = "False";

            if (togBtn2.Checked == true)
                typeprice = "FREE";
            else
                typeprice = "PAID";

            //Label1.Text = "Selected values are " + typefood + " and " + typeprice;

            if (typeprice == "PAID")
                selectSQL = "SELECT ItemName,ExpiryDate from Donation where Veg='" + typefood + "' and Price IS NOT NULL";
            else
                selectSQL = "SELECT ItemName,ExpiryDate from Donation where Veg='" + typefood + "' and Price IS NULL";

            try
            {
                DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Donation");
                int count = dt.Rows.Count;
                for (int i = 0; i < count; i++)
                {
                    DataRow dr = dt.Rows[i];
                    string name = dr["ItemName"].ToString();
                    string expdate = dr["ExpiryDate"].ToString();

                    GenerateControls(i, name, expdate);
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void GenerateControls(int i, string name, string expdate)
        {
                HtmlGenericControl NewControl = new HtmlGenericControl("div");
                //Button b = new Button();
                //b.Text = "Book" +i;
                //b.ID = "food" + i;
                Label foodname = new Label();
                Label expiryDate = new Label();
                foodname.Text = name;
                expiryDate.Text = "\t" + expdate;
                CheckBox book = new CheckBox();
                book.ID = "check" + i;
                //book.Text = "check" + i;
                //b.Click += new EventHandler((s, e1) => DynamicButton_Click(s, e1, i, foodname.Text, expiryDate.Text));

                // Set the properties of the new HtmlGenericControl control.
                NewControl.ID = "NewControl" + i;
                //NewControl.InnerHtml = "This is a dynamically created HTML server control with id="+i;
                NewControl.Style.Add("padding", "10px");
                PlaceHolder1.Controls.Add(NewControl);
                //NewControl.Controls.Add(b);
                NewControl.Controls.Add(foodname);
                NewControl.Controls.Add(expiryDate);
                NewControl.Controls.Add(book);
                //NewControl.Controls.Add(b);
        }

        protected void BookButton_Click()
        {
            for (int i = 0; i < 7; i++)
            {
                HtmlGenericControl NewControlnew;
                CheckBox chk = (CheckBox)FindControl("check" + i);
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        NewControlnew = new HtmlGenericControl("div");
                        NewControlnew.ID = "NewControl" + i;
                        //NewControl.InnerHtml = "This is a dynamically created HTML server control with id="+i;
                        NewControlnew.Style.Add("padding", "10px");
                        PlaceHolder2.Controls.Add(NewControlnew);
                    }
                }
            }
            //    HtmlGenericControl NewControl = new HtmlGenericControl("div");
            //Label foodname1 = new Label();
            //Label expiryDate1 = new Label();
            //foodname1.Text = foodname + i;
            //expiryDate1.Text = "\t" +expiryDate + i;

            //// Set the properties of the new HtmlGenericControl control.
            //NewControl.ID = "NewControl" + i;
            ////NewControl.InnerHtml = "This is a dynamically created HTML server control with id="+i;
            //NewControl.Style.Add("padding", "10px");
            //PlaceHolder2.Controls.Add(NewControl);
            //NewControl.Controls.Add(foodname1);
            //NewControl.Controls.Add(expiryDate1);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            BookButton_Click();
        }
    }
}