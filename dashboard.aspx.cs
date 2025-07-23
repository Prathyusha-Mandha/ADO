using System;

namespace YourNamespace
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserLoginPanel.Attributes["onclick"] = "window.location='UserLogin.aspx';";
            EmployeeLoginPanel.Attributes["onclick"] = "window.location='EmployeeLogin.aspx';";
            UserLoginPanel.Style["cursor"] = "pointer";
            EmployeeLoginPanel.Style["cursor"] = "pointer"; 
        }
    }
}
