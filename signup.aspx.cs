using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ASP_Project_1
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            
            if (string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPassword.Text))
            {
                lblMessage.Text = "Please enter all the fields.";
                return;
            }

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                string checkUser = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                int userExists = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (userExists > 0)
                {
                    lblMessage.Text = "Username already taken.";
                    return;
                }

                
                string insertQuery = "INSERT INTO Users (Username, Password) VALUES (@Username, @Password)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); 

                insertCmd.ExecuteNonQuery();

                
                Response.Redirect("UserLogin.aspx");
            }
        }
    }
}
