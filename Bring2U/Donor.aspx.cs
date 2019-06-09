using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Bring2U
{
    public partial class Donor : System.Web.UI.Page
    {
        public string uid;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UID"] != null && string.Equals("Donor", Session["Type"].ToString().Trim()))
                {
                    uid = Session["UID"].ToString();
                    SqlDataSource1.SelectCommand += $"where UserID='{Session["UID"].ToString()}'";
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch(Exception exc)
            {
                Console.WriteLine("Error" + exc.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string veg = RadioButtonList1.SelectedValue == "Veg" ? "True" : "False";
            string cooked = RadioButtonList2.SelectedValue == "Cooked" ? "True" : "False";

            string selectSQL = "SELECT max(ID) as id from donation";
            string selectSQL2 = "Select Donations from Users where Id=" + Session["UID"].ToString() + " and Type='Donor'";
            int newID, rowsAffected, numDon;
            try
            {
                DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Donation");
                DataTable dt2 = DatabaseHelper.sqlSearch(selectSQL2, "Users");
                DataRow dr = dt.Rows[0];
                DataRow dr2 = dt2.Rows[0];
                newID = 0;
                Int32.TryParse(dr["id"].ToString(), out newID);
                newID += 1;
                string insertSQL = $"INSERT INTO DONATION VALUES ({newID}, {Session["UID"].ToString()}, '{TextBox1.Text}', '{veg}'" +
            $", '{TextBox2.Text.ToString()}', '{cooked}', '{Calendar1.SelectedDate.ToString()}'" +
            $", '{TextBox3.Text}', '{TextBox4.Text}', 'False', null, null)";
                rowsAffected = DatabaseHelper.sqlInsertUpdateDelete(insertSQL);
                if (rowsAffected != -1)
                {
                    Label1.Text = "Submitted!";
                }
                numDon = 0;
                Int32.TryParse(dr2["Donations"].ToString(), out numDon);
                numDon += 1;
                string updateSQL2 = "UPDATE Users SET Donations = "+numDon+" WHERE Id="+ Session["UID"].ToString();
                rowsAffected = DatabaseHelper.sqlInsertUpdateDelete(updateSQL2);
                if (rowsAffected != -1)
                {
                    Label1.Text += "\nCoins Added!";
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            string selectSQL = "SELECT name,donations from users where Id=" + Session["UID"].ToString() + " and Type='Donor'";
            string name = string.Empty;
            int count = -1;

            try
            {
                DataTable dt = DatabaseHelper.sqlSearch(selectSQL, "Users");
                DataRow dr = dt.Rows[0];
                name = dr["Name"].ToString().Trim();
                Int32.TryParse(dr["donations"].ToString(), out count);

                if (count >= 5)
                {
                    Label2.Text = "Successful";
                    certgen(name, count);
                }
                else
                {
                    Label2.Text = "You don't have that many donations right now";
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void certgen(string name, int count)
        {
            string startupPath = AppDomain.CurrentDomain.BaseDirectory;

            try
            {
                Document pdfDoc = new Document(iTextSharp.text.PageSize.A4.Rotate(), 50, 50, 50, 50);
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                Paragraph Text = new Paragraph("COMMUNITY SERVICE CERTIFICATE");
                Text.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(Text);
                Paragraph Text1 = new Paragraph("\n\n\n\n");
                pdfDoc.Add(Text1);
                Paragraph Text2 = new Paragraph(name + " HAS COMPLETED " + count + " DONATIONS");
                Text2.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(Text2);
                Paragraph Text3 = new Paragraph("\n\n\n");
                pdfDoc.Add(Text3);

                Paragraph Text4 = new Paragraph("THANK YOU FOR YOUR CONTRIBUTION TO THE SOCIETY");
                Text4.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(Text4);
                Paragraph Text5 = new Paragraph("\n\n\n\n");
                pdfDoc.Add(Text5);

                Paragraph Text6 = new Paragraph("BRING2U AFFILIATED WITH AND SUPPORTED BY");
                Text6.Alignment = Element.ALIGN_CENTER;
                pdfDoc.Add(Text6);
                Paragraph Text7 = new Paragraph("\n");
                pdfDoc.Add(Text7);


                string imageURL = startupPath + "/logo/FFH.jpg";
                string imageURL2 = startupPath + "/logo/FBNYC.png";
                string imageURL3 = startupPath + "/logo/FA.png";
                string imageURL4 = startupPath + "/logo/logos1.jpg";
                string imageURL5 = startupPath + "/logo/logos3.jpg";
                string imageURL6 = startupPath + "/logo/logos2.jpg";

                iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageURL);
                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageURL2);
                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageURL3);
                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageURL4);
                iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageURL5);
                iTextSharp.text.Image jpg6 = iTextSharp.text.Image.GetInstance(imageURL6);
                //Resize image depend upon your need

                jpg.ScaleToFit(200f, 150f);
                jpg2.ScaleToFit(200f, 150f);
                jpg3.ScaleToFit(200f, 150f);
                jpg4.ScaleToFit(200f, 150f);
                jpg5.ScaleToFit(200f, 150f);
                jpg6.ScaleToFit(200f, 150f);
                //Give space before image

                jpg.SpacingBefore = 5f;
                jpg2.SpacingBefore = 5f;
                jpg3.SpacingBefore = 5f;
                jpg4.SpacingBefore = 5f;
                jpg5.SpacingBefore = 5f;
                jpg6.SpacingBefore = 5f;
                //Give some space after the image

                jpg.SpacingAfter = 5f;
                jpg2.SpacingAfter = 5f;
                jpg3.SpacingAfter = 5f;
                jpg4.SpacingAfter = 5f;
                jpg5.SpacingAfter = 5f;
                jpg6.SpacingAfter = 5f;

                jpg.Alignment = Element.ALIGN_CENTER;
                jpg2.Alignment = Element.ALIGN_CENTER;
                jpg3.Alignment = Element.ALIGN_CENTER;
                jpg4.Alignment = Element.ALIGN_CENTER;
                jpg5.Alignment = Element.ALIGN_CENTER;
                jpg6.Alignment = Element.ALIGN_CENTER;

                PdfPTable table = new PdfPTable(3);
                PdfPCell cell = new PdfPCell();
                PdfPCell cell2 = new PdfPCell();
                PdfPCell cell3 = new PdfPCell();
                PdfPCell cell4 = new PdfPCell();
                PdfPCell cell5 = new PdfPCell();
                PdfPCell cell6 = new PdfPCell();

                cell.BorderWidth = 0;
                cell2.BorderWidth = 0;
                cell3.BorderWidth = 0;
                cell4.BorderWidth = 0;
                cell5.BorderWidth = 0;
                cell6.BorderWidth = 0;

                //cell4.Colspan = 3;                            

                cell.AddElement(jpg);
                table.AddCell(cell);
                cell2.AddElement(jpg2);
                table.AddCell(cell2);
                cell3.AddElement(jpg3);
                table.AddCell(cell3);
                cell4.AddElement(jpg4);
                table.AddCell(cell4);
                cell5.AddElement(jpg5);
                table.AddCell(cell5);
                cell6.AddElement(jpg6);
                table.AddCell(cell6);
                pdfDoc.Add(table);

                pdfWriter.CloseStream = false;
                pdfDoc.Close();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=DonationCertificate.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
};