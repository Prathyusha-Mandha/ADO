using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace YourNamespace
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both username and password.";
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM employee WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count == 1)
                {
                    Session["Username"] = username;
                    Response.Redirect("Pet.aspx"); 
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                }
            }
        }
    }
}
