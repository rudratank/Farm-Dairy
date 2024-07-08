using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Rudra
{
    public partial class Addlivestock : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_livestock();
            }
        }

        // Arrays of livestock breeds
        string[] breedofcow = { "Gir", "Dangi", "Dajai", "Brown Swiss", "Bargur", "Desi", "Other" };
        string[] breedofbuffalo = { "Desi", "Murrah", "Nagpuri", "Nill Ravi", "Kalahandi", "Surti", "Other" };
        string[] breedofsheep = { "Bagdi", "Chokla", "Gaddi", "Lohi", "Magra", "Marwari", "Nali", "Other" };
        string[] breedofgoat = { "Beetal", "Barbari", "Boer", "Lohi", "Saanen", "Sojat", "Desi", "Other" };
        string[] breedofhorse = { "Desi", "Arabian", "Bhutia", "Kathiawari", "Manipuri", "Marwari", "Spiti", "Other" };

        protected void ddlcat_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Populate breed dropdown based on selected category
            switch (ddlcat.SelectedValue.Trim().ToUpper())
            {
                case "COW":
                    ddlbreed.DataSource = breedofcow;
                    break;
                case "BUFFALO":
                    ddlbreed.DataSource = breedofbuffalo;
                    break;
                case "SHEEP":
                    ddlbreed.DataSource = breedofsheep;
                    break;
                case "GOAT":
                    ddlbreed.DataSource = breedofgoat;
                    break;
                case "HORSE":
                    ddlbreed.DataSource = breedofhorse;
                    break;
                default:
                    ddlbreed.DataSource = null;
                    break;
            }
            ddlbreed.DataBind();
        }

        // Method to populate the livestock grid
        void grid_livestock()
        {
            // Retrieve connection string from web.config
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            // Establish connection to the database
            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    // Retrieve user ID from session
                    string userId = Session["uid"] as string;

                    if (!string.IsNullOrEmpty(userId))
                    {
                        // Query to retrieve livestock data for the logged-in user
                        SqlCommand cmd = new SqlCommand("SELECT Id, name, catagory, breed, Gender FROM livestock WHERE uid = @uid", con);
                        cmd.Parameters.AddWithValue("@uid", userId);

                        con.Open();
                        // Bind data to the GridView
                        GridView1.DataSource = cmd.ExecuteReader();
                        GridView1.DataBind();
                    }
                    else
                    {
                        Response.Write("User ID not found in session.");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        // Method to insert a new livestock entry
        void insert()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    // Retrieve user ID from session
                    string userId = Session["uid"] as string;

                    if (!string.IsNullOrEmpty(userId))
                    {
                        // Query to insert new livestock entry
                        SqlCommand cmd = new SqlCommand("INSERT INTO livestock (uid, name, catagory, breed, Gender) VALUES (@uid, @name, @catagory, @breed, @Gender)", con);
                        cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(userId));
                        cmd.Parameters.AddWithValue("@name", txtnm.Text.Trim());
                        cmd.Parameters.AddWithValue("@catagory", ddlcat.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@breed", ddlbreed.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Gender", ddlgen.SelectedValue.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Display success message
                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-success";
                        Label1.Text = "Livestock Added Successfully.";
                    }
                    else
                    {
                        Response.Write("User ID not found in session.");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            // Insert new livestock entry and refresh grid
            insert();
            grid_livestock();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnDel.Visible = true;
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                // Delete selected livestock entry and refresh grid
                delete_livestock();
                grid_livestock();
            }
            else
            {
                // Display warning message if no entry is selected
                Label1.Visible = true;
                Label1.CssClass = "alert alert-warning";
                Label1.Text = "Please select a livestock entry to delete.";
            }
        }

        // Method to delete the selected livestock entry
        void delete_livestock()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    if (GridView1.SelectedRow != null)
                    {
                        // Retrieve the ID of the selected livestock entry
                        string livestockId = GridView1.SelectedRow.Cells[1].Text;
                        SqlCommand cmd = new SqlCommand("DELETE FROM livestock WHERE Id = @livestockId", con);
                        cmd.Parameters.AddWithValue("@livestockId", livestockId);

                        con.Open();
                        cmd.ExecuteNonQuery();

                        // Display success message
                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-success";
                        Label1.Text = "Livestock Deleted Successfully.";
                    }
                    else
                    {
                        // Display warning message if no entry is selected
                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-warning";
                        Label1.Text = "No livestock entry selected.";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("An error occurred: " + ex.Message);
                }
            }
        }
    }
}
