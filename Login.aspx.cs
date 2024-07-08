using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Rudra
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can perform any initialization here
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            CheckCredentials();
        }

        void CheckCredentials()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("SELECT Id, uname FROM udata WHERE mob = @mob AND pw = @pw", connection);
                    command.Parameters.AddWithValue("@mob", txtmob.Text.Trim());
                    command.Parameters.AddWithValue("@pw", txtpw.Text.Trim());
                    command.CommandType = System.Data.CommandType.Text;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Store user information in session variables
                            Session["uid"] = reader["Id"].ToString();
                            Session["name"] = reader["uname"].ToString();
                            // Redirect to the desired page after successful login
                            Response.Redirect("Addtractor.aspx");
                        }
                        else
                        {
                            Response.Write("Invalid credentials.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}
