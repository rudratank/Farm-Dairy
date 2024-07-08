using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Rudra
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        void tract_add()
        {
            try
            {
                SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString);
                string userId = Session["uid"] as string;
                SqlCommand cmd = new SqlCommand("select * from tractor where uid=@uid", connection);
                cmd.Parameters.AddWithValue("@uid", userId);
                cmd.Connection = connection;
                cmd.CommandType = System.Data.CommandType.Text;
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        ddlbreed.Items.Add(reader["name"].ToString());
                    }
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        void livestock_add()
        {
            try
            {
                SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString);
                string userId = Session["uid"] as string;
                SqlCommand cmd = new SqlCommand("select * from livestock where uid=@uid", connection);
                cmd.Parameters.AddWithValue("@uid", userId);
                cmd.Connection = connection;
                cmd.CommandType = System.Data.CommandType.Text;
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        ddlbreed.Items.Add(reader["name"].ToString());
                    }
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void ddlbreed_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ddlbreed.Items.Clear();
        }

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] transtract = { "Cultivation", "Fuel", "Service", "Lubrication", "Thresher", "Harvesting", "Rentel", "Tyre", "tranpotation", "Other" };
            string[] translive = { "Feed", "Compost", "Loading", "Veterinary Sevices", "Milkproduction", "Other" };

            ddlbreed.Items.Clear();
            switch (ddlcat.SelectedItem.Text.Trim())
            {
                case "Tractor":
                    ddlbreed.Items.Clear();
                    ddlgen.DataSource = transtract;
                    ddlgen.DataBind();
                    tract_add();
                    break;

                case "Livestock":
                    ddlbreed.Items.Clear();
                    ddlgen.DataSource = translive;
                    ddlgen.DataBind();
                    livestock_add();
                    break;
                default: break;
            }
        }
        void insert()
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString);
                string userId = Session["uid"] as string;
                SqlCommand cmd = new SqlCommand("insert into income (uid,date,catagory,type,trans,amount) values(@uid,@date,@cat,@type,@trans,@amo)");
                cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(userId));
                cmd.Parameters.AddWithValue("@date", Txtdate.Text.Trim());
                cmd.Parameters.AddWithValue("@cat", ddlcat.SelectedValue);
                cmd.Parameters.AddWithValue("@type", ddlbreed.SelectedValue);
                cmd.Parameters.AddWithValue("@trans", ddlgen.SelectedValue);
                cmd.Parameters.AddWithValue("@amo", Convert.ToInt32(txtamount.Text.Trim()));
                cmd.Connection = con;
                cmd.CommandType = System.Data.CommandType.Text;
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Visible = true;
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void Btnincome_Click(object sender, EventArgs e)
        {
            insert();
            // Response.Redirect("Reports.aspx");
        }
    }
}
