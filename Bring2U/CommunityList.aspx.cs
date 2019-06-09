using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Collections;

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

    public class Timezone {
        public string timezone_identifier { get; set; }
        public string timezone_abbr { get; set; }
        public string utc_offset_sec { get; set; }
        public string is_dst { get; set; }
    }


    public class LatLng
    {
        public string zip_code { get; set; }
        public string lat { get; set; }
        public string lng { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        //public string timezone { get; set; }
        public Timezone timezone { get; set; }
        public List<object> acceptable_city_names { get; set; }
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
            ArrayList al = new ArrayList();

            try
            {
                string strurltest = String.Format("https://www.zipcodeapi.com/rest/f5IB4wk3wmFPSy1yYSSLOT8akirm7MG5BRIHp5pNHJtsGsc9MqumCbL80Vi0BbmI/radius.json/" + pin + "/" + rad + "/" + unit);
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
                    al.Add(p.zip_code);
                }

                //foreach(Object obj in al)
                //{
                //    Label3.Text = (string)obj;
                //}
                LatLngGen(al);
            }
            catch(Exception ex)
            {
                Label3.Text = "We encountered an error in API 1!";
            }
        }

        protected void LatLngGen(ArrayList al)
        {
            try
            {
                string latArr = "";
                string lonArr = "";
                Label3.Text = "";
                //Label3.Text = (string)pin;
                foreach (Object pin in al)
                {
                    string strurltest2 = String.Format("https://www.zipcodeapi.com/rest/f5IB4wk3wmFPSy1yYSSLOT8akirm7MG5BRIHp5pNHJtsGsc9MqumCbL80Vi0BbmI/info.json/" + (string)pin + "/degrees");
                    WebRequest requestObject2 = WebRequest.Create(strurltest2);
                    requestObject2.Method = "GET";
                    HttpWebResponse responseObject2 = null;
                    responseObject2 = (HttpWebResponse)requestObject2.GetResponse();

                    string value2 = null;
                    using (Stream stream2 = responseObject2.GetResponseStream())
                    {
                        StreamReader sr2 = new StreamReader(stream2);
                        value2 = sr2.ReadToEnd();
                        sr2.Close();
                    }

                    var rootObj2 = JsonConvert.DeserializeObject<LatLng>(value2);
                    Label3.Text += "Latitude: "+rootObj2.lat+" - Longitude: "+rootObj2.lng +"\n";
                    latArr += rootObj2.lat + "|";
                    lonArr += rootObj2.lng + "|";
                    //string myScriptValue = "var marker = L.marker(["+ rootObj2.lat + ", "+ rootObj2.lng + "]).addTo(mymap);";
                    //ScriptManager.RegisterClientScriptBlock("GetDirections.html", this.GetType(), "mapScript", false, true);
                }
                //mapframe.Attributes.Add("src", "tempMap.aspx?latArr="+latArr+"&lngArr="+lonArr);
            }
            catch (Exception exc)
            {
                Label3.Text = "We encountered an error in API 2!";
            }
        }
    }
}