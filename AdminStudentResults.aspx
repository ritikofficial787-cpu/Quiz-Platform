<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminStudentResults.aspx.cs" Inherits="website.AdminStudentResults" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Results - QuizLearn Admin</title>
    
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
    <form id="formAdminStudentResults" runat="server">
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

                    <a href="AdminManageQuizzes.aspx" class="ql-nav-item" id="navManageQuizzes">
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

                    <a href="AdminStudentResults.aspx" class="ql-nav-item active" id="navStudentResults">
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
                        <input type="text" id="txtStudentSearch" placeholder="Search student or quiz..." oninput="handleStudentSearch()" style="width: 100%; background: #11131a; border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 8px; padding: 7px 12px 7px 34px; color: #ffffff; font-size: 13px; outline: none;" />
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
                    <!-- Heading -->
                    <div style="margin-bottom: 22px;">
                        <h1 style="font-size: 26px; font-weight: 800; color: #ffffff; margin: 0 0 6px 0;">Student Results</h1>
                        <p style="font-size: 14px; color: #94a3b8; margin: 0;">View and monitor student quiz performance.</p>
                    </div>

                    <!-- Category Filter Pills -->
                    <div class="ql-filter-pills-wrap" style="margin-bottom: 24px;">
                        <button type="button" class="ql-filter-pill-btn active" data-filter="all" onclick="filterCategory('all', this)">All</button>
                        <button type="button" class="ql-filter-pill-btn" data-filter="csharp" onclick="filterCategory('csharp', this)">C#</button>
                        <button type="button" class="ql-filter-pill-btn" data-filter="java" onclick="filterCategory('java', this)">Java</button>
                        <button type="button" class="ql-filter-pill-btn" data-filter="dbms" onclick="filterCategory('dbms', this)">DBMS</button>
                    </div>

                    <!-- Student Results Table Container -->
                    <div class="ql-admin-table-wrap">
                        <div class="ql-admin-table-row-head">
                            <div>STUDENT NAME</div>
                            <div>QUIZ</div>
                            <div>SCORE</div>
                            <div>PERCENTAGE</div>
                            <div>STATUS</div>
                            <div style="text-align: right;">ACTION</div>
                        </div>

                        <div id="resultsTableBody">
                            <!-- Row 1: Aarav Sharma -->
                            <div class="ql-admin-table-row student-row" data-category="csharp" data-name="Aarav Sharma" data-quiz="C# OOP Fundamentals" data-score="12/15" data-pct="80%" data-time="18m" data-date="Today">
                                <div class="ql-admin-student-cell">
                                    <div class="ql-admin-student-avatar">AS</div>
                                    <span>Aarav Sharma</span>
                                </div>
                                <div style="color: #cbd5e1;">C# OOP Fundamentals</div>
                                <div style="font-family: monospace; font-weight: 600;">12/15</div>
                                <div style="color: #10b981; font-weight: 700;">80%</div>
                                <div><span class="ql-admin-status-completed">COMPLETED</span></div>
                                <div style="text-align: right;">
                                    <button type="button" class="ql-admin-view-details-link" onclick="openStudentDetailsModal('Aarav Sharma', 'C# OOP Fundamentals', '12 / 15', '80%', '18m', 'Pass (Excellence)')">View Details</button>
                                </div>
                            </div>

                            <!-- Row 2: Priya Patel -->
                            <div class="ql-admin-table-row student-row" data-category="dbms" data-name="Priya Patel" data-quiz="Database Fundamentals" data-score="15/20" data-pct="75%" data-time="22m" data-date="Yesterday">
                                <div class="ql-admin-student-cell">
                                    <div class="ql-admin-student-avatar" style="background: linear-gradient(135deg, #06b6d4, #3b82f6);">PP</div>
                                    <span>Priya Patel</span>
                                </div>
                                <div style="color: #cbd5e1;">Database Fundamentals</div>
                                <div style="font-family: monospace; font-weight: 600;">15/20</div>
                                <div style="color: #10b981; font-weight: 700;">75%</div>
                                <div><span class="ql-admin-status-completed">COMPLETED</span></div>
                                <div style="text-align: right;">
                                    <button type="button" class="ql-admin-view-details-link" onclick="openStudentDetailsModal('Priya Patel', 'Database Fundamentals', '15 / 20', '75%', '22m', 'Pass (Good)')">View Details</button>
                                </div>
                            </div>

                            <!-- Row 3: Rahul Verma -->
                            <div class="ql-admin-table-row student-row" data-category="java" data-name="Rahul Verma" data-quiz="Java Programming Basics" data-score="13/15" data-pct="87%" data-time="15m" data-date="2 days ago">
                                <div class="ql-admin-student-cell">
                                    <div class="ql-admin-student-avatar" style="background: linear-gradient(135deg, #f59e0b, #ef4444);">RV</div>
                                    <span>Rahul Verma</span>
                                </div>
                                <div style="color: #cbd5e1;">Java Programming Basics</div>
                                <div style="font-family: monospace; font-weight: 600;">13/15</div>
                                <div style="color: #10b981; font-weight: 700;">87%</div>
                                <div><span class="ql-admin-status-completed">COMPLETED</span></div>
                                <div style="text-align: right;">
                                    <button type="button" class="ql-admin-view-details-link" onclick="openStudentDetailsModal('Rahul Verma', 'Java Programming Basics', '13 / 15', '87%', '15m', 'Pass (Excellence)')">View Details</button>
                                </div>
                            </div>

                            <!-- Row 4: Neha Gupta -->
                            <div class="ql-admin-table-row student-row" data-category="csharp" data-name="Neha Gupta" data-quiz="Computer Networks" data-score="16/20" data-pct="80%" data-time="24m" data-date="3 days ago">
                                <div class="ql-admin-student-cell">
                                    <div class="ql-admin-student-avatar" style="background: linear-gradient(135deg, #10b981, #06b6d4);">NG</div>
                                    <span>Neha Gupta</span>
                                </div>
                                <div style="color: #cbd5e1;">Computer Networks</div>
                                <div style="font-family: monospace; font-weight: 600;">16/20</div>
                                <div style="color: #10b981; font-weight: 700;">80%</div>
                                <div><span class="ql-admin-status-completed">COMPLETED</span></div>
                                <div style="text-align: right;">
                                    <button type="button" class="ql-admin-view-details-link" onclick="openStudentDetailsModal('Neha Gupta', 'Computer Networks', '16 / 20', '80%', '24m', 'Pass (Good)')">View Details</button>
                                </div>
                            </div>
                        </div>

                        <!-- Table Footer -->
                        <div class="ql-admin-table-footer">
                            <span id="lblAttemptCount">Showing 4 of 356 attempts.</span>
                            <div class="ql-admin-pagination-btns">
                                <button type="button" class="ql-admin-page-btn" title="Previous page">&lt;</button>
                                <button type="button" class="ql-admin-page-btn active">1</button>
                                <button type="button" class="ql-admin-page-btn">2</button>
                                <button type="button" class="ql-admin-page-btn" title="Next page">&gt;</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <!-- Student Attempt Details Modal Dialog -->
    <div class="ql-modal-backdrop" id="studentDetailsModal">
        <div class="ql-modal-box">
            <button type="button" class="ql-modal-close" onclick="closeStudentDetailsModal()">&times;</button>
            <div style="font-size: 11px; font-weight: 700; color: #a78bfa; text-transform: uppercase; margin-bottom: 6px;">Student Attempt Summary</div>
            <h3 style="font-size: 20px; font-weight: 800; color: #ffffff; margin: 0 0 16px 0;" id="modalStudentName">Aarav Sharma</h3>
            
            <div style="background: #161822; border-radius: 10px; padding: 16px; margin-bottom: 20px; display: grid; grid-template-columns: 1fr 1fr; gap: 14px;">
                <div>
                    <div style="font-size: 11px; color: #64748b; font-weight: 700;">QUIZ ASSIGNED</div>
                    <div style="font-size: 14px; color: #ffffff; font-weight: 600;" id="modalQuizTitle">C# OOP Fundamentals</div>
                </div>
                <div>
                    <div style="font-size: 11px; color: #64748b; font-weight: 700;">TIME TAKEN</div>
                    <div style="font-size: 14px; color: #ffffff; font-weight: 600;" id="modalTimeTaken">18m</div>
                </div>
                <div>
                    <div style="font-size: 11px; color: #64748b; font-weight: 700;">SCORE OBTAINED</div>
                    <div style="font-size: 15px; color: #10b981; font-weight: 700;" id="modalScore">12 / 15 (80%)</div>
                </div>
                <div>
                    <div style="font-size: 11px; color: #64748b; font-weight: 700;">EVALUATION</div>
                    <div style="font-size: 13.5px; color: #c084fc; font-weight: 600;" id="modalEvaluation">Pass (Excellence)</div>
                </div>
            </div>

            <div style="display: flex; justify-content: flex-end;">
                <button type="button" class="ql-admin-btn-action-primary" style="width: auto; padding: 8px 20px; font-size: 13px;" onclick="closeStudentDetailsModal()">Close</button>
            </div>
        </div>
    </div>

    <script>
        let currentFilter = 'all';

        document.addEventListener('DOMContentLoaded', function () {
            initMobileSidebar();
            checkDynamicStudentSubmissions();
        });

        // Load any newly completed quizzes submitted by the current user session
        function checkDynamicStudentSubmissions() {
            try {
                const lastResultRaw = sessionStorage.getItem('ql_last_quiz_result') || localStorage.getItem('ql_last_quiz_result');
                if (lastResultRaw) {
                    const res = JSON.parse(lastResultRaw);
                    const tableBody = document.getElementById('resultsTableBody');
                    if (tableBody && res.studentName && res.quizTitle) {
                        const newRow = document.createElement('div');
                        newRow.className = 'ql-admin-table-row student-row';
                        newRow.setAttribute('data-category', 'csharp');
                        newRow.setAttribute('data-name', res.studentName);
                        newRow.setAttribute('data-quiz', res.quizTitle);
                        newRow.innerHTML = `
                            <div class="ql-admin-student-cell">
                                <div class="ql-admin-student-avatar" style="background: linear-gradient(135deg, #7c3aed, #a855f7);">AS</div>
                                <span>${res.studentName}</span>
                            </div>
                            <div style="color: #cbd5e1;">${res.quizTitle}</div>
                            <div style="font-family: monospace; font-weight: 600;">${res.correctCount}/${res.totalQuestions}</div>
                            <div style="color: #10b981; font-weight: 700;">${res.scorePct}%</div>
                            <div><span class="ql-admin-status-completed">COMPLETED</span></div>
                            <div style="text-align: right;">
                                <button type="button" class="ql-admin-view-details-link" onclick="openStudentDetailsModal('${res.studentName}', '${res.quizTitle}', '${res.correctCount} / ${res.totalQuestions}', '${res.scorePct}%', '${res.timeTakenMinutes}m', 'Pass')">View Details</button>
                            </div>
                        `;
                        // Insert at top of table
                        tableBody.insertBefore(newRow, tableBody.firstChild);
                    }
                }
            } catch (e) {}
        }

        function filterCategory(filter, btnElement) {
            currentFilter = filter;
            const buttons = document.querySelectorAll('.ql-filter-pill-btn');
            buttons.forEach(b => b.classList.remove('active'));
            if (btnElement) btnElement.classList.add('active');
            applyTableFilters();
        }

        function handleStudentSearch() {
            applyTableFilters();
        }

        function applyTableFilters() {
            const query = (document.getElementById('txtStudentSearch').value || '').trim().toLowerCase();
            const rows = document.querySelectorAll('.student-row');
            let visibleCount = 0;

            rows.forEach(row => {
                const category = row.getAttribute('data-category') || '';
                const text = row.innerText.toLowerCase();

                const categoryMatch = (currentFilter === 'all') || (category === currentFilter);
                const queryMatch = !query || text.includes(query);

                if (categoryMatch && queryMatch) {
                    row.style.display = 'grid';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });

            document.getElementById('lblAttemptCount').textContent = `Showing ${visibleCount} of 356 attempts.`;
        }

        function openStudentDetailsModal(student, quiz, score, pct, time, evalText) {
            document.getElementById('modalStudentName').textContent = student;
            document.getElementById('modalQuizTitle').textContent = quiz;
            document.getElementById('modalScore').textContent = `${score} (${pct})`;
            document.getElementById('modalTimeTaken').textContent = time;
            document.getElementById('modalEvaluation').textContent = evalText;

            document.getElementById('studentDetailsModal').classList.add('open');
        }

        function closeStudentDetailsModal() {
            document.getElementById('studentDetailsModal').classList.remove('open');
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
