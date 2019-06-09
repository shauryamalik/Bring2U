using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Bring2U
{
    public partial class SiteMaster : MasterPage
    {
        public string logStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] != null && Session["Username"] != null)
            {
                logStatus = "Logout " + Session["Username"].ToString();
                if (string.Equals("Donor", Session["Type"].ToString().Trim()))
                {
                    string selectSQL2 = "Select Donations from Users where Id=" + Session["UID"].ToString() + " and Type='Donor'";

                    DataTable dt2 = DatabaseHelper.sqlSearch(selectSQL2, "Users");
                    DataRow dr2 = dt2.Rows[0];

                    int numDon = -1;
                    Int32.TryParse(dr2["Donations"].ToString(), out numDon);
                    if (numDon > 0)
                        logStatus += "(" + numDon.ToString() + ")";
                }
                homebuttonnav.HRef = Session["Type"].ToString().Trim() + ".aspx";
            }
            else
            {
                logStatus = "Login";
            }

        }

        protected void logoutClick(object sender, EventArgs e)
        {
            if (!(Session["UID"] == null && Session["Username"] == null))
            {
                Session.RemoveAll();
                logStatus = "Login";
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Redirect("GetStarted.aspx");
            }
        }
    }
}