using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace Rudra
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindIncomeRecords();
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            // Generate PDF
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document();
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                document.Open();
                PdfPTable pdfTable = new PdfPTable(GridView1.HeaderRow.Cells.Count);
                // Add headers from GridView
                foreach (TableCell headerCell in GridView1.HeaderRow.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text));
                    pdfTable.AddCell(pdfCell);
                }
                // Add rows from GridView
                foreach (GridViewRow gridViewRow in GridView1.Rows)
                {
                    foreach (TableCell tableCell in gridViewRow.Cells)
                    {
                        PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text));
                        pdfTable.AddCell(pdfCell);
                    }
                }
                document.Add(pdfTable);

                // Add total income as a footer
                Paragraph footer = new Paragraph("Total Income: " + lblTotalIncome.Text);
                footer.Alignment = Element.ALIGN_RIGHT;
                document.Add(footer);

                document.Close();
                byte[] bytes = ms.ToArray();

                // Download the PDF file
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=IncomeReport.pdf");
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
            }
        }

        private void BindIncomeRecords()
        {
            try
            {
                string userId = Session["uid"] as string;

                if (string.IsNullOrEmpty(userId))
                {
                    Response.Write("User ID is null or empty");
                    return;
                }

                string query = "SELECT [date], [catagory], [type], [trans], [amount] FROM [income] WHERE [uid] = @uid";
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.HasRows)
                        {
                            Response.Write("No data found for the specified user.");
                            return;
                        }

                        GridView1.DataSource = reader;
                        GridView1.DataBind();

                        // Move reader to start and calculate the total income
                        reader.Close();

                        cmd = new SqlCommand(query, connection);
                        cmd.Parameters.AddWithValue("@uid", userId);
                        using (SqlDataReader totalReader = cmd.ExecuteReader())
                        {
                            int totalIncome = 0;
                            while (totalReader.Read())
                            {
                                int amount = Convert.ToInt32(totalReader["amount"]);
                                if (amount > 0) // Assuming positive values are income
                                {
                                    totalIncome += amount;
                                }
                            }
                            lblTotalIncome.Text = totalIncome.ToString("C"); // Format as currency
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
