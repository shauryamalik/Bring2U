using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bring2U
{
    public static class JavaScript
    {
        public static string Serialize(object o)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(o);
        }
    }

    public partial class tempMap : System.Web.UI.Page
    {
        public string[] lats = { };
        public string[] lons = { };
        protected void Page_Load(object sender, EventArgs e)
        {
            string latArr = Request.QueryString["latArr"];
            latArr = latArr.Substring(0, latArr.Length - 1);
            string[] lats = latArr.Split('|');
            string lngArr = Request.QueryString["lngArr"];
            lngArr = lngArr.Substring(0, lngArr.Length - 1);
            string[] lons = lngArr.Split('|');
            //label1.Text = latArr + lngArr;
        }
    }
}