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
    /*
     * 1. Ella mugith :) 
     * 2. Validation saha haakidde
     * 3. Name - only alphabets (upper and lower case) with spaces allowed with minimum of 3 letters and maximum of 50 letters
     * 4. Phone number - 10 digits - starting with 8 or 9 - any other characters not allowed
     * 5. Amount - only digits - number of digits restriction haaklilla - so customer 000000000000000000000 kotru thakanath :P
     * 6. Card number - 16 digits - bere enu thakanthilla
     * 7. Name on the Card - Same as Name
     * 8. Valid till - 2 digits / 2 digits - ide format
     * 9. CVV - only 3 digits - 000 kotru thakanath :P
     * 10. Submit button - yaavdaadru ond field khali idru thakanathilla. ella filed fill aay validation pass aadre maathra successful ankand barath.
     *                      illa andre failure message barath.
     *                      next field ge hoikaadre aa field al en validation itho adanna check maadi munde hoilak!
     *                      
     *              Hope this helps :)
     *              
     *              Mankanthe :)
     *              You too sleep well :)
     *              idanna odidr mele delete maad :P (e comment section full)
     *              
     *              If u find any bugs or any errors, let me know! I'll fix those as soon as possible!
     *              
     *              See ya :)
     *              
     *              Run maadi kaan ond sati. It worked perfectly fine when I tested.
     *              
     *              Shubharaathri :) zzzzzzzzzzzzzzzzzzzzzzz
     *              
     *              I'm disconnecting from your system.
     *              
     */
}