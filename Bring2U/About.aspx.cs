using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bring2U
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chart1.Titles.Add("Number of Donations / Zip Code");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedIndex)
            {
                case 0:
                    Chart2.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Bar;
                    break;
                case 1:
                    Chart2.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Pie;
                    break;
                case 2:
                    Chart2.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Area;
                    break;
                default:
                    Chart2.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Column;
                    break;
            }
            switch (DropDownList2.SelectedIndex)
            {
                case 0:
                    SqlDataSource2.SelectCommand = $"SELECT [ZipCode], count([id]) as count FROM [Donation] WHERE Veg = 'True' GROUP BY [ZipCode]";
                    break;
                case 1:
                    SqlDataSource2.SelectCommand = $"SELECT [ZipCode], count([id]) as count FROM [Donation] WHERE Cooked = 'True' GROUP BY [ZipCode]";
                    break;
                case 2:
                    SqlDataSource2.SelectCommand = $"SELECT [ZipCode], sum([Weight]) as count FROM [Donation] GROUP BY [ZipCode]";
                    break;
                case 3:
                    SqlDataSource2.SelectCommand = $"SELECT [ZipCode], count([id]) as count FROM [Donation] WHERE Price IS NOT NULL GROUP BY [ZipCode]";
                    break;
                default:
                    break;
            }
            
            Chart2.DataBind();
        }
    }
}