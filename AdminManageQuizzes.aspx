<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManageQuizzes.aspx.cs" Inherits="website.AdminManageQuizzes" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Quizzes - QuizLearn Admin</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body class="ql-dashboard-layout">
    <form id="formAdminManageQuizzes" runat="server">
        <!-- Server Data Bridge -->
        <input type="hidden" id="hdnSessionUser" value="<%: AdminName %>" />

        <!-- Sidebar Navigation -->
        <aside class="ql-sidebar" id="dashboardSidebar">
            <div class="ql-sidebar-top">
                <!-- Brand Logo -->
                <a href="AdminDashboard.aspx" class="ql-sidebar-brand" title="QuizLearn Admin Home">
                    <div class="ql-sidebar-brand-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                        </svg>
                    </div>
                    <div style="display: flex; flex-direction: column;">
                        <span class="ql-sidebar-brand-name" style="font-size: 16px;">QuizLearn</span>
                        <span style="font-size: 11px; font-weight: 700; color: #a78bfa; text-transform: uppercase; letter-spacing: 0.08em; margin-top: -2px;">Admin</span>
                    </div>
                </a>

                <!-- Navigation Links -->
                <nav class="ql-sidebar-nav" aria-label="Admin Navigation">
                    <a href="AdminDashboard.aspx" class="ql-nav-item" id="navDashboard">
                        <svg viewBox="0 0 24 24">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                        <span>Dashboard</span>
                    </a>

                    <a href="AdminManageQuizzes.aspx" class="ql-nav-item active" id="navManageQuizzes">
                        <svg viewBox="0 0 24 24">
                            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                        </svg>
                        <span>Manage Quizzes</span>
                    </a>

                    <a href="AdminAddQuiz.aspx" class="ql-nav-item" id="navAddQuiz">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>+ Add Quiz</span>
                    </a>

                    <a href="AdminStudentResults.aspx" class="ql-nav-item" id="navStudentResults">
                        <svg viewBox="0 0 24 24">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline>
                            <polyline points="17 6 23 6 23 12"></polyline>
                        </svg>
                        <span>Student Results</span>
                    </a>
                </nav>
            </div>

            <!-- Bottom Nav -->
            <div class="ql-sidebar-bottom">
                <a href="javascript:void(0);" class="ql-nav-item" id="navSettings" onclick="alert('Admin settings modal')">
                    <svg viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="3"></circle>
                        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                    </svg>
                    <span>Settings</span>
                </a>

                <a href="Login.aspx?logout=true" class="ql-nav-item" id="navLogout">
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
        <div class="ql-dashboard-main">
            <!-- Top Navbar -->
            <header class="ql-top-header">
                <div class="ql-header-left" style="display: flex; align-items: center; gap: 14px; flex: 1;">
                    <button type="button" class="ql-mobile-toggle" id="btnToggleSidebar" aria-label="Toggle menu">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="3" y1="12" x2="21" y2="12"></line>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <line x1="3" y1="18" x2="21" y2="18"></line>
                        </svg>
                    </button>

                    <div style="position: relative; max-width: 340px; width: 100%;">
                        <svg style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #64748b; width: 15px; height: 15px;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <input type="text" id="txtQuizSearch" placeholder="Search quizzes..." oninput="filterQuizzes()" style="width: 100%; background: #11131a; border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 8px; padding: 7px 12px 7px 34px; color: #ffffff; font-size: 13px; outline: none;" />
                    </div>
                </div>

                <div class="ql-header-right">
                    <button type="button" class="ql-icon-action-btn" title="Notifications">
                        <svg viewBox="0 0 24 24">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                    </button>

                    <div class="ql-user-pill" title="Admin Account">
                        <span class="ql-user-name" id="lblAdminUserName"><%: AdminName %></span>
                        <div class="ql-user-avatar" id="lblAdminAvatar" style="background: linear-gradient(135deg, #7c3aed, #ec4899);"><%: AdminAvatar %></div>
                    </div>
                </div>
            </header>

            <!-- Admin Body -->
            <main class="ql-dash-body">
                <div style="max-width: 1040px; margin: 0 auto; width: 100%;">
                    <!-- Top Heading & Add Quiz CTA -->
                    <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 24px; flex-wrap: wrap; gap: 14px;">
                        <div>
                            <h1 style="font-size: 26px; font-weight: 800; color: #ffffff; margin: 0 0 6px 0;">Manage Quizzes</h1>
                            <p style="font-size: 14px; color: #94a3b8; margin: 0;">Create, preview, and update quiz banks.</p>
                        </div>
                        <a href="AdminAddQuiz.aspx" class="ql-admin-btn-action-primary" style="width: auto; padding: 10px 22px;">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                            <span>+ Create New Quiz</span>
                        </a>
                    </div>

                    <!-- Table of Quizzes -->
                    <div class="ql-admin-table-wrap">
                        <div class="ql-admin-table-row-head" style="grid-template-columns: 2fr 1fr 1fr 1fr 1fr 1fr;">
                            <div>QUIZ TITLE</div>
                            <div>SUBJECT</div>
                            <div>DIFFICULTY</div>
                            <div>QUESTIONS</div>
                            <div>ATTEMPTS</div>
                            <div style="text-align: right;">ACTIONS</div>
                        </div>

                        <asp:Repeater ID="rptQuizzes" runat="server">
                            <ItemTemplate>
                                <div class="ql-admin-table-row quiz-entry" style="grid-template-columns: 2fr 1fr 1fr 1fr 1fr 1fr;"
                                     data-title="<%# Server.HtmlEncode(Eval("Title").ToString()) %>"
                                     data-subject="<%# Server.HtmlEncode(Eval("Subject").ToString()) %>">
                                    <div style="color: #ffffff; font-weight: 600;"><%# Server.HtmlEncode(Eval("Title").ToString()) %></div>
                                    <div><span style="background: rgba(124,58,237,0.15); color: #c084fc; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 700;"><%# Server.HtmlEncode(Eval("Subject").ToString()) %></span></div>
                                    <div style="color: #fbbf24; font-size: 12.5px;"><%# Server.HtmlEncode(Eval("Difficulty").ToString()) %></div>
                                    <div style="font-family: monospace;"><%# Eval("TotalQuestions") %> Qs</div>
                                    <div style="font-family: monospace;"><%# Eval("IsActive").ToString() == "True" ? "Active" : "Inactive" %></div>
                                    <div style="text-align: right; display: flex; justify-content: flex-end; gap: 10px; flex-wrap: wrap;">
                                        <a href="ActualQuiz.aspx?quizid=<%# Eval("QuizId") %>" class="ql-admin-view-details-link" title="Preview">Preview</a>
                                        <a href="AdminManageQuizzes.aspx?action=<%# (bool)Eval("IsActive") ? "deactivate" : "activate" %>&qid=<%# Eval("QuizId") %>"
                                           style="color: <%# (bool)Eval("IsActive") ? "#94a3b8" : "#34d399" %>; font-size: 12px; text-decoration: none;"
                                           onclick="return confirm('Toggle active status?')">
                                           <%# (bool)Eval("IsActive") ? "Deactivate" : "Activate" %>
                                        </a>
                                        <a href="AdminManageQuizzes.aspx?action=delete&qid=<%# Eval("QuizId") %>"
                                           style="color: #ef4444; font-size: 12px; text-decoration: none;"
                                           onclick="return confirm('Delete this quiz and all its questions? This cannot be undone.')">Delete</a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="litNoQuizzes" runat="server" Visible="false">
                            <div style="padding: 32px; text-align: center; color: #64748b; font-size: 14px;">No quizzes found. <a href="AdminAddQuiz.aspx" style="color:#7c3aed;">Create one now</a>.</div>
                        </asp:Literal>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initMobileSidebar();
            loadCustomAdminQuizzes();
        });

        function loadCustomAdminQuizzes() {
            try {
                const customQuizzes = JSON.parse(localStorage.getItem('ql_custom_admin_quizzes') || '[]');
                const container = document.getElementById('quizListBody');
                if (container && customQuizzes.length > 0) {
                    customQuizzes.forEach(q => {
                        const row = document.createElement('div');
                        row.className = 'ql-admin-table-row quiz-entry';
                        row.style.gridTemplateColumns = '2fr 1fr 1fr 1fr 1fr 1fr';
                        row.setAttribute('data-title', q.title);
                        row.setAttribute('data-subject', q.subject);
                        row.innerHTML = `
                            <div style="color: #ffffff; font-weight: 600;">${q.title} <span style="font-size: 10px; color: #a78bfa; margin-left: 6px;">[NEW]</span></div>
                            <div><span style="background: rgba(124, 58, 237, 0.15); color: #c084fc; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 700;">${q.subject || 'Custom'}</span></div>
                            <div style="color: #fbbf24; font-size: 12.5px;">${q.difficulty}</div>
                            <div style="font-family: monospace;">${q.questionsCount} Qs</div>
                            <div style="font-family: monospace;">0</div>
                            <div style="text-align: right; display: flex; justify-content: flex-end; gap: 10px;">
                                <a href="ActualQuiz.aspx?id=${q.id}" class="ql-admin-view-details-link" title="Preview">Preview</a>
                            </div>
                        `;
                        container.insertBefore(row, container.firstChild);
                    });
                }
            } catch (e) {}
        }

        function filterQuizzes() {
            const query = (document.getElementById('txtQuizSearch').value || '').trim().toLowerCase();
            const entries = document.querySelectorAll('.quiz-entry');

            entries.forEach(entry => {
                const title = (entry.getAttribute('data-title') || '').toLowerCase();
                const subject = (entry.getAttribute('data-subject') || '').toLowerCase();
                if (!query || title.includes(query) || subject.includes(query)) {
                    entry.style.display = 'grid';
                } else {
                    entry.style.display = 'none';
                }
            });
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
    </script>
</body>
</html>
