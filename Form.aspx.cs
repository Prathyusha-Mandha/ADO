using System;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class Form : System.Web.UI.Page
    {
        string connectionString = "Data Source=Prathyusha;Initial Catalog=kanini;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string petId = Request.QueryString["PetID"];
                if (!string.IsNullOrEmpty(petId))
                {
                    LoadPetDetails(petId);
                    pnlForm.Visible = true;
                    pnlConfirmation.Visible = false;
                }
            }
        }

        private void LoadPetDetails(string petId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT PetName, Price FROM Pets WHERE PetID = @PetID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PetID", petId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblPetID.Text = petId;
                    lblPetName.Text = reader["PetName"].ToString();
                    lblPrice.Text = reader["Price"].ToString();
                }
                conn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string petId = Request.QueryString["PetID"];

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string insertQuery = "INSERT INTO AdoptionRequests (PetID, Name, Phone, Address) VALUES (@PetID, @Name, @Phone, @Address)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@PetID", petId);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Address", address);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }


            pnlForm.Visible = false;
            pnlConfirmation.Visible = true;
            lblConfirmation.Text = $"Thank you {name}! Your request has been sent. Owner will contact you shortly.";
        }

        protected void btnPets_Click(object sender, EventArgs e)
        {
            Response.Redirect("PetInfo.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");  
        }
    }
}
