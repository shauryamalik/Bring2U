using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Bring2U
{
    public class PinCodes
    {

        public List<Pins> zip_codes { get; set; }
    }

    public class Pins
    {

        public string zip_code { get; set; }
        public string distance { get; set; }
        public string city { get; set; }
        public string state { get; set; }
    }


    public partial class CommunityList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pin = TextBox1.Text;
            string rad = TextBox2.Text;
            string unit = DropDownList1.SelectedValue;

            string strurltest = String.Format("https://www.zipcodeapi.com/rest/XnWTSC213JzEu3yJjQNQ5Jf2dJXJpMCnbAnrg5iVMJRKHpSnqTqn8bqYxCosKnCL/radius.json/" + pin + "/" + rad + "/" + unit);
            WebRequest requestObject = WebRequest.Create(strurltest);
            requestObject.Method = "GET";
            HttpWebResponse responseObject = null;
            responseObject = (HttpWebResponse)requestObject.GetResponse();

            string value = null;
            using (Stream stream = responseObject.GetResponseStream())
            {
                StreamReader sr = new StreamReader(stream);
                value = sr.ReadToEnd();
                sr.Close();
            }

            var rootObj = JsonConvert.DeserializeObject<PinCodes>(value);
            Label3.Text = "";
            foreach (Pins p in rootObj.zip_codes)
            {
                Label3.Text += "Zip Code: " + p.zip_code + " - City: " + p.city + " - State: " + p.state + " - Distance from Zip Code: " + p.distance + " " + DropDownList1.SelectedValue + "<br/>";
            }

        }
    }
}