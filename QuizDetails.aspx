<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuizDetails.aspx.cs" Inherits="website.QuizDetails" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><asp:Literal ID="litPageTitle" runat="server">Quiz Details</asp:Literal> - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body class="ql-dashboard-layout">
    <form id="formQuizDetails" runat="server">
        <!-- Sidebar Navigation -->
        <aside class="ql-sidebar" id="dashboardSidebar">
            <div class="ql-sidebar-top">
                <!-- Brand Logo -->
                <a href="Default.aspx" class="ql-sidebar-brand" title="QuizLearn Home">
                    <div class="ql-sidebar-brand-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                        </svg>
                    </div>
                    <span class="ql-sidebar-brand-name">QuizLearn</span>
                </a>

                <!-- Navigation Links -->
                <nav class="ql-sidebar-nav" aria-label="Main Navigation">
                    <a href="StudentDashboard.aspx" class="ql-nav-item" id="navDashboard">
                        <svg viewBox="0 0 24 24">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                        <span>Dashboard</span>
                    </a>

                    <a href="ExploreQuizzes.aspx" class="ql-nav-item active" id="navQuizzes">
                        <svg viewBox="0 0 24 24">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                        <span>Quizzes</span>
                    </a>

                    <a href="javascript:void(0);" class="ql-nav-item" id="navResults" onclick="showFeatureModal('My Results & Progress', 'Comprehensive analytics showing topic mastery curves, score percentiles, and weekly study streaks.')">
                        <svg viewBox="0 0 24 24">
                            <line x1="18" y1="20" x2="18" y2="10"></line>
                            <line x1="12" y1="20" x2="12" y2="4"></line>
                            <line x1="6" y1="20" x2="6" y2="14"></line>
                        </svg>
                        <span>My Results</span>
                    </a>

                    <a href="MistakeNotebook.aspx" class="ql-nav-item" id="navMistakes">
                        <svg viewBox="0 0 24 24">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            <line x1="9" y1="7" x2="15" y2="7"></line>
                            <line x1="9" y1="11" x2="13" y2="11"></line>
                        </svg>
                        <span>Mistake Notebook</span>
                    </a>

                    <a href="Profile.aspx" class="ql-nav-item" id="navProfile">
                        <svg viewBox="0 0 24 24">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                        <span>Profile</span>
                    </a>
                </nav>
            </div>

            <!-- Bottom Nav -->
            <div class="ql-sidebar-bottom">
                <a href="Settings.aspx" class="ql-nav-item" id="navSettings">
                    <svg viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="3"></circle>
                        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                    </svg>
                    <span>Settings</span>
                </a>

                <a href="Login.aspx?logout=true" class="ql-nav-item" id="navLogout" onclick="handleLogout(event)">
                    <svg viewBox="0 0 24 24">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Workspace -->
        <div class="ql-dash-main">
            <!-- Top App Header -->
            <header class="ql-app-header">
                <div class="ql-header-left">
                    <button type="button" class="ql-mobile-menu-btn" id="btnToggleSidebar" aria-label="Toggle navigation drawer">
                        <svg viewBox="0 0 24 24" fill="none" stroke-width="2">
                            <line x1="3" y1="12" x2="21" y2="12"></line>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <line x1="3" y1="18" x2="21" y2="18"></line>
                        </svg>
                    </button>

                    <!-- Top Header Search (links to explore quizzes) -->
                    <div class="ql-search-box">
                        <span class="ql-search-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                            </svg>
                        </span>
                        <input type="text" id="txtTopHeaderSearch" class="ql-search-input" placeholder="Search quizzes..." autocomplete="off" onkeydown="if(event.key==='Enter'){event.preventDefault(); window.location.href='ExploreQuizzes.aspx?q=' + encodeURIComponent(this.value);}" />
                    </div>
                </div>

                <div class="ql-header-right">
                    <!-- Notification Bell -->
                    <button type="button" class="ql-notif-btn" id="btnNotifications" title="Notifications" onclick="showNotificationToast()">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                        <span class="ql-notif-dot"></span>
                    </button>

                    <!-- User Pill Badge -->
                    <div class="ql-user-pill" id="userPill" onclick="window.location.href='Profile.aspx'" title="View Profile">
                        <span class="ql-user-name" id="lblHeaderUserName">Aarav Sharma</span>
                        <div class="ql-user-avatar" id="lblHeaderAvatar">AS</div>
                    </div>
                </div>
            </header>

            <!-- Quiz Details Body -->
            <main class="ql-dash-body" style="align-self: center;">
                <div class="ql-details-wrap">
                    <!-- Back Link -->
                    <a href="ExploreQuizzes.aspx" class="ql-back-link">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="19" y1="12" x2="5" y2="12"></line>
                            <polyline points="12 19 5 12 12 5"></polyline>
                        </svg>
                        <span>Back to Quizzes</span>
                    </a>

                    <!-- Title & Subtitle -->
                    <h1 class="ql-details-title"><asp:Literal ID="litQuizTitle" runat="server">C# OOP Fundamentals</asp:Literal></h1>
                    <p class="ql-details-subtitle"><asp:Literal ID="litQuizSubtitle" runat="server">Test your understanding of Object-Oriented Programming in C#.</asp:Literal></p>

                    <!-- Overview Card -->
                    <div class="ql-details-card">
                        <span class="ql-card-cat-badge"><asp:Literal ID="litQuizCategory" runat="server">C# Programming</asp:Literal></span>
                        
                        <div class="ql-details-meta-row">
                            <span class="ql-card-meta-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                    <polyline points="14 2 14 8 20 8"></polyline>
                                    <line x1="16" y1="13" x2="8" y2="13"></line>
                                    <line x1="16" y1="17" x2="8" y2="17"></line>
                                </svg>
                                <span><asp:Literal ID="litQuestionCount" runat="server">15 Questions</asp:Literal></span>
                            </span>
                            <span class="ql-card-meta-dot">•</span>
                            <span class="ql-card-meta-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="12 6 12 12 16 14"></polyline>
                                </svg>
                                <span><asp:Literal ID="litEstimatedDuration" runat="server">20 Minutes</asp:Literal></span>
                            </span>
                            <span class="ql-card-meta-dot">•</span>
                            <span class="<%= DifficultyCssClass %>"><asp:Literal ID="litDifficultyLevel" runat="server">Medium</asp:Literal></span>
                        </div>

                        <p class="ql-details-desc">
                            <asp:Literal ID="litDetailedDescription" runat="server">Test your knowledge of classes, objects, inheritance and polymorphism.</asp:Literal>
                        </p>
                    </div>

                    <!-- Topics Covered Section -->
                    <h2 class="ql-details-section-heading">Topics Covered</h2>
                    <div class="ql-topics-tags-wrap">
                        <asp:Repeater ID="rptTopics" runat="server">
                            <ItemTemplate>
                                <span class="ql-topic-tag"><%# Container.DataItem %></span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Quiz Instructions Section -->
                    <h2 class="ql-details-section-heading">Quiz Instructions</h2>
                    <ul class="ql-instructions-list">
                        <li>Answer all questions.</li>
                        <li>Each question has one correct answer.</li>
                        <li>Timer starts when the quiz begins.</li>
                        <li>Review answers before submitting if supported.</li>
                    </ul>

                    <!-- Warning Alert Box -->
                    <div class="ql-warning-box">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                        <span>Once started, the timer cannot be paused.</span>
                    </div>

                    <!-- Bottom Actions Row -->
                    <div class="ql-details-actions-row">
                        <a href="ExploreQuizzes.aspx" class="ql-back-link" style="margin-bottom: 0;">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="19" y1="12" x2="5" y2="12"></line>
                                <polyline points="12 19 5 12 12 5"></polyline>
                            </svg>
                            <span>Back to Quizzes</span>
                        </a>

                        <a href="ActualQuiz.aspx?id=<%= CurrentQuizId %>" class="ql-btn-start-details">
                            <span>Start Quiz</span>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                        </a>
                    </div>
                </div>
            </main>
        </div>

        <!-- Start Quiz Coming Soon / Prototype Modal -->
        <div class="ql-modal-backdrop" id="startQuizComingSoonModal">
            <div class="ql-modal-box">
                <div class="ql-modal-header">
                    <h3 class="ql-modal-title">Live Quiz Engine — Coming Soon</h3>
                    <button type="button" class="ql-modal-close" onclick="closeModal('startQuizComingSoonModal')" aria-label="Close dialog">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>
                <div class="ql-modal-body">
                    <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 14px;">
                        <span class="ql-card-cat-badge" style="margin-bottom: 0;"><asp:Literal ID="litModalCategory" runat="server">C# Programming</asp:Literal></span>
                        <strong style="color: #ffffff;"><asp:Literal ID="litModalQuizTitle" runat="server">C# OOP Fundamentals</asp:Literal></strong>
                    </div>
                    <p style="margin: 0 0 14px 0; color: #cbd5e1;">
                        You have selected this quiz. The full live exam session runner (timed question progression and final diagnostic reporting) is currently in development for the next phase.
                    </p>
                    <div style="background: rgba(124, 58, 237, 0.1); border: 1px solid rgba(139, 92, 246, 0.25); border-radius: 10px; padding: 14px;">
                        <span style="color: #c084fc; font-weight: 600; font-size: 13px;">Frontend Prototype Status:</span>
                        <p style="margin: 4px 0 0 0; font-size: 13px; color: #94a3b8;">
                            All quiz details, syllabus topics, and instruction parameters are validated server-side without modifying database records.
                        </p>
                    </div>
                </div>
                <div style="margin-top: 24px; display: flex; justify-content: flex-end; gap: 10px;">
                    <a href="ExploreQuizzes.aspx" class="ql-btn-quick-secondary" style="width: auto; padding: 0 20px; text-decoration: none; display: inline-flex; align-items: center;">Browse Other Quizzes</a>
                    <button type="button" class="ql-btn-quick-primary" style="width: auto; padding: 0 24px;" onclick="closeModal('startQuizComingSoonModal')">Understood</button>
                </div>
            </div>
        </div>

        <!-- Generic Feature Placeholder Modal -->
        <div class="ql-modal-backdrop" id="genericFeatureModal">
            <div class="ql-modal-box">
                <div class="ql-modal-header">
                    <h3 class="ql-modal-title" id="featureModalTitle">Feature Preview</h3>
                    <button type="button" class="ql-modal-close" onclick="closeModal('genericFeatureModal')" aria-label="Close dialog">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>
                <div class="ql-modal-body">
                    <p id="featureModalDesc">This feature preview is currently in prototype mode for QuizLearn frontend testing.</p>
                </div>
                <div style="margin-top: 24px; text-align: right;">
                    <button type="button" class="ql-btn-quick-primary" style="width: auto; padding: 0 24px;" onclick="closeModal('genericFeatureModal')">Got it</button>
                </div>
            </div>
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initStudentProfile();
            initMobileSidebar();
        });

        function initStudentProfile() {
            let studentName = 'Aarav Sharma';

            <% if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString())) { %>
                studentName = '<%= Server.HtmlEncode(Session["UserFullName"].ToString()) %>';
            <% } %>

            try {
                const profileRaw = localStorage.getItem('ql_student_profile') || sessionStorage.getItem('ql_student_profile');
                if (profileRaw) {
                    const p = JSON.parse(profileRaw);
                    if (p.userName) studentName = p.userName;
                }
            } catch (e) {}

            const lblHeaderUserName = document.getElementById('lblHeaderUserName');
            const lblHeaderAvatar = document.getElementById('lblHeaderAvatar');

            if (lblHeaderUserName) lblHeaderUserName.textContent = studentName;

            if (lblHeaderAvatar && studentName) {
                const parts = studentName.trim().split(' ');
                let initials = 'AS';
                if (parts.length >= 2) {
                    initials = (parts[0][0] + parts[1][0]).toUpperCase();
                } else if (parts.length === 1 && parts[0].length >= 2) {
                    initials = parts[0].substring(0, 2).toUpperCase();
                }
                lblHeaderAvatar.textContent = initials;
            }
        }

        function initMobileSidebar() {
            const toggleBtn = document.getElementById('btnToggleSidebar');
            const sidebar = document.getElementById('dashboardSidebar');

            if (toggleBtn && sidebar) {
                toggleBtn.addEventListener('click', function (e) {
                    e.stopPropagation();
                    sidebar.classList.toggle('open');
                });

                document.addEventListener('click', function (e) {
                    if (sidebar.classList.contains('open') && !sidebar.contains(e.target) && e.target !== toggleBtn) {
                        sidebar.classList.remove('open');
                    }
                });
            }
        }

        function closeModal(modalId) {
            const el = document.getElementById(modalId);
            if (el) el.classList.remove('active');
        }

        function openStartQuizModal() {
            document.getElementById('startQuizComingSoonModal').classList.add('active');
        }

        function showFeatureModal(title, description) {
            document.getElementById('featureModalTitle').textContent = title;
            document.getElementById('featureModalDesc').textContent = description;
            document.getElementById('genericFeatureModal').classList.add('active');
        }

        function showNotificationToast() {
            showFeatureModal('Notifications', 'You have no pending test reminders. All completed quizzes are verified and recorded.');
        }

        function handleLogout(e) {
            try {
                localStorage.removeItem('ql_student_profile');
                sessionStorage.removeItem('ql_student_profile');
            } catch (err) {}
        }
    </script>
</body>
</html>
