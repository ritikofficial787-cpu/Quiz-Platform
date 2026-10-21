<%@ Page Title="Create Account - QuizLearn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="website.Signup" %>

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
                <h1 class="ql-auth-promo-heading">Start Your Learning<br />Journey</h1>
                <p class="ql-auth-promo-subheading">
                    Create your QuizLearn account and start practicing, tracking your progress and improving your skills.
                </p>

                <div class="ql-auth-cards-list">
                    <!-- Achievement Card 1: Accuracy -->
                    <div class="ql-auth-card">
                        <div class="ql-auth-card-left">
                            <div class="ql-auth-card-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <line x1="19" y1="5" x2="5" y2="19"></line>
                                    <circle cx="6.5" cy="6.5" r="2.5"></circle>
                                    <circle cx="17.5" cy="17.5" r="2.5"></circle>
                                </svg>
                            </div>
                            <div>
                                <div class="ql-auth-card-title">92% Accuracy</div>
                                <div class="ql-auth-card-desc">System Design Path</div>
                            </div>
                        </div>
                        <span class="ql-auth-badge ql-auth-badge-teal">+4% today</span>
                    </div>

                    <!-- Achievement Card 2: Streak -->
                    <div class="ql-auth-card">
                        <div class="ql-auth-card-left">
                            <div class="ql-auth-card-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M8.5 14.5A2.5 2.5 0 0 0 11 12c0-1.38-.5-2-1-3-1.072-2.143-.224-4.054 2-6 .5 2.5 2 4.9 4 6.5 2 1.6 3 3.5 3 5.5a7 7 0 1 1-14 0c0-1.153.433-2.294 1-3a2.5 2.5 0 0 0 2.5 2.5z"></path>
                                </svg>
                            </div>
                            <div>
                                <div class="ql-auth-card-title">7 Day Streak</div>
                                <div class="ql-auth-card-desc">Keep learning to maintain streak</div>
                            </div>
                        </div>
                        <span class="ql-auth-badge ql-auth-badge-amber">ACTIVE</span>
                    </div>

                    <!-- Achievement Card 3: Level Milestone -->
                    <div class="ql-auth-card">
                        <div class="ql-auth-card-left">
                            <div class="ql-auth-card-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                    <polyline points="9 12 11 14 15 10"></polyline>
                                </svg>
                            </div>
                            <div>
                                <div class="ql-auth-card-title">Level 4 Verified</div>
                                <div class="ql-auth-card-desc">Cloud Architectures module</div>
                            </div>
                        </div>
                        <span class="ql-auth-badge ql-auth-badge-purple">PASSED</span>
                    </div>
                </div>
            </div>

            <!-- Footer Quote / Attribution -->
            <div class="ql-auth-promo-footer">
                Empowering learners from leading academic institutions.
            </div>
        </aside>

        <!-- =====================================================================
             Right Form Panel (Create Account)
             ===================================================================== -->
        <main class="ql-auth-main">
            <div class="ql-auth-form-card">
                <header class="ql-auth-header">
                    <h2 class="ql-auth-title">Create Account</h2>
                    <p class="ql-auth-subtitle">Join QuizLearn today and master new skills.</p>
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

                <!-- Full Name Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtFullName.ClientID %>">Full Name</label>
                    <div class="ql-input-group">
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="ql-auth-input" placeholder="Aarav Sharma" MaxLength="100" autocomplete="name" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Full name is required." />
                </div>

                <!-- Email Address Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtEmail.ClientID %>">Email Address</label>
                    <div class="ql-input-group">
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="ql-auth-input" placeholder="aarav@giu.university.edu" MaxLength="256" autocomplete="email" />
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Email address is required." />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                        ErrorMessage="Please enter a valid email address." />
                </div>

                <!-- Password Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtPassword.ClientID %>">Password</label>
                    <div class="ql-input-group ql-input-has-toggle">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="ql-auth-input" placeholder="••••••••" autocomplete="new-password" />
                        <button type="button" class="ql-password-toggle-btn" data-target="<%= txtPassword.ClientID %>" aria-label="Toggle password visibility">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </button>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Password is required." />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ValidationExpression="^.{8,}$"
                        ErrorMessage="Password must be at least 8 characters long." />
                </div>

                <!-- Confirm Password Field -->
                <div class="ql-auth-field">
                    <label class="ql-auth-label" for="<%= txtConfirmPassword.ClientID %>">Confirm Password</label>
                    <div class="ql-input-group ql-input-has-toggle">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="ql-auth-input" placeholder="••••••••" autocomplete="new-password" />
                        <button type="button" class="ql-password-toggle-btn" data-target="<%= txtConfirmPassword.ClientID %>" aria-label="Toggle password visibility">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </button>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Please confirm your password." />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword" Operator="Equal" Type="String"
                        ValidationGroup="SignupValidationGroup" Display="Dynamic" CssClass="ql-val-error"
                        ErrorMessage="Passwords do not match." />
                </div>

                <!-- Terms and Conditions Checkbox -->
                <div class="ql-auth-terms-row">
                    <label class="ql-auth-checkbox-label">
                        <asp:CheckBox ID="chkAgreeTerms" runat="server" Checked="true" />
                        <span>I agree to the Terms of Service and Privacy Policy</span>
                    </label>
                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnSignup" runat="server" Text="Create Account" CssClass="ql-btn-auth-primary"
                    ValidationGroup="SignupValidationGroup" OnClick="btnSignup_Click" />

                <!-- Login Redirect Link -->
                <div class="ql-auth-switch">
                    Already have an account? <a href="<%= ResolveUrl("~/Login.aspx") %>">Log in</a>
                </div>
            </div>
        </main>
    </div>

    <!-- Auth Interactivity Script -->
    <script src="<%= ResolveUrl("~/Scripts/auth.js") %>"></script>
</asp:Content>
