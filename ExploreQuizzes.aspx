<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploreQuizzes.aspx.cs" Inherits="website.ExploreQuizzes" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Explore Quizzes - QuizLearn</title>
    
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
    <form id="formExploreQuizzes" runat="server">
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

                    <!-- Top Header Search -->
                    <div class="ql-search-box">
                        <span class="ql-search-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                            </svg>
                        </span>
                        <input type="text" id="txtTopHeaderSearch" class="ql-search-input" placeholder="Search quizzes..." autocomplete="off" />
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

            <!-- Explore Quizzes Body -->
            <main class="ql-dash-body" style="align-self: center;">
                <div class="ql-explore-wrap" style="max-width: 1040px; margin: 0 auto; width: 100%;">
                <!-- Page Title Section -->
                <div class="ql-explore-header">
                    <h1 class="ql-explore-title">Explore Quizzes</h1>
                    <p class="ql-explore-subtitle">Choose a quiz, test your knowledge, and improve your skills.</p>
                </div>

                <!-- Wide Search Bar -->
                <div class="ql-explore-search-wrap">
                    <span class="ql-explore-search-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </span>
                    <input type="text" id="txtExploreSearch" class="ql-explore-search-input" placeholder="Search by quiz name or subject" autocomplete="off" />
                </div>

                <!-- Subject Filter Chips Row -->
                <div class="ql-filter-chips-row" id="subjectFilterChips" role="tablist" aria-label="Filter quizzes by subject">
                    <button type="button" class="ql-filter-chip active" data-subject="all">All</button>
                    <button type="button" class="ql-filter-chip" data-subject="c#">C#</button>
                    <button type="button" class="ql-filter-chip" data-subject="java">Java</button>
                    <button type="button" class="ql-filter-chip" data-subject="dbms">DBMS</button>
                    <button type="button" class="ql-filter-chip" data-subject="operating systems">Operating Systems</button>
                    <button type="button" class="ql-filter-chip" data-subject="computer networks">Computer Networks</button>
                    <button type="button" class="ql-filter-chip" data-subject="web development">Web Development</button>
                </div>

                <!-- Dropdown Filters Row (Difficulty & Sort) -->
                <div class="ql-dropdown-filters-row">
                    <!-- Difficulty Dropdown -->
                    <div class="ql-filter-select-wrap">
                        <select id="ddlDifficultyFilter" class="ql-filter-select" aria-label="Filter by difficulty">
                            <option value="all">Difficulty: All</option>
                            <option value="easy">Difficulty: Easy</option>
                            <option value="medium">Difficulty: Medium</option>
                            <option value="hard">Difficulty: Hard</option>
                        </select>
                        <span class="ql-filter-select-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </span>
                    </div>

                    <!-- Sort Dropdown -->
                    <div class="ql-filter-select-wrap">
                        <select id="ddlSortOrder" class="ql-filter-select" aria-label="Sort quizzes">
                            <option value="recommended">Sort: Recommended</option>
                            <option value="questions-desc">Sort: Most Questions</option>
                            <option value="duration-asc">Sort: Shortest Duration</option>
                            <option value="title-asc">Sort: Alphabetical (A-Z)</option>
                        </select>
                        <span class="ql-filter-select-arrow">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <polyline points="6 9 12 15 18 9"></polyline>
                            </svg>
                        </span>
                    </div>
                </div>

                <!-- Recommended Heading -->
                <h2 class="ql-rec-section-title" id="lblRecommendedHeading">Recommended for Aarav</h2>

                <!-- 2-Column Quiz Cards Grid -->
                <div class="ql-explore-cards-grid" id="exploreCardsGrid">
                    <!-- Quiz 1: C# OOP Fundamentals -->
                    <article class="ql-explore-card" 
                             data-id="csharp-oop" 
                             data-subject="c#" 
                             data-difficulty="medium" 
                             data-questions="15" 
                             data-duration="20"
                             data-title="c# oop fundamentals"
                             data-desc="classes, objects, inheritance and polymorphism.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">C#</span>
                            <h3 class="ql-card-title">C# OOP Fundamentals</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>15 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>20 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-medium">Medium</span>
                            </div>
                            <p class="ql-card-desc">Classes, objects, inheritance and polymorphism.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=csharp-oop" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- Quiz 2: Database Fundamentals -->
                    <article class="ql-explore-card" 
                             data-id="database" 
                             data-subject="dbms" 
                             data-difficulty="easy" 
                             data-questions="20" 
                             data-duration="25"
                             data-title="database fundamentals"
                             data-desc="sql, normalization, keys and database concepts.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">Database</span>
                            <h3 class="ql-card-title">Database Fundamentals</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>20 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>25 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-easy">Easy</span>
                            </div>
                            <p class="ql-card-desc">SQL, normalization, keys and database concepts.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=database" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- Quiz 3: Java Programming Basics -->
                    <article class="ql-explore-card" 
                             data-id="java-basics" 
                             data-subject="java" 
                             data-difficulty="medium" 
                             data-questions="15" 
                             data-duration="20"
                             data-title="java programming basics"
                             data-desc="java syntax, oop and programming concepts.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">Java</span>
                            <h3 class="ql-card-title">Java Programming Basics</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>15 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>20 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-medium">Medium</span>
                            </div>
                            <p class="ql-card-desc">Java syntax, OOP and programming concepts.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=java-basics" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- Quiz 4: Networking Basics -->
                    <article class="ql-explore-card" 
                             data-id="networking" 
                             data-subject="computer networks" 
                             data-difficulty="hard" 
                             data-questions="20" 
                             data-duration="25"
                             data-title="networking basics"
                             data-desc="osi model, tcp/ip and networking fundamentals.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">Networking</span>
                            <h3 class="ql-card-title">Networking Basics</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>20 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>25 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-hard">Hard</span>
                            </div>
                            <p class="ql-card-desc">OSI model, TCP/IP and networking fundamentals.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=networking" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- Quiz 5: Operating System Fundamentals -->
                    <article class="ql-explore-card" 
                             data-id="os-fundamentals" 
                             data-subject="operating systems" 
                             data-difficulty="medium" 
                             data-questions="15" 
                             data-duration="20"
                             data-title="operating system fundamentals"
                             data-desc="processes, memory management and scheduling.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">OS</span>
                            <h3 class="ql-card-title">Operating System Fundamentals</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>15 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>20 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-medium">Medium</span>
                            </div>
                            <p class="ql-card-desc">Processes, memory management and scheduling.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=os-fundamentals" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- Quiz 6: HTML, CSS & JavaScript -->
                    <article class="ql-explore-card" 
                             data-id="web-dev" 
                             data-subject="web development" 
                             data-difficulty="easy" 
                             data-questions="20" 
                             data-duration="25"
                             data-title="html, css & javascript"
                             data-desc="practice modern web development fundamentals.">
                        <div class="ql-card-top">
                            <span class="ql-card-cat-badge">Web Dev</span>
                            <h3 class="ql-card-title">HTML, CSS & JavaScript</h3>
                            <div class="ql-card-meta-row">
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                                        <polyline points="14 2 14 8 20 8"></polyline>
                                        <line x1="16" y1="13" x2="8" y2="13"></line>
                                        <line x1="16" y1="17" x2="8" y2="17"></line>
                                    </svg>
                                    <span>20 Questions</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-card-meta-item">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>25 min</span>
                                </span>
                                <span class="ql-card-meta-dot">•</span>
                                <span class="ql-diff-easy">Easy</span>
                            </div>
                            <p class="ql-card-desc">Practice modern web development fundamentals.</p>
                        </div>
                        <div class="ql-card-footer">
                            <span class="ql-card-mastery-hint">Permanent Mastery</span>
                            <a href="QuizDetails.aspx?id=web-dev" class="ql-btn-start-card">
                                <span>Start Quiz</span>
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </a>
                        </div>
                    </article>

                    <!-- No Results Message (Hidden by default) -->
                    <div id="noResultsMessage" class="ql-no-results-msg" style="display: none;">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="1.5" style="margin-bottom: 12px;">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                        <h4 style="margin: 0 0 6px 0; color: #ffffff; font-size: 16px;">No quizzes found</h4>
                        <p style="margin: 0 0 16px 0; font-size: 13px;">No quizzes matched your search query and filter settings.</p>
                        <button type="button" class="ql-btn-start-card" onclick="resetFilters()">Reset All Filters</button>
                    </div>
                </div>
                </div>
            </main>
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
                    <div style="background: rgba(124, 58, 237, 0.1); border: 1px solid rgba(139, 92, 246, 0.25); border-radius: 10px; padding: 14px; margin-top: 16px;">
                        <span style="color: #c084fc; font-weight: 600; font-size: 13px;">Prototype Notice:</span>
                        <p style="margin: 4px 0 0 0; font-size: 13px; color: #94a3b8;">
                            Sample quizzes and topic recommendations are running in frontend mode without permanent database records.
                        </p>
                    </div>
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
            initExploreFiltering();
            initMobileSidebar();
        });

        // Initialize Student Profile Name from storage/session
        function initStudentProfile() {
            let studentName = 'Aarav Sharma';
            let studentFirstName = 'Aarav';

            <% if (Session["UserFullName"] != null && !string.IsNullOrEmpty(Session["UserFullName"].ToString())) { %>
                studentName = '<%= Server.HtmlEncode(Session["UserFullName"].ToString()) %>';
                studentFirstName = studentName.split(' ')[0];
            <% } %>

            try {
                const profileRaw = localStorage.getItem('ql_student_profile') || sessionStorage.getItem('ql_student_profile');
                if (profileRaw) {
                    const p = JSON.parse(profileRaw);
                    if (p.userName) {
                        studentName = p.userName;
                        studentFirstName = studentName.split(' ')[0];
                    }
                }
            } catch (e) {}

            const lblHeaderUserName = document.getElementById('lblHeaderUserName');
            const lblHeaderAvatar = document.getElementById('lblHeaderAvatar');
            const lblRecommendedHeading = document.getElementById('lblRecommendedHeading');

            if (lblHeaderUserName) lblHeaderUserName.textContent = studentName;
            if (lblRecommendedHeading) lblRecommendedHeading.textContent = `Recommended for ${studentFirstName}`;

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

        // Search, Subject Chips, Difficulty & Sorting Interactions
        function initExploreFiltering() {
            const txtExploreSearch = document.getElementById('txtExploreSearch');
            const txtTopHeaderSearch = document.getElementById('txtTopHeaderSearch');
            const chips = document.querySelectorAll('.ql-filter-chip');
            const ddlDifficulty = document.getElementById('ddlDifficultyFilter');
            const ddlSort = document.getElementById('ddlSortOrder');
            const cardsGrid = document.getElementById('exploreCardsGrid');
            const cards = Array.from(document.querySelectorAll('.ql-explore-card'));
            const noResultsMessage = document.getElementById('noResultsMessage');

            let currentSubject = 'all';
            let currentDifficulty = 'all';
            let currentSearchTerm = '';

            function applyFilters() {
                let visibleCount = 0;

                cards.forEach(card => {
                    const cardSubject = (card.getAttribute('data-subject') || '').toLowerCase();
                    const cardDifficulty = (card.getAttribute('data-difficulty') || '').toLowerCase();
                    const cardTitle = (card.getAttribute('data-title') || '').toLowerCase();
                    const cardDesc = (card.getAttribute('data-desc') || '').toLowerCase();

                    // Subject match
                    let matchSubject = (currentSubject === 'all') || (cardSubject === currentSubject);

                    // Difficulty match
                    let matchDifficulty = (currentDifficulty === 'all') || (cardDifficulty === currentDifficulty);

                    // Search match (title, desc, or subject)
                    let matchSearch = true;
                    if (currentSearchTerm) {
                        matchSearch = cardTitle.includes(currentSearchTerm) || 
                                      cardDesc.includes(currentSearchTerm) || 
                                      cardSubject.includes(currentSearchTerm);
                    }

                    if (matchSubject && matchDifficulty && matchSearch) {
                        card.style.display = 'flex';
                        visibleCount++;
                    } else {
                        card.style.display = 'none';
                    }
                });

                if (noResultsMessage) {
                    noResultsMessage.style.display = visibleCount === 0 ? 'block' : 'none';
                }
            }

            function applySorting() {
                const sortMode = ddlSort.value;
                const sortedCards = [...cards];

                if (sortMode === 'questions-desc') {
                    sortedCards.sort((a, b) => {
                        return parseInt(b.getAttribute('data-questions')) - parseInt(a.getAttribute('data-questions'));
                    });
                } else if (sortMode === 'duration-asc') {
                    sortedCards.sort((a, b) => {
                        return parseInt(a.getAttribute('data-duration')) - parseInt(b.getAttribute('data-duration'));
                    });
                } else if (sortMode === 'title-asc') {
                    sortedCards.sort((a, b) => {
                        return (a.getAttribute('data-title') || '').localeCompare(b.getAttribute('data-title') || '');
                    });
                } else {
                    // Default / Recommended order: restore DOM order
                    sortedCards.sort((a, b) => {
                        const originalOrder = ['csharp-oop', 'database', 'java-basics', 'networking', 'os-fundamentals', 'web-dev'];
                        return originalOrder.indexOf(a.getAttribute('data-id')) - originalOrder.indexOf(b.getAttribute('data-id'));
                    });
                }

                sortedCards.forEach(card => {
                    cardsGrid.appendChild(card);
                });
                if (noResultsMessage) {
                    cardsGrid.appendChild(noResultsMessage);
                }
            }

            // Search input handlers
            if (txtExploreSearch) {
                txtExploreSearch.addEventListener('input', function () {
                    currentSearchTerm = this.value.toLowerCase().trim();
                    if (txtTopHeaderSearch) txtTopHeaderSearch.value = this.value;
                    applyFilters();
                });
            }

            if (txtTopHeaderSearch) {
                txtTopHeaderSearch.addEventListener('input', function () {
                    currentSearchTerm = this.value.toLowerCase().trim();
                    if (txtExploreSearch) txtExploreSearch.value = this.value;
                    applyFilters();
                });
            }

            // Subject chips
            chips.forEach(chip => {
                chip.addEventListener('click', function () {
                    chips.forEach(c => c.classList.remove('active'));
                    this.classList.add('active');
                    currentSubject = this.getAttribute('data-subject').toLowerCase();
                    applyFilters();
                });
            });

            // Difficulty filter
            if (ddlDifficulty) {
                ddlDifficulty.addEventListener('change', function () {
                    currentDifficulty = this.value.toLowerCase();
                    applyFilters();
                });
            }

            // Sorting control
            if (ddlSort) {
                ddlSort.addEventListener('change', function () {
                    applySorting();
                });
            }

            // Expose reset globally
            window.resetFilters = function () {
                currentSubject = 'all';
                currentDifficulty = 'all';
                currentSearchTerm = '';

                chips.forEach(c => {
                    if (c.getAttribute('data-subject') === 'all') c.classList.add('active');
                    else c.classList.remove('active');
                });

                if (txtExploreSearch) txtExploreSearch.value = '';
                if (txtTopHeaderSearch) txtTopHeaderSearch.value = '';
                if (ddlDifficulty) ddlDifficulty.value = 'all';
                if (ddlSort) ddlSort.value = 'recommended';

                applySorting();
                applyFilters();
            };
        }

        // Mobile drawer toggling
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

        // Modal Handlers
        function closeModal(modalId) {
            const el = document.getElementById(modalId);
            if (el) el.classList.remove('active');
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
