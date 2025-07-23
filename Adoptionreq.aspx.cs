using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class AdoptionRequests : System.Web.UI.Page
    {
        string connectionString = "Data Source=Prathyusha;Initial Catalog=kanini;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdoptionRequests();
            }
        }

        private void LoadAdoptionRequests()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT RequestID, PetID, Name, Phone, Address, Status FROM AdoptionRequests";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptRequest")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string updateQuery = "UPDATE AdoptionRequests SET Status = 'Confirmed' WHERE RequestID = @RequestID";
                    SqlCommand cmd = new SqlCommand(updateQuery, conn);
                    cmd.Parameters.AddWithValue("@RequestID", requestId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                
                LoadAdoptionRequests();
            }
        }
    }
}
