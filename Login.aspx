<%@ Page Title="Log In - QuizLearn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="website.Login" %>

<asp:Content ID="HeadContentArea" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/Auth.css") %>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ql-auth-wrapper">
     
        <aside class="ql-auth-promo">
            <!-- Brand Logo -->
            <a class="ql-auth-brand" href="<%= ResolveUrl("~/") %>" aria-label="QuizLearn Home">
                <div class="ql-auth-brand-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                    </svg>
                </div>
                <span>QuizLearn</span>
            </a>

            <!-- Central Promotional Copy & Achievement Cards -->
            <div class="ql-auth-promo-content">
                <h1 class="ql-auth-promo-heading">Welcome Back</h1>
                <p class="ql-auth-promo-subheading">
                    Continue your learning journey. Pick up where you left off and keep improving.
                </p>

                <div class="ql-auth-cards-list">
                    <!-- Achievement Card 1: Completed Quizzes -->
                    <div class="ql-auth-card">
                        <div class="ql-auth-card-left">
                            <div class="ql-auth-card-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                                </svg>
                            </div>
                            <div>
                                <div class="ql-auth-card-title">12 Quizzes Completed</div>
                                <div class="ql-auth-card-desc">Data Structures &amp; Algorithms</div>
                            </div>
                        </div>
                        <span class="ql-auth-badge ql-auth-badge-teal">PASSED</span>
                    </div>

                    <!-- Achievement Card 2: Level Milestone -->
                    <div class="ql-auth-card">
                        <div class="ql-auth-card-left">
                            <div class="ql-auth-card-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                                </svg>
                            </div>
                            <div>
                                <div class="ql-auth-card-title">Level 5 Achieved</div>
                                <div class="ql-auth-card-desc">System Architect milestone</div>
                            </div>
                        </div>
                        <span class="ql-auth-badge ql-auth-badge-amber">ELITE</span>
                    </div>

                                   <!-- Submit Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="ql-btn-auth-primary"
                    ValidationGroup="LoginValidationGroup" OnClick="btnLogin_Click" />

                <!-- Signup Redirect Link -->
                <div class="ql-auth-switch">
                    Don't have an account? <a href="<%= ResolveUrl("~/Signup.aspx") %>">Sign up</a>
                </div>
            </div>
        </main>
    </div>

    <!-- Auth Interactivity Script -->
    <script src="<%= ResolveUrl("~/Scripts/auth.js") %>"></script>
