using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class Pet : System.Web.UI.Page
    {
        private string connStr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPets(0);
                LoadRequests();
                ClearForm();
                ShowPetsPanel();
            }
        }

        #region Pets Section

        private void LoadPets(int pageIndex)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Pets ORDER BY PetID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewPets.PageIndex = pageIndex; 
                GridViewPets.DataSource = dt;
                GridViewPets.DataBind();
            }
            ClearMessage();
        }

        protected void GridViewPets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadPets(e.NewPageIndex);
        }

        protected void GridViewPets_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridViewPets.SelectedDataKey != null)
            {
                int petID = Convert.ToInt32(GridViewPets.SelectedDataKey.Value);

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Pets WHERE PetID = @PetID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PetID", petID);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())

                    {
                        hfPetID.Value = reader["PetID"].ToString();
                        txtPetName.Text = reader["PetName"].ToString();
                        txtBreed.Text = reader["Breed"].ToString();
                        txtAge.Text = reader["Age"].ToString();
                        ddlPetType.SelectedValue = reader["PetType"].ToString();
                        txtPetImage.Text = reader["PetImage"].ToString();
                        txtPrice.Text = reader["Price"].ToString();

                        btnAdd.Visible = false;
                        btnUpdate.Visible = true;
                        btnDelete.Visible = true;
                        btnCancel.Visible = true;

                        lblMessage.Text = "";
                        formTitle.InnerText = "Update Pet Details";
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("AddPet", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PetName", txtPetName.Text.Trim());
                cmd.Parameters.AddWithValue("@Breed", txtBreed.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text.Trim()));
                cmd.Parameters.AddWithValue("@PetType", ddlPetType.SelectedValue);
                cmd.Parameters.AddWithValue("@PetImage", txtPetImage.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Pet added successfully!";

            LoadPets(GridViewPets.PageIndex);
            ClearForm();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!ValidateForm())
                return;

            int petID = Convert.ToInt32(hfPetID.Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UpdatePet", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PetID", petID);
                cmd.Parameters.AddWithValue("@PetName", txtPetName.Text.Trim());
                cmd.Parameters.AddWithValue("@Breed", txtBreed.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text.Trim()));
                cmd.Parameters.AddWithValue("@PetType", ddlPetType.SelectedValue);
                cmd.Parameters.AddWithValue("@PetImage", txtPetImage.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Pet updated successfully!";

            LoadPets(GridViewPets.PageIndex);
            ClearForm();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int petID = Convert.ToInt32(hfPetID.Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DeletePet", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PetID", petID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Pet deleted successfully!";

            LoadPets(0);
            ClearForm();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
            ClearMessage();
        }

        private void ClearForm()
        {
            hfPetID.Value = "";
            txtPetName.Text = "";
            txtBreed.Text = "";
            txtAge.Text = "";
            ddlPetType.SelectedIndex = 0;
            txtPetImage.Text = "";
            txtPrice.Text = "";

            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnDelete.Visible = false;
            btnCancel.Visible = false;

            formTitle.InnerText = "Add New Pet";
        }

        private bool ValidateForm()
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            if (string.IsNullOrWhiteSpace(txtPetName.Text))
            {
                lblMessage.Text = "Please enter Pet Name.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtBreed.Text))
            {
                lblMessage.Text = "Please enter Breed.";
                return false;
            }
            if (!int.TryParse(txtAge.Text, out int age) || age < 0)
            {
                lblMessage.Text = "Please enter a valid Age.";
                return false;
            }
            if (string.IsNullOrEmpty(ddlPetType.SelectedValue))
            {
                lblMessage.Text = "Please select Pet Type.";
                return false;
            }
            if (string.IsNullOrWhiteSpace(txtPetImage.Text))
            {
                lblMessage.Text = "Please enter Image URL.";
                return false;
            }
            if (!decimal.TryParse(txtPrice.Text, out decimal price) || price < 0)
            {
                lblMessage.Text = "Please enter a valid Price.";
                return false;
            }
            return true;
        }

        private void ClearMessage()
        {
            lblMessage.Text = "";
        }

        #endregion

        #region Adoption Requests Section

        private void LoadRequests()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM AdoptionRequests ORDER BY RequestID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewRequests.DataSource = dt;
                GridViewRequests.DataBind();
            }
        }

        protected void GridViewRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptRequest" || e.CommandName == "DeclineRequest")
            {
                int requestId = Convert.ToInt32(e.CommandArgument);

                string newStatus = e.CommandName == "AcceptRequest" ? "Confirmed" : "Declined";

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string updateQuery = "UPDATE AdoptionRequests SET Status = @Status WHERE RequestID = @RequestID";
                    SqlCommand cmd = new SqlCommand(updateQuery, conn);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@RequestID", requestId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadRequests();
            }
        }

        #endregion

        #region Tabs & Logout

        protected void btnTabPets_Click(object sender, EventArgs e)
        {
            ShowPetsPanel();
        }

        protected void btnTabRequests_Click(object sender, EventArgs e)
        {
            ShowRequestsPanel();
        }

        private void ShowPetsPanel()
        {
            pnlPets.CssClass = "panel active";
            pnlRequests.CssClass = "panel";
            btnTabPets.CssClass = "tab-btn active";
            btnTabRequests.CssClass = "tab-btn";
            ClearMessage();
        }

        private void ShowRequestsPanel()
        {
            pnlPets.CssClass = "panel";
            pnlRequests.CssClass = "panel active";
            btnTabPets.CssClass = "tab-btn";
            btnTabRequests.CssClass = "tab-btn active";
            ClearMessage();
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Dashboard.aspx");
        }

        #endregion
    }
}
