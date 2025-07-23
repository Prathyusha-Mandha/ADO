using System;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";  

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter username and password.";
                return;
            }

            string connectionString = "Data Source=Prathyusha;Initial Catalog=kanini;Integrated Security=True;TrustServerCertificate=True";
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        Session["UserName"] = username; 
                        Response.Redirect("PetInfo.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }
            }
        }
           
    }
}