</asp:Content>


            <!-- Footer Quote / Attribution -->
            <div class="ql-auth-promo-footer">
                Empowering learners from leading academic institutions.
            </div>
        </aside>


        <main class="ql-auth-main">
            <div class="ql-auth-form-card">
                <header class="ql-auth-header">
                    <h2 class="ql-auth-title">Log In</h2>
                    <p class="ql-auth-subtitle">Welcome back! Please enter your details.</p>
                </header>

                <!-- Social Provider Actions -->
                <div class="ql-auth-social-row">
                    <a href="javascript:void(0);" class="ql-btn-social" data-provider="Google">
                        <svg viewBox="0 0 24 24">
                            <path fill="#EA4335" d="M12 5c1.6 0 3 .6 4.1 1.7l3.1-3.1C17.3 1.8 14.8 1 12 1 7.4 1 3.6 3.6 1.7 7.4l3.7 2.9C6.3 7.4 8.9 5 12 5z"/>
                            <path fill="#4285F4" d="M23.5 12.3c0-.8-.1-1.6-.2-2.3H12v4.5h6.5c-.3 1.5-1.1 2.8-2.4 3.7l3.7 2.9c2.2-2 3.7-5.1 3.7-8.8z"/>
                            <path fill="#FBBC05" d="M5.4 14.7c-.2-.7-.4-1.5-.4-2.7s.2-2 .4-2.7L1.7 6.4C.6 8.6 0 10.2 0 12s.6 3.4 1.7 5.6l3.7-2.9z"/>
                            <path fill="#34A853" d="M12 23c3.2 0 6-1.1 8-3l-3.7-2.9c-1.1.7-2.5 1.2-4.3 1.2-3.1 0-5.7-2.4-6.6-5.3L1.7 15.9C3.6 20.4 7.4 23 12 23z"/>
                        </svg>
                        <span>Continue with Google</span>
                    </a>
                    <a href="javascript:void(0);" class="ql-btn-social" data-provider="GitHub">
                        <svg viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 2A10 10 0 0 0 2 12c0 4.42 2.87 8.17 6.84 9.5.5.08.66-.23.66-.5v-1.69c-2.77.6-3.36-1.34-3.36-1.34-.46-1.16-1.11-1.47-1.11-1.47-.91-.62.07-.6.07-.6 1 .07 1.53 1.03 1.53 1.03.87 1.52 2.34 1.07 2.91.83.1-.65.35-1.09.63-1.34-2.22-.25-4.55-1.11-4.55-4.92 0-1.11.38-2 1.03-2.71-.1-.25-.45-1.29.1-2.64 0 0 .84-.27 2.75 1.02.79-.22 1.65-.33 2.5-.33.85 0 1.71.11 2.5.33 1.91-1.29 2.75-1.02 2.75-1.02.55 1.35.2 2.39.1 2.64.65.71 1.03 1.6 1.03 2.71 0 3.82-2.34 4.66-4.57 4.91.36.31.69.92.69 1.85V21c0 .27.16.59.67.5C19.14 20.16 22 16.42 22 12A10 10 0 0 0 12 2z"/>
                        </svg>
                        <span>Continue with GitHub</span>
                    </a>
                </div>

                <div class="ql-auth-divider">
                    <span>OR</span>
                </div>

                <!-- Server Alerts Panel -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                    <div class="ql-auth-alert <%= MessageCssClass %>" role="alert">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="10"></circle>
                            <line x1="12" y1="8" x2="12" y2="12"></line>
                            <line x1="12" y1="16" x2="12.01" y2="16"></line>
                        </svg>
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                    </div>
                </asp:Panel>

                <!-- Email Address Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtEmail.ClientID %>">Email Address</label>
                    <div class="ql-input-group">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="ql-auth-input" placeholder="ritikofficial787@gmail.com" MaxLength="256" autocomplete="email" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationGroup="LoginValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Email address is required." />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationGroup="LoginValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                        ErrorMessage="Please enter a valid email address." />
                </div>

                <!-- Password Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtPassword.ClientID %>">Password</label>
                    <div class="ql-input-group ql-input-has-toggle">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="ql-auth-input" placeholder="••••••••" autocomplete="current-password" />
                        <button type="button" class="ql-password-toggle-btn" data-target="<%= txtPassword.ClientID %>" aria-label="Toggle password visibility">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </button>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ValidationGroup="LoginValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Password is required." />
                </div>

                <!-- Remember Me & Forgot Password Row -->
                <div class="ql-auth-row-between">
                    <label class="ql-auth-checkbox-label">
                        <asp:CheckBox ID="chkRememberMe" runat="server" />
                        <span>Remember me</span>
                    </label>
                    <a href="javascript:alert('Password reset instructions will be sent to registered accounts in a future update.');" class="ql-auth-link-forgot">Forgot Password?</a>
                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="ql-btn-auth-primary"
                    ValidationGroup="LoginValidationGroup" OnClick="btnLogin_Click" />

                <!-- Signup Redirect Link -->
                <div class="ql-auth-switch">
                    Don't have an account? <a href="<%= ResolveUrl("~/Signup.aspx") %>">Sign up</a>
                </div>
            </div>
        </main>
    </div>

    <!-- Auth Interactivity Script -->
    <script src="<%= ResolveUrl("~/Scripts/auth.js") %>"></script>
</asp:Content>
