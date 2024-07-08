using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Rudra
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            InsertUser();
        }

        private void InsertUser()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;
            string query = "INSERT INTO udata (uname, email, mob, pw) VALUES (@uname, @Email, @Mob, @Pw)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@uname", txtnm.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txteml.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mob", txtmob.Text.Trim());
                    cmd.Parameters.AddWithValue("@Pw", txtpw.Text.Trim());

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Label1.Visible = true;
                        Response.Write("User successfully registered.");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("An error occurred while registering the user. Please try again later.");
                      
                    }
                }
            }
        }
    }
}
