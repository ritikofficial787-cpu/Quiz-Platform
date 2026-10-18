<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MistakeNotebook.aspx.cs" Inherits="website.MistakeNotebook" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mistake Notebook - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@500;600&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <style>
        .ql-dashboard-layout {
            display: flex;
            min-height: 100vh;
            width: 100%;
        }
        .ql-dashboard-layout > form {
            display: flex;
            flex: 1 1 100%;
            width: 100%;
            min-height: 100vh;
            min-width: 0;
        }
        .ql-dash-main {
            margin-left: 250px;
            flex: 1 1 auto;
            width: calc(100% - 250px) !important;
            min-width: 0;
            display: flex;
            flex-direction: column;
            background-color: #080a13;
            box-sizing: border-box;
        }
        .ql-app-header {
            width: 100%;
            box-sizing: border-box;
            padding: 0 40px;
        }
        .ql-dash-body {
            padding: 32px 40px 60px 40px;
            width: 100% !important;
            max-width: 1520px !important;
            margin: 0 !important;
            align-self: stretch !important;
            box-sizing: border-box;
        }
        .ql-mistakes-wrap {
            max-width: 100% !important;
            margin: 0 !important;
            width: 100% !important;
        }
    </style>
</head>
<body class="ql-dashboard-layout">
    <form id="formMistakeNotebook" runat="server">
        <!-- Server Data Bridge -->
        <input type="hidden" id="hdnSessionUser" value="<%: StudentName %>" />

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

                    <a href="ExploreQuizzes.aspx" class="ql-nav-item" id="navQuizzes">
                        <svg viewBox="0 0 24 24">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                        <span>Explore Quizzes</span>
                    </a>

                    <a href="QuizResult.aspx" class="ql-nav-item" id="navResults">
                        <svg viewBox="0 0 24 24">
                            <line x1="18" y1="20" x2="18" y2="10"></line>
                            <line x1="12" y1="20" x2="12" y2="4"></line>
                            <line x1="6" y1="20" x2="6" y2="14"></line>
                        </svg>
                        <span>My Results</span>
                    </a>

                    <a href="MistakeNotebook.aspx" class="ql-nav-item active" id="navMistakes">
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
                <div class="ql-header-left">
                    <button type="button" class="ql-mobile-toggle" id="btnToggleSidebar" aria-label="Toggle menu">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="3" y1="12" x2="21" y2="12"></line>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <line x1="3" y1="18" x2="21" y2="18"></line>
                        </svg>
                    </button>
                </div>

                <div class="ql-header-right">
                    <button type="button" class="ql-icon-action-btn" title="Notifications">
                        <svg viewBox="0 0 24 24">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                    </button>

                    <div class="ql-user-pill" onclick="window.location.href='Profile.aspx'" title="View Profile" style="cursor: pointer;">
                        <span class="ql-user-name" id="lblHeaderUserName"><%: StudentName %></span>
                        <div class="ql-user-avatar" id="lblHeaderAvatar"><%: StudentInitials %></div>
                    </div>
                </div>
            </header>

            <!-- Mistake Notebook Content -->
            <main class="ql-dash-body">
                <div class="ql-mistakes-wrap">
                    <!-- Heading -->
                    <div style="margin-bottom: 26px;">
                        <h1 style="font-size: 26px; font-weight: 800; color: #ffffff; margin: 0 0 6px 0;">Mistake Notebook</h1>
                        <p style="font-size: 14px; color: #94a3b8; margin: 0;">Review your mistakes and strengthen your weak areas.</p>
                    </div>

                    <!-- Mistakes Overview Banner -->
                    <div class="ql-mistakes-overview-card">
                        <div class="ql-mistakes-progress-info">
                            <div class="ql-mistakes-progress-header">
                                <span class="ql-mistakes-label">MISTAKES REVIEWED</span>
                                <span class="ql-mistakes-fraction" id="lblMistakesFraction">8 / 12</span>
                            </div>
                            <div class="ql-mistakes-track">
                                <div class="ql-mistakes-bar-fill" id="mistakesFill" style="width: 66.7%;"></div>
                            </div>
                        </div>

                        <a href="ActualQuiz.aspx?id=csharp-oop" class="ql-btn-practice-mistakes">
                            <span>Practice Mistakes</span>
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                <polyline points="12 5 19 12 12 19"></polyline>
                            </svg>
                        </a>
                    </div>

                    <!-- Filters and Search Bar -->
                    <div class="ql-mistakes-controls-row">
                        <div class="ql-filter-pills-wrap">
                            <button type="button" class="ql-filter-pill-btn active" data-category="all" onclick="filterCategory('all', this)">All</button>
                            <button type="button" class="ql-filter-pill-btn" data-category="csharp" onclick="filterCategory('csharp', this)">C#</button>
                            <button type="button" class="ql-filter-pill-btn" data-category="java" onclick="filterCategory('java', this)">Java</button>
                            <button type="button" class="ql-filter-pill-btn" data-category="dbms" onclick="filterCategory('dbms', this)">DBMS</button>
                        </div>

                        <div class="ql-mistakes-search-box">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                            </svg>
                            <input type="text" class="ql-mistakes-search-input" id="txtMistakeSearch" placeholder="Search mistakes..." oninput="handleMistakeSearch()" />
                        </div>
                    </div>

                    <!-- List Header -->
                    <div class="ql-mistakes-section-title">MISTAKES TO REVIEW</div>

                    <!-- Mistakes List (No Ask AI section) -->
                    <div class="ql-mistakes-list" id="mistakesListContainer">
                        <!-- Card 1: C# OOP -->
                        <div class="ql-mistake-card-item" data-category="csharp" data-keywords="c# keyword inherit class implements">
                            <div class="ql-mistake-card-meta">
                                <span>C# OOP FUNDAMENTALS</span>
                                <span class="ql-mistake-badge-dot-inc">● INCORRECT</span>
                            </div>
                            <h3 class="ql-mistake-card-text">Which keyword is used to inherit a class in C#?</h3>
                            <div class="ql-mistake-card-footer">
                                <div class="ql-mistake-answers-block">
                                    <div><span class="ql-ans-sub-label">YOUR ANSWER</span><span class="ql-ans-val-wrong">implements</span></div>
                                    <div><span class="ql-ans-sub-label">CORRECT ANSWER</span><span class="ql-ans-val-correct">:</span></div>
                                </div>
                                <button type="button" class="ql-btn-review-link" onclick="openReviewModal(1)">
                                    <span>Review</span>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                                </button>
                            </div>
                        </div>

                        <!-- Card 2: DBMS -->
                        <div class="ql-mistake-card-item" data-category="dbms" data-keywords="database normal form partial dependency 3nf 2nf">
                            <div class="ql-mistake-card-meta">
                                <span>DATABASE FUNDAMENTALS</span>
                                <span class="ql-mistake-badge-dot-inc">● INCORRECT</span>
                            </div>
                            <h3 class="ql-mistake-card-text">Which normal form removes partial dependency?</h3>
                            <div class="ql-mistake-card-footer">
                                <div class="ql-mistake-answers-block">
                                    <div><span class="ql-ans-sub-label">YOUR ANSWER</span><span class="ql-ans-val-wrong">3NF</span></div>
                                    <div><span class="ql-ans-sub-label">CORRECT ANSWER</span><span class="ql-ans-val-correct">2NF</span></div>
                                </div>
                                <button type="button" class="ql-btn-review-link" onclick="openReviewModal(2)">
                                    <span>Review</span>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                                </button>
                            </div>
                        </div>

                        <!-- Card 3: Java -->
                        <div class="ql-mistake-card-item" data-category="java" data-keywords="java keyword inherit class extends">
                            <div class="ql-mistake-card-meta">
                                <span>JAVA PROGRAMMING BASICS</span>
                                <span class="ql-mistake-badge-dot-rev">● REVIEWED</span>
                            </div>
                            <h3 class="ql-mistake-card-text">Which keyword is used to inherit a class in Java?</h3>
                            <div class="ql-mistake-card-footer">
                                <div class="ql-mistake-answers-block">
                                    <div><span class="ql-ans-sub-label">CORRECT ANSWER</span><span class="ql-ans-val-correct">extends</span></div>
                                </div>
                                <button type="button" class="ql-btn-review-link" onclick="openReviewModal(3)">
                                    <span>Review</span>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                                </button>
                            </div>
                        </div>

                        <!-- Card 4: DBMS (Bonus) -->
                        <div class="ql-mistake-card-item" data-category="dbms" data-keywords="sql table permanent delete drop">
                            <div class="ql-mistake-card-meta">
                                <span>DATABASE FUNDAMENTALS</span>
                                <span class="ql-mistake-badge-dot-inc">● INCORRECT</span>
                            </div>
                            <h3 class="ql-mistake-card-text">Which SQL statement removes a table and its structure permanently?</h3>
                            <div class="ql-mistake-card-footer">
                                <div class="ql-mistake-answers-block">
                                    <div><span class="ql-ans-sub-label">YOUR ANSWER</span><span class="ql-ans-val-wrong">DELETE</span></div>
                                    <div><span class="ql-ans-sub-label">CORRECT ANSWER</span><span class="ql-ans-val-correct">DROP TABLE</span></div>
                                </div>
                                <button type="button" class="ql-btn-review-link" onclick="openReviewModal(4)">
                                    <span>Review</span>
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Motivational Bottom Quote -->
                    <div class="ql-mistakes-quote-box">
                        "Learn from your mistakes and improve your next quiz score."
                    </div>
                </div>
            </main>
        </div>
    </form>

    <!-- Review Modal Dialog -->
    <div class="ql-modal-backdrop" id="reviewModal">
        <div class="ql-modal-box">
            <button type="button" class="ql-modal-close" onclick="closeReviewModal()">&times;</button>
            <div style="font-size: 11px; font-weight: 700; color: #a78bfa; text-transform: uppercase; margin-bottom: 8px;" id="modalSubject">C# OOP Fundamentals</div>
            <h3 style="font-size: 18px; font-weight: 700; color: #ffffff; margin: 0 0 16px 0;" id="modalQuestion">Question Title</h3>
            <div style="background: #161822; border-radius: 8px; padding: 14px; margin-bottom: 16px;">
                <div style="font-size: 12px; margin-bottom: 6px;"><span style="color: #64748b; font-weight: 700;">YOUR ANSWER: </span><span id="modalYourAns" style="color: #ef4444; font-family: monospace; font-weight: 600;">-</span></div>
                <div style="font-size: 12px;"><span style="color: #64748b; font-weight: 700;">CORRECT ANSWER: </span><span id="modalCorrectAns" style="color: #10b981; font-family: monospace; font-weight: 600;">-</span></div>
            </div>
            <div style="font-size: 13.5px; line-height: 1.6; color: #cbd5e1; margin-bottom: 20px;" id="modalExplanation">
                Explanation text goes here.
            </div>
            <div style="display: flex; justify-content: flex-end; gap: 10px;">
                <button type="button" class="ql-btn-practice-mistakes" style="padding: 8px 16px; font-size: 13px;" onclick="closeReviewModal()">Got it</button>
            </div>
        </div>
    </div>

    <!-- Pure JavaScript (No inline ASP server tags inside script block) -->
    <script>
        const MISTAKES_DATA = {
            1: {
                subject: "C# OOP Fundamentals",
                question: "Which keyword is used to inherit a class in C#?",
                yourAns: "implements",
                correctAns: ": (Colon)",
                explanation: "In C#, class inheritance uses the colon (:) operator. For example: 'class Dog : Animal'. The 'implements' keyword is used in languages like Java, not in C#."
            },
            2: {
                subject: "Database Fundamentals",
                question: "Which normal form removes partial dependency?",
                yourAns: "3NF",
                correctAns: "2NF (Second Normal Form)",
                explanation: "2NF addresses and removes partial functional dependencies (where a non-key attribute depends on only part of a composite primary key). 3NF removes transitive dependencies."
            },
            3: {
                subject: "Java Programming Basics",
                question: "Which keyword is used to inherit a class in Java?",
                yourAns: "N/A (Previously Reviewed)",
                correctAns: "extends",
                explanation: "Java uses the 'extends' keyword for inheriting from a superclass (e.g., 'class Dog extends Animal'), while 'implements' is reserved for implementing interfaces."
            },
            4: {
                subject: "Database Fundamentals",
                question: "Which SQL statement removes a table and its structure permanently?",
                yourAns: "DELETE",
                correctAns: "DROP TABLE",
                explanation: "DELETE removes rows but leaves table schema and constraints intact. DROP TABLE permanently eliminates both the table schema and all associated data from the database catalog."
            }
        };

        let currentFilter = 'all';

        document.addEventListener('DOMContentLoaded', function () {
            initStudentProfile();
            initMobileSidebar();
        });

        function initStudentProfile() {
            let studentName = 'Aarav Sharma';
            const hdnUser = document.getElementById('hdnSessionUser');
            if (hdnUser && hdnUser.value && hdnUser.value.trim().length > 0) {
                studentName = hdnUser.value.trim();
            }

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

        function filterCategory(category, btnElement) {
            currentFilter = category;
            const buttons = document.querySelectorAll('.ql-filter-pill-btn');
            buttons.forEach(b => b.classList.remove('active'));
            if (btnElement) btnElement.classList.add('active');
            applyFilters();
        }

        function handleMistakeSearch() {
            applyFilters();
        }

        function applyFilters() {
            const query = (document.getElementById('txtMistakeSearch').value || '').trim().toLowerCase();
            const cards = document.querySelectorAll('.ql-mistake-card-item');

            cards.forEach(card => {
                const cardCategory = card.getAttribute('data-category') || '';
                const cardKeywords = (card.getAttribute('data-keywords') || '') + ' ' + card.innerText.toLowerCase();

                const categoryMatch = (currentFilter === 'all') || (cardCategory === currentFilter);
                const queryMatch = !query || cardKeywords.includes(query);

                if (categoryMatch && queryMatch) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        function openReviewModal(id) {
            const data = MISTAKES_DATA[id];
            if (!data) return;

            document.getElementById('modalSubject').textContent = data.subject;
            document.getElementById('modalQuestion').textContent = data.question;
            document.getElementById('modalYourAns').textContent = data.yourAns;
            document.getElementById('modalCorrectAns').textContent = data.correctAns;
            document.getElementById('modalExplanation').textContent = data.explanation;

            document.getElementById('reviewModal').classList.add('open');
        }

        function closeReviewModal() {
            document.getElementById('reviewModal').classList.remove('open');
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
