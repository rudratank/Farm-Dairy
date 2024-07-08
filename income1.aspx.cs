using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Rudra
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdowns();
                BindIncomeRecords();
            }
        }

        private void BindDropdowns()
        {
            // Implement code to bind dropdown lists here if needed
        }

        private void BindIncomeRecords()
        {
            try
            {
                string userId = Session["uid"] as string;

                string query = "SELECT [catagory], [type], [trans], [amount] FROM [income] WHERE [uid] = @uid";
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        private void InsertIncomeRecord()
        {
            try
            {
                string userId = Session["uid"] as string;
                string query = "INSERT INTO income (uid, date, catagory, type, trans, amount) VALUES (@uid, @date, @cat, @type, @trans, @amo)";
                using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(userId));
                    cmd.Parameters.AddWithValue("@date", Txtdate.Text.Trim());
                    cmd.Parameters.AddWithValue("@cat", ddlcat.SelectedValue);
                    cmd.Parameters.AddWithValue("@type", ddlbreed.SelectedValue);
                    cmd.Parameters.AddWithValue("@trans", ddlgen.SelectedValue);
                    cmd.Parameters.AddWithValue("@amo", Convert.ToInt32(txtamount.Text.Trim()));
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                Label1.Visible = true;
                BindIncomeRecords();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void Btnincome_Click(object sender, EventArgs e)
        {
            InsertIncomeRecord();
        }

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] transtract = { "Cultivation", "Fuel", "Service", "Lubrication", "Thresher", "Harvesting", "Rentel", "Tyre", "tranpotation", "Other" };
            string[] translive = { "Feed", "Compost", "Loading", "Veterinary Sevices", "Milkproduction", "Other" };

            ddlbreed.Items.Clear();
            switch (ddlcat.SelectedItem.Text.Trim())
            {
                case "Tractor":
                    ddlgen.DataSource = transtract;
                    ddlgen.DataBind();
                    tract_add();
                    break;

                case "Livestock":
                    ddlgen.DataSource = translive;
                    ddlgen.DataBind();
                    livestock_add();
                    break;
                default: break;
            }
        }

        private void tract_add()
        {
            try
            {
                string userId = Session["uid"] as string;
                string query = "SELECT * FROM tractor WHERE uid = @uid";
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            ddlbreed.Items.Add(reader["name"].ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        private void livestock_add()
        {
            try
            {
                string userId = Session["uid"] as string;
                string query = "SELECT * FROM livestock WHERE uid = @uid";
                using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@uid", userId);
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (reader.HasRows)
                        {
                            ddlbreed.Items.Add(reader["name"].ToString());
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
