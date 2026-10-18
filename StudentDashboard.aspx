<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="website.StudentDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
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
    </style>
</head>
<body class="ql-dashboard-layout">
    <form id="formDashboard" runat="server">
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
                    <a href="StudentDashboard.aspx" class="ql-nav-item active" id="navDashboard">
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

                    <!-- Search Input -->
                    <div class="ql-search-box">
                        <span class="ql-search-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                            </svg>
                        </span>
                        <input type="text" id="txtQuizSearch" class="ql-search-input" placeholder="Search quizzes..." autocomplete="off" />
                    </div>
                </div>

                <div class="ql-header-right">
                    <!-- Notification Bell -->
                    <div class="ql-notif-wrapper" id="notifWrapper" style="position: relative;">
                        <button type="button" class="ql-notif-btn" id="btnNotifications" title="Notifications" onclick="toggleNotifPanel(event)">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                                <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                            </svg>
                            <span class="ql-notif-dot" id="notifDot"></span>
                        </button>

                        <!-- Notification Dropdown Panel -->
                        <div id="notifPanel" style="display:none; position:absolute; top:calc(100% + 10px); right:0; width:320px; background:#111422; border:1px solid rgba(255,255,255,0.1); border-radius:14px; box-shadow:0 20px 60px rgba(0,0,0,0.5); z-index:9999; overflow:hidden;">
                            <!-- Panel Header -->
                            <div style="display:flex; justify-content:space-between; align-items:center; padding:14px 18px; border-bottom:1px solid rgba(255,255,255,0.07);">
                                <span style="font-size:14px; font-weight:700; color:#ffffff;">Notifications</span>
                                <button type="button" onclick="markAllRead()" style="background:none; border:none; color:#a78bfa; font-size:12px; cursor:pointer; font-weight:600;">Mark all read</button>
                            </div>
                            <!-- Notification Items -->
                            <div style="max-height:320px; overflow-y:auto;">
                                <!-- Item 1 -->
                                <div class="ql-notif-item unread" style="display:flex; gap:12px; padding:14px 18px; border-bottom:1px solid rgba(255,255,255,0.05); cursor:default;">
                                    <div style="width:36px; height:36px; border-radius:50%; background:rgba(16,185,129,0.15); border:1px solid rgba(16,185,129,0.3); display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="2"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                    </div>
                                    <div>
                                        <div style="font-size:13px; font-weight:600; color:#ffffff; margin-bottom:2px;">Quiz Completed ðŸŽ‰</div>
                                        <div style="font-size:12px; color:#94a3b8;">You scored <strong style="color:#10b981;">87%</strong> on Data Structures Basics.</div>
                                        <div style="font-size:11px; color:#475569; margin-top:4px;">Just now</div>
                                    </div>
                                </div>
                                <!-- Item 2 -->
                                <div class="ql-notif-item unread" style="display:flex; gap:12px; padding:14px 18px; border-bottom:1px solid rgba(255,255,255,0.05); cursor:default;">
                                    <div style="width:36px; height:36px; border-radius:50%; background:rgba(124,58,237,0.15); border:1px solid rgba(124,58,237,0.3); display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#a78bfa" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                                    </div>
                                    <div>
                                        <div style="font-size:13px; font-weight:600; color:#ffffff; margin-bottom:2px;">New Milestone Reached ðŸ†</div>
                                        <div style="font-size:12px; color:#94a3b8;">You reached <strong style="color:#a78bfa;">Top 10%</strong> on the leaderboard!</div>
                                        <div style="font-size:11px; color:#475569; margin-top:4px;">2 hours ago</div>
                                    </div>
                                </div>
                                <!-- Item 3 -->
                                <div class="ql-notif-item" style="display:flex; gap:12px; padding:14px 18px; border-bottom:1px solid rgba(255,255,255,0.05); cursor:default; opacity:0.7;">
                                    <div style="width:36px; height:36px; border-radius:50%; background:rgba(245,158,11,0.15); border:1px solid rgba(245,158,11,0.3); display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#f59e0b" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                                    </div>
                                    <div>
                                        <div style="font-size:13px; font-weight:600; color:#ffffff; margin-bottom:2px;">Study Reminder</div>
                                        <div style="font-size:12px; color:#94a3b8;">You haven't practised <strong>Algorithms</strong> in 3 days. Keep your streak!</div>
                                        <div style="font-size:11px; color:#475569; margin-top:4px;">Yesterday</div>
                                    </div>
                                </div>
                                <!-- Item 4 -->
                                <div class="ql-notif-item" style="display:flex; gap:12px; padding:14px 18px; cursor:default; opacity:0.7;">
                                    <div style="width:36px; height:36px; border-radius:50%; background:rgba(6,182,212,0.15); border:1px solid rgba(6,182,212,0.3); display:flex; align-items:center; justify-content:center; flex-shrink:0;">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#06b6d4" stroke-width="2"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg>
                                    </div>
                                    <div>
                                        <div style="font-size:13px; font-weight:600; color:#ffffff; margin-bottom:2px;">Progress Update</div>
                                        <div style="font-size:12px; color:#94a3b8;">Your DBMS Fundamentals score improved by <strong style="color:#06b6d4;">+12%</strong> this week.</div>
                                        <div style="font-size:11px; color:#475569; margin-top:4px;">3 days ago</div>
                                    </div>
                                </div>
                            </div>
                            <!-- Panel Footer -->
                            <div style="padding:12px 18px; border-top:1px solid rgba(255,255,255,0.07); text-align:center;">
                                <a href="QuizResult.aspx" style="font-size:12px; color:#a78bfa; text-decoration:none; font-weight:600;">View all activity â†’</a>
                            </div>
                        </div>
                    </div>

                    <!-- User Pill Badge -->
                    <div class="ql-user-pill" id="userPill" onclick="window.location.href='Profile.aspx'" title="View Profile">
                        <span class="ql-user-name" id="lblHeaderUserName">Aarav Sharma</span>
                        <div class="ql-user-avatar" id="lblHeaderAvatar">AS</div>
                    </div>
                </div>
            </header>

            <!-- Dashboard Body -->
            <main class="ql-dash-body">
                <!-- Welcome Banner -->
                <div class="ql-welcome-banner">
                    <h1 class="ql-welcome-title" id="greetingTitle">Good Morning, Aarav ðŸ‘‹</h1>
                    <p class="ql-welcome-subtitle">Ready to test your knowledge and improve your skills?</p>
                </div>

                <!-- Top 3 Stat Cards -->
                <section class="ql-stats-row" aria-label="Student Stats Overview">
                    <!-- Card 1: Quizzes Completed -->
                    <div class="ql-stat-card">
                        <div>
                            <div class="ql-stat-number" id="valQuizzesCompleted">12</div>
                            <div class="ql-stat-label">Quizzes Completed</div>
                        </div>
                        <div class="ql-stat-icon-wrap" title="Quizzes Completed">
                            <svg viewBox="0 0 24 24">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                            </svg>
                        </div>
                    </div>

                    <!-- Card 2: Average Score -->
                    <div class="ql-stat-card">
                        <div>
                            <div class="ql-stat-number" id="valAverageScore">84%</div>
                            <div class="ql-stat-label">Average Score</div>
                        </div>
                        <div class="ql-stat-icon-wrap" title="Average Score">
                            <svg viewBox="0 0 24 24">
                                <circle cx="7.5" cy="7.5" r="2.5"></circle>
                                <circle cx="16.5" cy="16.5" r="2.5"></circle>
                                <line x1="20" y1="4" x2="4" y2="20"></line>
                            </svg>
                        </div>
                    </div>
                </section>

                <!-- Two-Column Main Content -->
                <div class="ql-content-grid">
                    <!-- Left Section: Recent Quizzes -->
                    <section class="ql-quizzes-section">
                        <!-- Enrolled Subjects Pill Bar (Populated from StudentProfileSetup) -->
                        <div class="ql-selected-tracks-bar" id="selectedTracksBar">
                            <div class="ql-tracks-label">Enrolled Learning Tracks:</div>
                            <div class="ql-tracks-chips" id="selectedTracksChips">
                                <span class="ql-mini-track-chip">Data Structures</span>
                                <span class="ql-mini-track-chip">Algorithms</span>
                                <span class="ql-mini-track-chip">Web Development</span>
                                <span class="ql-mini-track-chip">Machine Learning</span>
                            </div>
                            <a href="Profile.aspx" class="ql-tracks-edit" title="Change your enrolled subjects">Edit Profile â†’</a>
                        </div>

                        <div class="ql-section-header">
                            <h2 class="ql-section-title">Recent Quizzes</h2>
                        </div>

                        <!-- 3 Quiz Cards Matching Reference Image -->
                        <div class="ql-quizzes-grid" id="quizzesGrid">
                            <!-- Quiz Card 1: Data Structures Basics -->
                            <article class="ql-quiz-card" data-title="data structures basics" data-category="computer science">
                                <div>
                                    <span class="ql-quiz-tag">Computer Science</span>
                                    <h3 class="ql-quiz-name">Data Structures Basics</h3>
                                </div>
                                
                                <div class="ql-progress-block">
                                    <div class="ql-progress-meta">
                                        <span>Progress</span>
                                        <span class="ql-progress-pct">80%</span>
                                    </div>
                                    <div class="ql-progress-track">
                                        <div class="ql-progress-fill" style="width: 80%;"></div>
                                    </div>
                                </div>

                                <div class="ql-quiz-card-footer">
                                    <span class="ql-last-score">Last score: 90%</span>
                                    <button type="button" class="ql-btn-quiz-action ql-btn-continue-quiz" onclick="launchQuizModal('Data Structures Basics', 'Computer Science', 'Arrays, Linked Lists, Stacks, Queues, Binary Trees', 80)">
                                        Continue
                                    </button>
                                </div>
                            </article>

                            <!-- Quiz Card 2: Operating Systems -->
                            <article class="ql-quiz-card" data-title="operating systems" data-category="computer science">
                                <div>
                                    <span class="ql-quiz-tag">Computer Science</span>
                                    <h3 class="ql-quiz-name">Operating Systems</h3>
                                </div>

                                <div class="ql-progress-block">
                                    <div class="ql-progress-meta">
                                        <span>Progress</span>
                                        <span class="ql-progress-pct">40%</span>
                                    </div>
                                    <div class="ql-progress-track">
                                        <div class="ql-progress-fill" style="width: 40%;"></div>
                                    </div>
                                </div>

                                <div class="ql-quiz-card-footer">
                                    <span class="ql-last-score">Last score: 75%</span>
                                    <button type="button" class="ql-btn-quiz-action ql-btn-continue-quiz" onclick="launchQuizModal('Operating Systems', 'Computer Science', 'Processes, CPU Scheduling, Threads, Memory Management', 40)">
                                        Continue
                                    </button>
                                </div>
                            </article>

                            <!-- Quiz Card 3: DBMS Fundamentals -->
                            <article class="ql-quiz-card" data-title="dbms fundamentals" data-category="computer science">
                                <div>
                                    <span class="ql-quiz-tag">Computer Science</span>
                                    <h3 class="ql-quiz-name">DBMS Fundamentals</h3>
                                </div>

                                <div class="ql-progress-block">
                                    <div class="ql-progress-meta">
                                        <span>Progress</span>
                                        <span class="ql-progress-pct">100%</span>
                                    </div>
                                    <div class="ql-progress-track">
                                        <div class="ql-progress-fill" style="width: 100%;"></div>
                                    </div>
                                </div>

                                <div class="ql-quiz-card-footer">
                                    <span class="ql-last-score">Best score: 95%</span>
                                    <button type="button" class="ql-btn-quiz-action ql-btn-retake-quiz" onclick="launchQuizModal('DBMS Fundamentals', 'Computer Science', 'Relational Model, Normalization, SQL, Indexing', 100)">
                                        Retake
                                    </button>
                                </div>
                            </article>
                        </div>
                    </section>

                    <!-- Right Section: Leaderboard & Quick Actions -->
                    <aside class="ql-side-column" aria-label="Student Rankings and Quick Actions">
                        <!-- Leaderboard Card -->
                        <div class="ql-panel-card">
                            <h3 class="ql-panel-card-title">Leaderboard</h3>
                            <div class="ql-leaderboard-list">
                                <div class="ql-leader-row">
                                    <div class="ql-leader-left">
                                        <span class="ql-leader-rank top-1">1</span>
                                        <span class="ql-leader-name">Priya Patel</span>
                                    </div>
                                    <span class="ql-leader-score">96%</span>
                                </div>

                                <div class="ql-leader-row">
                                    <div class="ql-leader-left">
                                        <span class="ql-leader-rank top-2">2</span>
                                        <span class="ql-leader-name">Rohan Mehta</span>
                                    </div>
                                    <span class="ql-leader-score">92%</span>
                                </div>

                                <div class="ql-leader-row is-current-user">
                                    <div class="ql-leader-left">
                                        <span class="ql-leader-rank top-3">3</span>
                                        <span class="ql-leader-name" id="lblLeaderboardUserName">Aarav Sharma (You)</span>
                                    </div>
                                    <span class="ql-leader-score">84%</span>
                                </div>
                            </div>
                        </div>

                        <!-- Quick Actions Card -->
                        <div class="ql-panel-card">
                            <h3 class="ql-panel-card-title">Quick Actions</h3>
                            <div class="ql-quick-actions-btns">
                                <button type="button" class="ql-btn-quick-primary" onclick="openStartNewQuizModal()">
                                    Start New Quiz
                                </button>
                                <button type="button" class="ql-btn-quick-secondary" onclick="openReviewMistakesModal()">
                                    Review Mistakes
                                </button>
                            </div>
                        </div>
                    </aside>
                </div>
            </main>
        </div>

        <!-- ==================================================================
             Interactive Prototype Modals (Frontend Only)
             ================================================================== -->

        <!-- Feature Explainer Modal -->
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
                    <div style="background: rgba(124, 58, 237, 0.1); border: 1px solid rgba(139, 92, 246, 0.25); border-radius: 10px; padding: 14px; margin-top: 16px;">
                        <span style="color: #c084fc; font-weight: 600; font-size: 13px;">Prototype Notice:</span>
                        <p style="margin: 4px 0 0 0; font-size: 13px; color: #94a3b8;">
                            All profile preferences and sample quiz progress are stored client-side in your current browser session.
                        </p>
                    </div>
                </div>
                <div style="margin-top: 24px; text-align: right;">
                    <button type="button" class="ql-btn-quick-primary" style="width: auto; padding: 0 24px;" onclick="closeModal('genericFeatureModal')">Got it</button>
                </div>
            </div>
        </div>

        <!-- Start New Quiz Modal -->
        <div class="ql-modal-backdrop" id="startQuizModal">
            <div class="ql-modal-box" style="max-width:600px;">
                <div class="ql-modal-header">
                    <div>
                        <span class="ql-quiz-tag">NEW QUIZ</span>
                        <h3 class="ql-modal-title" style="margin-top:4px;">Choose Your Subject</h3>
                    </div>
                    <button type="button" class="ql-modal-close" onclick="closeModal('startQuizModal')" aria-label="Close dialog">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>
                <div class="ql-modal-body">
                    <p style="margin-top:0; color:#94a3b8; font-size:13px;">Select a subject below, then click <strong style="color:#ffffff;">Start Quiz</strong> to begin a 5-question diagnostic test.</p>
                    <div id="modalSubjectOptions" style="display:grid; grid-template-columns:1fr 1fr; gap:10px; margin:16px 0;">
                        <!-- Subject cards generated by openStartNewQuizModal() -->
                    </div>
                    <p style="font-size:11px; color:#475569; margin:0;">âš¡ Demo mode â€” answers are recorded in this browser session only.</p>
                </div>
                <div style="display:flex; justify-content:flex-end; gap:10px; margin-top:20px;">
                    <button type="button" class="ql-btn-quick-secondary" style="width:auto; padding:0 20px;" onclick="closeModal('startQuizModal')">Cancel</button>
                    <button type="button" class="ql-btn-quick-primary" style="width:auto; padding:0 24px;" id="btnStartSelectedQuiz" onclick="launchSelectedQuiz()" disabled>Start Quiz</button>
                </div>
            </div>
        </div>

        <!-- Interactive Quiz Session Modal -->
        <div class="ql-modal-backdrop" id="activeQuizModal">
            <div class="ql-modal-box" style="max-width: 620px;">
                <!-- Quiz Header -->
                <div class="ql-modal-header">
                    <div style="flex:1; min-width:0;">
                        <span id="quizModalCategory" class="ql-quiz-tag" style="margin-bottom: 4px;">Computer Science</span>
                        <h3 class="ql-modal-title" id="quizModalTitle" style="margin-top: 4px;">Data Structures Basics</h3>
                    </div>
                    <button type="button" class="ql-modal-close" onclick="closeModal('activeQuizModal')" aria-label="Close dialog">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>

                <!-- Progress Bar -->
                <div style="padding:0 0 14px 0;">
                    <div style="display:flex; justify-content:space-between; font-size:11px; color:#64748b; margin-bottom:6px;">
                        <span id="quizProgressLabel">QUESTION 1 OF 5</span>
                        <span id="quizScoreLive" style="color:#a78bfa;">Score: 0</span>
                    </div>
                    <div style="height:4px; background:rgba(255,255,255,0.08); border-radius:4px; overflow:hidden;">
                        <div id="quizProgressBar" style="height:100%; width:20%; background:linear-gradient(90deg,#7c3aed,#a855f7); border-radius:4px; transition:width 0.3s;"></div>
                    </div>
                </div>

                <!-- Quiz Body: Question + Options -->
                <div class="ql-modal-body" id="quizModalBody" style="padding-top:0;">
                    <p id="quizQuestionText" style="font-size:15px; font-weight:600; color:#ffffff; line-height:1.5; margin-bottom:16px;"></p>
                    <div id="quizOptionsList" style="display:flex; flex-direction:column; gap:8px;"></div>
                    <div id="quizFeedbackAlert" style="display:none; margin-top:14px; padding:12px 16px; border-radius:10px; font-size:13px; line-height:1.5;"></div>
                </div>

                <!-- Quiz Footer -->
                <div style="display:flex; justify-content:space-between; align-items:center; margin-top:18px; padding-top:14px; border-top:1px solid rgba(255,255,255,0.08);">
                    <span style="font-size:12px; color:#64748b;">Instant diagnostic feedback enabled</span>
                    <button type="button" class="ql-btn-quick-primary" id="btnNextQuestion" style="width:auto; padding:0 20px; display:none;" onclick="nextQuestion()">Next â†’</button>
                </div>

                <!-- Quiz Result Summary (shown after all questions) -->
                <div id="quizResultSummary" style="display:none; padding:20px 0 0 0;">
                    <div style="text-align:center; margin-bottom:20px;">
                        <div id="quizResultEmoji" style="font-size:40px; margin-bottom:8px;">ðŸŽ‰</div>
                        <div style="font-size:22px; font-weight:800; color:#ffffff;" id="quizResultScoreText">4 / 5 Correct</div>
                        <div style="font-size:14px; color:#94a3b8; margin-top:4px;" id="quizResultPctText">80% â€” Great work!</div>
                    </div>
                    <div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:12px; margin-bottom:20px;">
                        <div style="background:#141829; border-radius:10px; padding:14px; text-align:center;">
                            <div style="font-size:20px; font-weight:800; color:#10b981;" id="resCorrect">4</div>
                            <div style="font-size:11px; color:#64748b; margin-top:2px;">Correct</div>
                        </div>
                        <div style="background:#141829; border-radius:10px; padding:14px; text-align:center;">
                            <div style="font-size:20px; font-weight:800; color:#ef4444;" id="resWrong">1</div>
                            <div style="font-size:11px; color:#64748b; margin-top:2px;">Incorrect</div>
                        </div>
                        <div style="background:#141829; border-radius:10px; padding:14px; text-align:center;">
                            <div style="font-size:20px; font-weight:800; color:#a78bfa;" id="resPct">80%</div>
                            <div style="font-size:11px; color:#64748b; margin-top:2px;">Score</div>
                        </div>
                    </div>
                    <div style="display:flex; gap:10px; justify-content:flex-end;">
                        <button type="button" class="ql-btn-quick-secondary" style="width:auto; padding:0 18px;" onclick="openReviewMistakesModal(); closeModal('activeQuizModal');">Review Mistakes</button>
                        <a href="QuizResult.aspx" class="ql-btn-quick-primary" style="width:auto; padding:0 20px; text-decoration:none; display:flex; align-items:center;">View Results â†’</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Review Mistakes Modal -->
        <div class="ql-modal-backdrop" id="reviewMistakesModal">
            <div class="ql-modal-box" style="max-width: 620px;">
                <div class="ql-modal-header">
                    <div>
                        <span class="ql-quiz-tag" style="background: rgba(239, 68, 68, 0.15); border-color: rgba(239, 68, 68, 0.3); color: #fca5a5;">MISTAKE NOTEBOOK</span>
                        <h3 class="ql-modal-title" style="margin-top: 4px;">Review Your Mistakes</h3>
                    </div>
                    <button type="button" class="ql-modal-close" onclick="closeModal('reviewMistakesModal')" aria-label="Close dialog">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </button>
                </div>
                <div class="ql-modal-body" style="max-height:420px; overflow-y:auto;">
                    <p style="margin:0 0 14px 0; font-size:13px; color:#94a3b8;">ðŸ“‹ Sample mistakes from your recent quiz sessions. Use these to identify gaps and strengthen your understanding. <em>(Demo data â€” not permanently saved.)</em></p>

                    <!-- Mistake 1 -->
                    <div style="background: #141829; border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 12px; padding: 16px; margin-bottom: 12px;">
                        <span style="font-size: 11px; font-weight: 700; color: #c084fc; text-transform: uppercase;">Operating Systems â€¢ Deadlocks</span>
                        <h4 style="font-size: 14px; font-weight: 600; color: #ffffff; margin: 6px 0 8px 0;">Which condition is NOT one of the Coffman conditions required for a deadlock?</h4>
                        <div style="font-size: 12px; color: #ef4444; margin-bottom: 4px;">âŒ Your answer: Preemption Allowed</div>
                        <div style="font-size: 12px; color: #10b981; font-weight: 500; margin-bottom: 8px;">âœ… Correct answer: No Preemption (preemption must NOT be possible for deadlock to occur)</div>
                        <div style="font-size: 12px; color: #94a3b8; border-left: 2px solid rgba(124,58,237,0.5); padding-left: 10px; margin-bottom: 10px;">The four Coffman conditions are: Mutual Exclusion, Hold and Wait, No Preemption, and Circular Wait. If preemption is <em>allowed</em>, deadlock cannot occur.</div>
                        <button type="button" class="ql-btn-quick-secondary" style="width:auto; padding:4px 14px; font-size:12px;" onclick="practiceAgain('Operating Systems')">âŸ³ Practice Again</button>
                    </div>

                    <!-- Mistake 2 -->
                    <div style="background: #141829; border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 12px; padding: 16px; margin-bottom: 12px;">
                        <span style="font-size: 11px; font-weight: 700; color: #c084fc; text-transform: uppercase;">Data Structures â€¢ Heaps</span>
                        <h4 style="font-size: 14px; font-weight: 600; color: #ffffff; margin: 6px 0 8px 0;">What is the time complexity to build a binary heap from an unsorted array?</h4>
                        <div style="font-size: 12px; color: #ef4444; margin-bottom: 4px;">âŒ Your answer: O(n log n)</div>
                        <div style="font-size: 12px; color: #10b981; font-weight: 500; margin-bottom: 8px;">âœ… Correct answer: O(n) â€” using bottom-up heapify</div>
                        <div style="font-size: 12px; color: #94a3b8; border-left: 2px solid rgba(124,58,237,0.5); padding-left: 10px; margin-bottom: 10px;">Bottom-up heapify starts from the last non-leaf node and sifts down. The total work across all levels sums to O(n), not O(n log n).</div>
                        <button type="button" class="ql-btn-quick-secondary" style="width:auto; padding:4px 14px; font-size:12px;" onclick="practiceAgain('Data Structures')">âŸ³ Practice Again</button>
                    </div>

                    <!-- Mistake 3 -->
                    <div style="background: #141829; border: 1px solid rgba(255, 255, 255, 0.08); border-radius: 12px; padding: 16px;">
                        <span style="font-size: 11px; font-weight: 700; color: #c084fc; text-transform: uppercase;">Algorithms â€¢ Sorting</span>
                        <h4 style="font-size: 14px; font-weight: 600; color: #ffffff; margin: 6px 0 8px 0;">Which sorting algorithm has O(nÂ²) worst-case but O(n log n) average-case?</h4>
                        <div style="font-size: 12px; color: #ef4444; margin-bottom: 4px;">âŒ Your answer: Merge Sort</div>
                        <div style="font-size: 12px; color: #10b981; font-weight: 500; margin-bottom: 8px;">âœ… Correct answer: Quick Sort</div>
                        <div style="font-size: 12px; color: #94a3b8; border-left: 2px solid rgba(124,58,237,0.5); padding-left: 10px; margin-bottom: 10px;">Merge Sort guarantees O(n log n) in all cases. Quick Sort degrades to O(nÂ²) when pivot selection is poor (e.g., sorted input with last-element pivot).</div>
                        <button type="button" class="ql-btn-quick-secondary" style="width:auto; padding:4px 14px; font-size:12px;" onclick="practiceAgain('Algorithms')">âŸ³ Practice Again</button>
                    </div>
                </div>
                <div style="margin-top: 22px; display:flex; justify-content:space-between; align-items:center;">
                    <a href="MistakeNotebook.aspx" style="font-size:13px; color:#a78bfa; text-decoration:none; font-weight:600;">View full Mistake Notebook â†’</a>
                    <button type="button" class="ql-btn-quick-primary" style="width: auto; padding: 0 24px;" onclick="closeModal('reviewMistakesModal')">Close</button>
                </div>
            </div>
        </div>
    </form>

        <!-- Client-Side Dashboard Logic -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initStudentProfile();
            initSearchFilter();
            initMobileSidebar();
            initNotifPanel();
        });

        function initStudentProfile() {
            let profile = null;
            try {
                const profileRaw = localStorage.getItem('ql_student_profile') || sessionStorage.getItem('ql_student_profile');
                if (profileRaw) profile = JSON.parse(profileRaw);
            } catch (err) {}

            let studentName = 'Aarav Sharma';
            let studentFirstName = 'Aarav';

            <%  if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString())) { %>
                studentName = '<%= Server.HtmlEncode(Session["UserFullName"].ToString()) %>';
                studentFirstName = studentName.split(' ')[0];
            <% } %>

            const hour = new Date().getHours();
            const greeting = hour < 12 ? 'Good Morning' : hour < 17 ? 'Good Afternoon' : 'Good Evening';
            const greetingTitle = document.getElementById('greetingTitle');
            if (greetingTitle) greetingTitle.textContent = greeting + ', ' + studentFirstName + ' \uD83D\uDC4B';

            const lblHeaderUserName = document.getElementById('lblHeaderUserName');
            if (lblHeaderUserName) lblHeaderUserName.textContent = studentName;

            const lblLeaderboardUserName = document.getElementById('lblLeaderboardUserName');
            if (lblLeaderboardUserName) lblLeaderboardUserName.textContent = '3 ' + studentName + ' (You)';

            const lblHeaderAvatar = document.getElementById('lblHeaderAvatar');
            if (lblHeaderAvatar && studentName) {
                const parts = studentName.trim().split(' ');
                let initials = parts.length >= 2
                    ? (parts[0][0] + parts[1][0]).toUpperCase()
                    : parts[0].substring(0, 2).toUpperCase();
                lblHeaderAvatar.textContent = initials;
            }

            const tracksChipsContainer = document.getElementById('selectedTracksChips');
            if (tracksChipsContainer) {
                let subjects = ['Data Structures', 'Algorithms', 'Web Development', 'Machine Learning'];
                if (profile && Array.isArray(profile.subjects) && profile.subjects.length > 0) subjects = profile.subjects;
                tracksChipsContainer.innerHTML = '';
                subjects.forEach(sub => {
                    const chip = document.createElement('span');
                    chip.className = 'ql-mini-track-chip';
                    chip.textContent = sub;
                    tracksChipsContainer.appendChild(chip);
                });
            }
        }

        function initSearchFilter() {
            const searchInput = document.getElementById('txtQuizSearch');
            if (!searchInput) return;
            searchInput.addEventListener('input', function () {
                const term = this.value.toLowerCase().trim();
                document.querySelectorAll('.ql-quiz-card').forEach(card => {
                    const title = card.getAttribute('data-title') || '';
                    const cat   = card.getAttribute('data-category') || '';
                    card.style.display = (title.includes(term) || cat.includes(term)) ? 'flex' : 'none';
                });
            });
        }

        function initMobileSidebar() {
            const toggleBtn = document.getElementById('btnToggleSidebar');
            const sidebar   = document.getElementById('dashboardSidebar');
            if (toggleBtn && sidebar) {
                toggleBtn.addEventListener('click', e => { e.stopPropagation(); sidebar.classList.toggle('open'); });
                document.addEventListener('click', e => {
                    if (sidebar.classList.contains('open') && !sidebar.contains(e.target) && e.target !== toggleBtn)
                        sidebar.classList.remove('open');
                });
            }
        }

        /* ── Notification Panel ─────────────────────────────────────────── */
        function initNotifPanel() {
            document.addEventListener('click', function (e) {
                const panel   = document.getElementById('notifPanel');
                const wrapper = document.getElementById('notifWrapper');
                if (panel && wrapper && !wrapper.contains(e.target)) panel.style.display = 'none';
            });
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') { const p = document.getElementById('notifPanel'); if (p) p.style.display='none'; }
            });
        }

        function toggleNotifPanel(e) {
            e.stopPropagation();
            const panel = document.getElementById('notifPanel');
            if (panel) panel.style.display = (panel.style.display === 'block') ? 'none' : 'block';
        }

        function markAllRead() {
            document.querySelectorAll('.ql-notif-item.unread').forEach(el => { el.classList.remove('unread'); el.style.opacity='0.7'; });
            const dot = document.getElementById('notifDot');
            if (dot) dot.style.display = 'none';
        }

        /* ── Modal helpers ──────────────────────────────────────────────── */
        function closeModal(modalId) {
            const el = document.getElementById(modalId);
            if (el) el.classList.remove('active');
        }

        function showFeatureModal(title, description) {
            document.getElementById('featureModalTitle').textContent = title;
            document.getElementById('featureModalDesc').textContent  = description;
            document.getElementById('genericFeatureModal').classList.add('active');
        }

        /* ── Start New Quiz ─────────────────────────────────────────────── */
        const ALL_SUBJECTS = [
            { label:'Data Structures',   icon:'\uD83D\uDDC2\uFE0F' },
            { label:'Algorithms',        icon:'\u2699\uFE0F' },
            { label:'Computer Networks', icon:'\uD83C\uDF10' },
            { label:'Web Development',   icon:'\uD83D\uDCBB' },
            { label:'Operating Systems', icon:'\uD83D\uDDA5\uFE0F' },
            { label:'DBMS',              icon:'\uD83D\uDDC4\uFE0F' }
        ];
        let _selectedSubject = null;

        function openStartNewQuizModal() {
            _selectedSubject = null;
            const container = document.getElementById('modalSubjectOptions');
            const startBtn  = document.getElementById('btnStartSelectedQuiz');
            if (startBtn) startBtn.disabled = true;
            container.innerHTML = '';

            ALL_SUBJECTS.forEach(function (subj) {
                const card = document.createElement('button');
                card.type = 'button';
                card.setAttribute('data-subject', subj.label);
                card.style.cssText = 'display:flex;align-items:center;gap:10px;padding:12px 16px;background:#141829;border:1.5px solid rgba(255,255,255,0.08);border-radius:12px;cursor:pointer;text-align:left;width:100%;color:#cbd5e1;font-size:14px;font-weight:500;transition:border-color 0.15s,background 0.15s;font-family:inherit;';
                card.innerHTML = '<span style="font-size:18px;">' + subj.icon + '</span><span>' + subj.label + '</span>';
                card.addEventListener('click', function () {
                    document.querySelectorAll('#modalSubjectOptions button').forEach(c => {
                        c.style.borderColor = 'rgba(255,255,255,0.08)'; c.style.background='#141829'; c.style.color='#cbd5e1';
                    });
                    card.style.borderColor='#7c3aed'; card.style.background='rgba(124,58,237,0.12)'; card.style.color='#ffffff';
                    _selectedSubject = subj.label;
                    if (startBtn) startBtn.disabled = false;
                });
                container.appendChild(card);
            });

            document.getElementById('startQuizModal').classList.add('active');
        }

        function launchSelectedQuiz() {
            const subject = _selectedSubject || 'Data Structures';
            closeModal('startQuizModal');
            launchQuizModal(subject + ' Diagnostic', 'Computer Science', subject);
        }

        /* ── Quiz Engine ────────────────────────────────────────────────── */
        const QUIZ_BANK = {
            'Data Structures':[
                {q:'Average time complexity of Hash Table search?', opts:['O(n)','O(log n)','O(1)','O(n\u00B2)'], correct:2, exp:'Hash tables hash a key to a bucket, giving O(1) average lookup.'},
                {q:'Which data structure uses LIFO order?', opts:['Queue','Stack','Heap','Deque'], correct:1, exp:'A Stack is Last-In First-Out (LIFO).'},
                {q:'Time complexity to build a binary heap from an unsorted array?', opts:['O(n log n)','O(n)','O(log n)','O(n\u00B2)'], correct:1, exp:'Bottom-up heapify runs in O(n).'},
                {q:'Which traversal visits root BETWEEN left and right subtrees?', opts:['Pre-order','Post-order','In-order','Level-order'], correct:2, exp:'In-order: left \u2192 root \u2192 right. Gives sorted output for BSTs.'},
                {q:'Worst-case time complexity of Binary Search?', opts:['O(n)','O(1)','O(n log n)','O(log n)'], correct:3, exp:'Binary Search halves the search space each step: O(log n).'}
            ],
            'Algorithms':[
                {q:'Which sort has O(n\u00B2) worst-case but O(n log n) average-case?', opts:['Merge Sort','Bubble Sort','Quick Sort','Heap Sort'], correct:2, exp:'Quick Sort degrades to O(n\u00B2) with a bad pivot.'},
                {q:'Which paradigm does Dynamic Programming use?', opts:['Divide & Conquer','Greedy','Backtracking','Memoisation/Tabulation'], correct:3, exp:'DP stores sub-problem results to avoid redundant work.'},
                {q:"Dijkstra's algorithm computes:", opts:['MST','Shortest path (unweighted)','Shortest path (non-negative weights)','Max flow'], correct:2, exp:"Dijkstra's finds single-source shortest paths for non-negative weights."},
                {q:'Merge Sort is classified as:', opts:['Greedy','Divide & Conquer','Dynamic Programming','Branch & Bound'], correct:1, exp:'Merge Sort recursively splits and merges arrays.'},
                {q:'Which sort is stable AND O(n log n) worst-case?', opts:['Quick Sort','Heap Sort','Merge Sort','Selection Sort'], correct:2, exp:'Merge Sort is stable and always O(n log n).'}
            ],
            'Computer Networks':[
                {q:'Which OSI layer handles routing?', opts:['Physical','Data Link','Network','Transport'], correct:2, exp:'Network layer (Layer 3) manages logical addressing and routing.'},
                {q:'TCP provides:', opts:['Low latency','Unreliable delivery','Reliable ordered delivery','Broadcast only'], correct:2, exp:'TCP is connection-oriented and delivers bytes reliably and in order.'},
                {q:'What does DNS translate?', opts:['Assigns IPs','Domain names to IPs','Encrypts traffic','Routes packets'], correct:1, exp:'DNS resolves hostnames like quizlearn.com to IP addresses.'},
                {q:'HTTP operates at which OSI layer?', opts:['Network','Transport','Session','Application'], correct:3, exp:'HTTP is an Application layer (Layer 7) protocol.'},
                {q:'Which protocol uses a 3-way handshake?', opts:['UDP','ICMP','TCP','ARP'], correct:2, exp:'TCP uses SYN \u2192 SYN-ACK \u2192 ACK to establish a connection.'}
            ],
            'Web Development':[
                {q:'Which HTML element wraps navigation links?', opts:['<section>','<nav>','<aside>','<header>'], correct:1, exp:'<nav> semantically identifies navigation blocks.'},
                {q:'CSS Flexbox property for cross-axis alignment:', opts:['justify-content','align-items','flex-direction','flex-wrap'], correct:1, exp:'align-items positions flex children on the cross-axis.'},
                {q:'What does async/await do in JS?', opts:['Makes sync','Handles DOM events','Simplifies Promises','Compiles TS'], correct:2, exp:'async/await is syntactic sugar for writing async code cleanly.'},
                {q:'HTTP 404 means:', opts:['Server Error','Unauthorized','Not Found','Redirect'], correct:2, exp:'404 Not Found: the server cannot locate the requested resource.'},
                {q:'CSS property for element stacking order:', opts:['opacity','overflow','z-index','position'], correct:2, exp:'z-index controls which element appears on top when they overlap.'}
            ],
            'Operating Systems':[
                {q:'Which scheduling algorithm can cause starvation?', opts:['Round Robin','FCFS','Priority Scheduling','Multilevel Queue'], correct:2, exp:'Priority Scheduling may starve low-priority processes.'},
                {q:'Which is NOT a Coffman deadlock condition?', opts:['Mutual Exclusion','Hold and Wait','Preemption Allowed','Circular Wait'], correct:2, exp:'Deadlock requires No Preemption. If preemption is allowed, deadlock cannot occur.'},
                {q:'What is thrashing?', opts:['High CPU','Excessive paging / near-zero useful work','Stack overflow','Fragmentation'], correct:1, exp:'Thrashing: process spends more time paging than doing useful work.'},
                {q:'A semaphore with initial value 1 is a:', opts:['Counting semaphore','Binary semaphore/Mutex','Monitor','Spinlock'], correct:1, exp:'A binary semaphore (0 or 1) provides mutual exclusion like a mutex.'},
                {q:'Virtual memory allows:', opts:['Faster CPU','More memory than physically available','Disk-only storage','GPU acceleration'], correct:1, exp:'Virtual memory maps virtual addresses to physical RAM/disk, exceeding physical limits.'}
            ],
            'DBMS':[
                {q:'Which NF eliminates partial dependencies?', opts:['1NF','2NF','3NF','BCNF'], correct:1, exp:'2NF: non-key attributes must depend on the WHOLE primary key.'},
                {q:'ACID stands for:', opts:['Atomicity Consistency Isolation Durability','Access Control Index Data','Aggregation Composition Integration Dependency','Atomicity Concurrency Isolation Distribution'], correct:0, exp:'ACID: Atomicity, Consistency, Isolation, Durability.'},
                {q:'Which SQL join returns only matching rows from BOTH tables?', opts:['LEFT JOIN','RIGHT JOIN','FULL OUTER JOIN','INNER JOIN'], correct:3, exp:'INNER JOIN returns rows only where the condition matches in both tables.'},
                {q:'An index primarily speeds up:', opts:['INSERT','DELETE','SELECT queries','UPDATE cascades'], correct:2, exp:'Indexes speed up SELECT/WHERE lookups at the cost of slower writes.'},
                {q:'Which concurrency control uses timestamps?', opts:['Two-Phase Locking','Timestamp Ordering','MVCC','Optimistic CC'], correct:1, exp:'Timestamp Ordering assigns timestamps and resolves conflicts accordingly.'}
            ]
        };

        let _quizState = { questions:[], idx:0, correct:0 };

        function launchQuizModal(title, category, subjectKey) {
            const qs = QUIZ_BANK[subjectKey] || QUIZ_BANK['Data Structures'];
            _quizState = { questions:qs, idx:0, correct:0 };
            document.getElementById('quizModalTitle').textContent    = title;
            document.getElementById('quizModalCategory').textContent = category;
            document.getElementById('quizResultSummary').style.display = 'none';
            document.getElementById('quizModalBody').style.display   = '';
            document.getElementById('btnNextQuestion').style.display = 'none';
            renderQuestion();
            document.getElementById('activeQuizModal').classList.add('active');
        }

        function renderQuestion() {
            const s = _quizState, q = s.questions[s.idx], total = s.questions.length;
            document.getElementById('quizProgressLabel').textContent = 'QUESTION ' + (s.idx+1) + ' OF ' + total;
            document.getElementById('quizScoreLive').textContent     = 'Score: ' + s.correct;
            document.getElementById('quizProgressBar').style.width   = (s.idx / total * 100) + '%';
            document.getElementById('quizQuestionText').textContent  = q.q;
            const fb = document.getElementById('quizFeedbackAlert');
            fb.style.display='none'; fb.textContent='';
            document.getElementById('btnNextQuestion').style.display='none';
            const optList = document.getElementById('quizOptionsList');
            optList.innerHTML='';
            const letters=['A','B','C','D'];
            q.opts.forEach(function(opt,i){
                const btn=document.createElement('button'); btn.type='button';
                btn.style.cssText='display:flex;align-items:center;gap:10px;padding:12px 16px;background:#141829;border:1.5px solid rgba(255,255,255,0.08);border-radius:10px;cursor:pointer;text-align:left;width:100%;color:#cbd5e1;font-size:14px;transition:border-color 0.15s,background 0.15s;font-family:inherit;';
                btn.innerHTML='<span style="width:26px;height:26px;border-radius:50%;background:rgba(255,255,255,0.08);display:flex;align-items:center;justify-content:center;font-weight:700;flex-shrink:0;">' + letters[i] + '</span><span>' + opt + '</span>';
                btn.addEventListener('click',function(){answerQuestion(i,btn);});
                optList.appendChild(btn);
            });
        }

        function answerQuestion(choiceIdx, clickedBtn) {
            const s=_quizState, q=s.questions[s.idx], isCorrect=(choiceIdx===q.correct);
            if(isCorrect) s.correct++;
            document.querySelectorAll('#quizOptionsList button').forEach(b=>{b.disabled=true;b.style.cursor='default';});
            const optBtns=document.querySelectorAll('#quizOptionsList button');
            optBtns[q.correct].style.borderColor='#10b981'; optBtns[q.correct].style.background='rgba(16,185,129,0.15)'; optBtns[q.correct].style.color='#fff';
            if(!isCorrect){clickedBtn.style.borderColor='#ef4444';clickedBtn.style.background='rgba(239,68,68,0.15)';}
            const fb=document.getElementById('quizFeedbackAlert');
            fb.style.display='block';
            fb.style.background=isCorrect?'rgba(16,185,129,0.12)':'rgba(239,68,68,0.12)';
            fb.style.border=isCorrect?'1px solid #10b981':'1px solid #ef4444';
            fb.style.color=isCorrect?'#a7f3d0':'#fca5a5';
            fb.textContent=(isCorrect?'\u2713 Correct! ':'\u2717 Incorrect. ')+q.exp;
            const nextBtn=document.getElementById('btnNextQuestion');
            nextBtn.style.display='inline-flex';
            nextBtn.textContent=(s.idx>=s.questions.length-1)?'See Results':'Next \u2192';
        }

        function nextQuestion() {
            const s=_quizState;
            if(s.idx>=s.questions.length-1){showQuizResult();}else{s.idx++;renderQuestion();}
        }

        function showQuizResult() {
            const s=_quizState, total=s.questions.length, correct=s.correct, wrong=total-correct, pct=Math.round(correct/total*100);
            document.getElementById('quizModalBody').style.display='none';
            document.getElementById('btnNextQuestion').style.display='none';
            document.getElementById('quizResultSummary').style.display='block';
            const emoji=pct>=80?'\uD83C\uDFC6':pct>=60?'\uD83D\uDC4F':'\uD83D\uDCDA';
            const msg=pct>=80?'Excellent work!':pct>=60?'Good effort!':'Keep practising!';
            document.getElementById('quizResultEmoji').textContent=emoji;
            document.getElementById('quizResultScoreText').textContent=correct+' / '+total+' Correct';
            document.getElementById('quizResultPctText').textContent=pct+'% \u2014 '+msg;
            document.getElementById('resCorrect').textContent=correct;
            document.getElementById('resWrong').textContent=wrong;
            document.getElementById('resPct').textContent=pct+'%';
            document.getElementById('quizProgressBar').style.width='100%';
            document.getElementById('quizProgressLabel').textContent='COMPLETED';
            document.getElementById('quizScoreLive').textContent='Score: '+correct+'/'+total;
            try{
                const uName=(document.getElementById('lblHeaderUserName')||{}).textContent||'Student';
                sessionStorage.setItem('ql_last_quiz_result',JSON.stringify({studentName:uName,quizTitle:document.getElementById('quizModalTitle').textContent,correctCount:correct,totalQuestions:total,scorePct:pct,timeTakenMinutes:Math.ceil(total*1.5)}));
            }catch(e){}
        }

        function openReviewMistakesModal() {
            document.getElementById('reviewMistakesModal').classList.add('active');
        }

        function practiceAgain(subject) {
            closeModal('reviewMistakesModal');
            launchQuizModal(subject + ' Practice', 'Computer Science', subject);
        }

        function handleLogout(e) {
            try{ localStorage.removeItem('ql_student_profile'); sessionStorage.removeItem('ql_student_profile'); }catch(err){}
        }
    </script>
</body>
</html>

