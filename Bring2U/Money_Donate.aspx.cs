using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bring2U
{
    public partial class Money_Donate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Display(object sender, EventArgs e)
        {
            if ((TextBox1.Text.Length > 0) && (TextBox2.Text.Length > 0) && (TextBox3.Text.Length > 0) && (TextBox4.Text.Length > 0) && (TextBox5.Text.Length > 0) && (TextBox6.Text.Length > 0) && (TextBox7.Text.Length > 0))
            {
                string message = "Thank you for your generous contribution!";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                /////new page
            }
            else
            {
                string message1 = "Please fill all the details!";
                string script1 = "window.onload = function(){ alert('";
                script1 += message1;
                script1 += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "FailureMessage", script1, true);
            }
        }

    }
    
}