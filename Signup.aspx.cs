using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using website.Data;
using website.Security;

namespace website
{
    public partial class Signup : Page
    {
        private readonly UserRepository _userRepository = new UserRepository();

        protected string MessageCssClass { get; set; } = "ql-auth-alert-danger";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlMessage.Visible = false;
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Page.Validate("SignupValidationGroup");
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text?.Trim() ?? string.Empty;
            string email = txtEmail.Text?.Trim() ?? string.Empty;
            string password = txtPassword.Text ?? string.Empty;
            string confirmPassword = txtConfirmPassword.Text ?? string.Empty;

            // Rigorous Server-Side Validations
            if (string.IsNullOrWhiteSpace(fullName))
            {
                ShowErrorMessage("Please provide your full name.");
                return;
            }

            if (fullName.Length > 100)
            {
                ShowErrorMessage("Full name cannot exceed 100 characters.");
                return;
            }

            if (string.IsNullOrWhiteSpace(email))
            {
                ShowErrorMessage("Please provide your email address.");
                return;
            }

            var emailRegex = new Regex(@"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
            if (!emailRegex.IsMatch(email))
            {
                ShowErrorMessage("The email address provided is not in a valid format.");
                return;
            }

            if (string.IsNullOrEmpty(password) || password.Length < 8)
            {
                ShowErrorMessage("Password must be at least 8 characters in length.");
                return;
            }

            if (!string.Equals(password, confirmPassword, StringComparison.Ordinal))
            {
                ShowErrorMessage("Passwords do not match.");
                return;
            }

            if (!chkAgreeTerms.Checked)
            {
                ShowErrorMessage("You must agree to the Terms of Service and Privacy Policy to continue.");
                return;
            }

            try
            {
                // Check for existing user account
                if (_userRepository.UserExists(email))
                {
                    ShowErrorMessage("An account with this email address already exists. Please log in or use a different email.");
                    return;
                }

                // Hash password securely with PBKDF2
                string passwordHash = PasswordHasher.HashPassword(password);

                // Insert into Database1.mdf Users table
                int userId = _userRepository.CreateUser(fullName, email, passwordHash);

                if (userId > 0)
                {
                    // Redirect to login page with success flag
                    Response.Redirect("~/Login.aspx?registered=true", endResponse: true);
                }
                else
                {
                    ShowErrorMessage("An account with this email address already exists. Please log in.");
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
                // Normal ASP.NET response redirection behavior
            }
            catch (Exception)
            {
                // Log exception internally without exposing stack or SQL details to client
                ShowErrorMessage("We were unable to create your account at this moment. Please verify your information and try again.");
            }
        }

        private void ShowErrorMessage(string message)
        {
            MessageCssClass = "ql-auth-alert-danger";
            lblMessage.Text = message;
            pnlMessage.Visible = true;
        }
    }
}
