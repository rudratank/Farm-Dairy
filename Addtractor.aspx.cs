using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rudra
{
    public partial class Addtractor : System.Web.UI.Page
    {
        string[] modofsonalika = { "Slikander DI 35", "35 RX Slikander", "42 DI Slikander", "47 RX Slikander", "52 RX Tiger", "60 Max Tiger" };
        string[] modofmahindra = { "235 DI", "245 DI Orchard", "255 DI Power Plus", "265 DI XP Plus", "275 DI TU", "275 DI ECO" };
        string[] modofswaraj = { "714", "722 FE", "724 FE", "724 FE 4WD", "724 XM", "733 FE", "735 FE" };
        string[] modofjohndree = { "3028E", "3036EN", "5005", "5036 C", "5036 D", "5038 D", "5039 C", "5039 D" };
        string[] modofescort = { "JOSH 355", "MPT JAWAN", "Steeltrac" };
        string[] modofnewholland = { "3030", "3032 Nx", "3037 Tx", "3037 Tx Super", "3130 NX", "3230 Tx Super" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_tractor();
            }
        }

        protected void ddlbrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlbrand.SelectedValue.Trim().ToUpper())
            {
                case "SONALIKA":
                    ddlmodel.DataSource = modofsonalika;
                    break;
                case "MAHINDRA":
                    ddlmodel.DataSource = modofmahindra;
                    break;
                case "SWARAJ":
                    ddlmodel.DataSource = modofswaraj;
                    break;
                case "JOHN DEERE":
                    ddlmodel.DataSource = modofjohndree;
                    break;
                case "ESCORTS":
                    ddlmodel.DataSource = modofescort;
                    break;
                case "NEW HOLLAND":
                    ddlmodel.DataSource = modofnewholland;
                    break;
                default:
                    ddlmodel.DataSource = null;
                    break;
            }
            ddlmodel.DataBind();
        }

        void grid_tractor()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    string userId = Session["uid"] as string;

                    if (!string.IsNullOrEmpty(userId))
                    {
                        SqlCommand cmd = new SqlCommand("SELECT Id, name, brand, model FROM tractor WHERE uid = @uid", con);
                        cmd.Parameters.AddWithValue("@uid", userId);

                        con.Open();
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

        void insert()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    string userId = Session["uid"] as string;

                    if (!string.IsNullOrEmpty(userId))
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO tractor(uid, name, brand, model) VALUES(@uid, @name, @brand, @model)", con);
                        cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(userId));
                        cmd.Parameters.AddWithValue("@name", txtnm.Text.Trim());
                        cmd.Parameters.AddWithValue("@brand", ddlbrand.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@model", ddlmodel.SelectedValue.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();

                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-success";
                        Label1.Text = "Tractor Added Successfully.";
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
            insert();
            grid_tractor();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnDel.Visible = true;
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                delete_tract();
                grid_tractor();
            }
            else
            {
                Label1.Visible = true;
                Label1.CssClass = "alert alert-warning";
                Label1.Text = "Please select a tractor to delete.";
            }
        }

        void delete_tract()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    if (GridView1.SelectedRow != null)
                    {
                        string tractorId = GridView1.SelectedRow.Cells[1].Text;
                        SqlCommand cmd = new SqlCommand("DELETE FROM tractor WHERE Id = @tractorId", con);
                        cmd.Parameters.AddWithValue("@tractorId", tractorId);

                        con.Open();
                        cmd.ExecuteNonQuery();

                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-success";
                        Label1.Text = "Tractor Deleted Successfully.";
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.CssClass = "alert alert-warning";
                        Label1.Text = "No tractor selected.";
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
