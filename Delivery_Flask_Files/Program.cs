using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;
using System.Web.Script;
using System.Web.Script.Serialization;


namespace ConsoleApplication6
{
    class Class1
    {
        static void Main(string[] args)
        {
            try
            {

                String st = System.IO.File.ReadAllText("C:/Users/raksh/Desktop/Honeywell_Hackathon/flask_app/tmp.csv");
                
                string[] line_list = st.Split("\n");
                
                string[] lat = new string[line_list.Length];
                string[] lon = new string[line_list.Length];
                
                int i = 0;
                foreach (string line in line_list)
                {
                    if (i < (line_list.Length-1))
                    {
                        


                        string[] gps_list = line.Split(",");


                        lat[i] = gps_list[0];
                        lon[i] = gps_list[1];

                        i++;

                        
                    }
                        
                        
                }
                string serializedLat = (new JavaScriptSerializer()).Serialize(lat);
                string serializedLong = (new JavaScriptSerializer()).Serialize(lon);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mapMarket", "buildMapWithMarkers('map_market', " + serializedLat + ", " + serializedLong + ", " + "false" + ");", true);

            }
            catch (Exception e)
            {
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(e.Message);
            }
            Console.Read();
        }
    }
}
