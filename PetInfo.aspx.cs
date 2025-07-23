using System;
using System.Data;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class PetInfo : System.Web.UI.Page
    {
        string connectionString = "Data Source=Prathyusha;Initial Catalog=kanini;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPets();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindPets();
        }

        private void BindPets()
        {
            string petType = ddlPetType.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = petType == "All"
                    ? "SELECT * FROM Pets"
                    : "SELECT * FROM Pets WHERE PetType = @PetType";

                SqlCommand cmd = new SqlCommand(query, conn);
                if (petType != "All")
                    cmd.Parameters.AddWithValue("@PetType", petType);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                RepeaterPets.DataSource = dt;
                RepeaterPets.DataBind();
            }
        }
    }
}
