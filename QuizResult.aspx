<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuizResult.aspx.cs" Inherits="website.QuizResult" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quiz Result - QuizLearn</title>
    
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
    <form id="formQuizResult" runat="server">
        <!-- Server Data Bridge (eliminates inline ASP tags in <script> so IDE parser reports 0 syntax errors) -->
        <input type="hidden" id="hdnQuizId" value="<%: QuizId %>" />
        <input type="hidden" id="hdnSessionUser" value="<%: Session["UserFullName"] != null ? Session["UserFullName"].ToString() : "" %>" />

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
                        <span>Quizzes</span>
                    </a>

                    <a href="QuizResult.aspx" class="ql-nav-item active" id="navResults">
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
                        <input type="text" id="txtTopHeaderSearch" class="ql-search-input" placeholder="Search quizzes..." autocomplete="off" onkeydown="if(event.key==='Enter'){event.preventDefault(); window.location.href='ExploreQuizzes.aspx?q=' + encodeURIComponent(this.value);}" />
                    </div>
                </div>

                <div class="ql-header-right">
                    <!-- Notification Bell -->
                    <button type="button" class="ql-notif-btn" id="btnNotifications" title="Notifications" onclick="alert('All quiz scores recorded in this browser session.')">
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

            <!-- Quiz Result Main Body -->
            <main class="ql-dash-body" style="padding-top: 28px; align-self: center;">
                <!-- Result Page Header (matching actual-result screenshot) -->
                <div class="ql-result-header">
                    <div class="ql-result-badge-completed">QUIZ COMPLETED</div>
                    <h1 class="ql-result-heading">Your Quiz Result</h1>
                    <p class="ql-result-subheading" id="lblQuizResultSubtitle">C# OOP Fundamentals</p>
                </div>

                <!-- 2-Column Result Grid -->
                <div class="ql-result-layout-grid">
                    <!-- Left Score Card -->
                    <div class="ql-result-score-card">
                        <div class="ql-score-top-label">SCORE</div>

                        <!-- Circular SVG Score Gauge -->
                        <div class="ql-score-ring-wrap">
                            <svg class="ql-score-svg" width="160" height="160" viewBox="0 0 160 160">
                                <circle class="ql-score-circle-bg" cx="80" cy="80" r="66" />
                                <circle class="ql-score-circle-bar" id="scoreCircleBar" cx="80" cy="80" r="66" 
                                        stroke-dasharray="414.69" 
                                        stroke-dashoffset="82.94" />
                            </svg>
                            <div class="ql-score-ring-content">
                                <span class="ql-score-pct-text" id="lblScorePct">80%</span>
                                <span class="ql-score-fraction-text" id="lblScoreFraction">12 / 15</span>
                            </div>
                        </div>

                        <!-- Evaluation Statement -->
                        <p class="ql-score-eval-para" id="lblScoreEvaluation">
                            Great job! You have a strong understanding of C# OOP Fundamentals.
                        </p>

                        <!-- Breakdown Rows -->
                        <div class="ql-score-breakdown-list">
                            <div class="ql-score-breakdown-item">
                                <span class="ql-score-item-left">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="3">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                    <span>Correct Answers</span>
                                </span>
                                <span class="ql-score-item-val" id="lblCorrectCount">12</span>
                            </div>

                            <div class="ql-score-breakdown-item">
                                <span class="ql-score-item-left">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#ef4444" stroke-width="3">
                                        <line x1="18" y1="6" x2="6" y2="18"></line>
                                        <line x1="6" y1="6" x2="18" y2="18"></line>
                                    </svg>
                                    <span>Wrong Answers</span>
                                </span>
                                <span class="ql-score-item-val" id="lblWrongCount">3</span>
                            </div>

                            <div class="ql-score-breakdown-item">
                                <span class="ql-score-item-left">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#3b82f6" stroke-width="2.5">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <polyline points="12 6 12 12 16 14"></polyline>
                                    </svg>
                                    <span>Time Taken</span>
                                </span>
                                <span class="ql-score-item-val" id="lblTimeTaken">10 min</span>
                            </div>
                        </div>

                        <!-- Bottom Performance Track -->
                        <div class="ql-score-performance-row">
                            <div class="ql-score-perf-meta">
                                <span>Performance</span>
                                <span id="lblPerfPctBottom">80%</span>
                            </div>
                            <div class="ql-score-perf-track">
                                <div class="ql-score-perf-fill" id="scorePerfFill" style="width: 80%;"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column -->
                    <div class="ql-result-right-col">
                        <!-- Card 1: Performance Summary -->
                        <div class="ql-perf-summary-card">
                            <div class="ql-perf-summary-title">PERFORMANCE SUMMARY</div>

                            <!-- Accuracy Bar -->
                            <div class="ql-summary-metric-block">
                                <div class="ql-metric-label-row">
                                    <span>Accuracy</span>
                                    <span id="lblAccuracyText">80%</span>
                                </div>
                                <div class="ql-metric-track">
                                    <div class="ql-metric-fill" id="accuracyFill" style="width: 80%;"></div>
                                </div>
                            </div>

                            <!-- Questions Attempted Bar -->
                            <div class="ql-summary-metric-block">
                                <div class="ql-metric-label-row">
                                    <span>Questions Attempted</span>
                                    <span id="lblAttemptedText">15/15</span>
                                </div>
                                <div class="ql-metric-track">
                                    <div class="ql-metric-fill" id="attemptedFill" style="width: 100%;"></div>
                                </div>
                            </div>

                            <!-- Difficulty Badge Row -->
                            <div class="ql-difficulty-summary-row">
                                <span>Difficulty</span>
                                <span class="ql-diff-badge-sm" id="lblDifficultyBadge">MEDIUM</span>
                            </div>
                        </div>

                        <!-- Card 2: 3 Mini Stat Boxes -->
                        <div class="ql-mini-stat-boxes-grid">
                            <!-- Box 1: Correct -->
                            <div class="ql-mini-stat-box">
                                <div class="ql-mini-stat-num ql-color-correct" id="statBoxCorrect">12</div>
                                <div class="ql-mini-stat-label">CORRECT</div>
                            </div>

                            <!-- Box 2: Wrong -->
                            <div class="ql-mini-stat-box">
                                <div class="ql-mini-stat-num ql-color-wrong" id="statBoxWrong">3</div>
                                <div class="ql-mini-stat-label">WRONG</div>
                            </div>

                            <!-- Box 3: Skipped -->
                            <div class="ql-mini-stat-box">
                                <div class="ql-mini-stat-num ql-color-skipped" id="statBoxSkipped">0</div>
                                <div class="ql-mini-stat-label">SKIPPED</div>
                            </div>
                        </div>

                        <!-- Card 3: Action Options -->
                        <div class="ql-next-actions-card">
                            <p class="ql-next-actions-title">What would you like to do next?</p>
                            <div class="ql-next-actions-btns">
                                <button type="button" class="ql-btn-review-answers" id="btnToggleReview" onclick="toggleAnswerReview()">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                    <span>Review Answers</span>
                                </button>

                                <a href="ActualQuiz.aspx?id=<%= QuizId %>" class="ql-btn-try-again" id="btnTryAgain">
                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <polyline points="23 4 23 10 17 10"></polyline>
                                        <path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"></path>
                                    </svg>
                                    <span>Try Again</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Detailed Answer Review Section (Collapsible) -->
                <section class="ql-review-panel" id="reviewAnswersPanel">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 18px;">
                        <h2 style="font-size: 20px; font-weight: 800; color: #ffffff; margin: 0;">Detailed Question Breakdown</h2>
                        <span style="font-size: 13px; color: #94a3b8;">Review every question and explanation</span>
                    </div>

                    <div id="reviewQuestionsList">
                        <!-- Dynamically filled with questions, user choice, correct answer, explanation -->
                    </div>
                </section>
            </main>
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initStudentProfile();
            loadQuizResultData();
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

        function loadQuizResultData() {
            let result = null;

            try {
                const resultRaw = sessionStorage.getItem('ql_last_quiz_result') || localStorage.getItem('ql_last_quiz_result');
                if (resultRaw) {
                    result = JSON.parse(resultRaw);
                }
            } catch (err) {
                console.warn('Storage read error', err);
            }

            // Fallback sample data matching the reference screenshot exactly: 80%, 12/15, 3 wrong, 0 skipped, 10 min
            if (!result) {
                result = {
                    quizId: "<%= QuizId %>",
                    quizTitle: "C# OOP Fundamentals",
                    category: "C# Programming",
                    difficulty: "MEDIUM",
                    totalQuestions: 15,
                    correctCount: 12,
                    wrongCount: 3,
                    skippedCount: 0,
                    scorePct: 80,
                    timeTakenMinutes: 10,
                    reviewItems: [
                        {
                            questionNum: 1,
                            text: "Which principle of OOP allows a class to hide its internal implementation details and expose only the necessary functionality?",
                            userChoice: "B",
                            correctKey: "B",
                            isCorrect: true,
                            isSkipped: false,
                            explanation: "Encapsulation bundles data and methods together, hiding the internal representation."
                        },
                        {
                            questionNum: 2,
                            text: "Which C# access modifier ensures a member is accessible only within its own class and derived classes?",
                            userChoice: "C",
                            correctKey: "C",
                            isCorrect: true,
                            isSkipped: false,
                            explanation: "The protected access modifier allows access within the declaring class and derived classes."
                        },
                        {
                            questionNum: 3,
                            text: "What keyword is used in C# to prevent a class from being inherited?",
                            userChoice: "A",
                            correctKey: "B",
                            isCorrect: false,
                            isSkipped: false,
                            explanation: "The 'sealed' keyword prevents inheritance, whereas 'static' defines non-instantiable classes."
                        },
                        {
                            questionNum: 15,
                            text: "Which OOP concept allows the same method to behave differently depending on the object?",
                            userChoice: "C",
                            correctKey: "C",
                            isCorrect: true,
                            isSkipped: false,
                            explanation: "Polymorphism enables objects to invoke their specialized implementations dynamically."
                        }
                    ]
                };
            }

            // Update UI elements
            document.getElementById('lblQuizResultSubtitle').textContent = result.quizTitle;
            document.getElementById('lblScorePct').textContent = `${result.scorePct}%`;
            document.getElementById('lblScoreFraction').textContent = `${result.correctCount} / ${result.totalQuestions}`;
            document.getElementById('lblCorrectCount').textContent = result.correctCount;
            document.getElementById('lblWrongCount').textContent = result.wrongCount;
            document.getElementById('lblTimeTaken').textContent = `${result.timeTakenMinutes} min`;

            document.getElementById('lblPerfPctBottom').textContent = `${result.scorePct}%`;
            document.getElementById('scorePerfFill').style.width = `${result.scorePct}%`;

            document.getElementById('lblAccuracyText').textContent = `${result.scorePct}%`;
            document.getElementById('accuracyFill').style.width = `${result.scorePct}%`;

            const attemptedCount = result.totalQuestions - result.skippedCount;
            document.getElementById('lblAttemptedText').textContent = `${attemptedCount}/${result.totalQuestions}`;
            document.getElementById('attemptedFill').style.width = `${Math.round((attemptedCount / result.totalQuestions) * 100)}%`;

            document.getElementById('lblDifficultyBadge').textContent = (result.difficulty || 'MEDIUM').toUpperCase();

            document.getElementById('statBoxCorrect').textContent = result.correctCount;
            document.getElementById('statBoxWrong').textContent = result.wrongCount;
            document.getElementById('statBoxSkipped').textContent = result.skippedCount;

            // Update evaluation message
            const evalPara = document.getElementById('lblScoreEvaluation');
            if (result.scorePct >= 80) {
                evalPara.textContent = `Great job! You have a strong understanding of ${result.quizTitle}.`;
            } else if (result.scorePct >= 50) {
                evalPara.textContent = `Good effort! Review the missed concepts below to achieve full mastery of ${result.quizTitle}.`;
            } else {
                evalPara.textContent = `Keep practicing! Work through the answer explanations to strengthen your core knowledge in ${result.quizTitle}.`;
            }

            // Circular progress SVG calculation (circumference = 2 * PI * 66 ≈ 414.69)
            const circumference = 2 * Math.PI * 66;
            const offset = circumference - (result.scorePct / 100) * circumference;
            const circleBar = document.getElementById('scoreCircleBar');
            if (circleBar) {
                circleBar.style.strokeDasharray = `${circumference}`;
                circleBar.style.strokeDashoffset = `${offset}`;
            }

            // Populate Review Questions List
            const reviewContainer = document.getElementById('reviewQuestionsList');
            reviewContainer.innerHTML = '';

            if (Array.isArray(result.reviewItems) && result.reviewItems.length > 0) {
                result.reviewItems.forEach(item => {
                    const card = document.createElement('div');
                    card.className = 'ql-review-q-card';

                    const statusBadge = item.isCorrect 
                        ? `<span style="color: #10b981; font-weight: 700; display: inline-flex; align-items: center; gap: 4px;">✔ Correct</span>`
                        : (item.isSkipped 
                            ? `<span style="color: #94a3b8; font-weight: 700;">Skipped</span>`
                            : `<span style="color: #ef4444; font-weight: 700; display: inline-flex; align-items: center; gap: 4px;">✖ Incorrect</span>`);

                    card.innerHTML = `
                        <div class="ql-review-q-header">
                            <span style="color: #c084fc; font-weight: 700; text-transform: uppercase;">Question ${item.questionNum}</span>
                            ${statusBadge}
                        </div>
                        <h4 class="ql-review-q-title">${item.text}</h4>
                        <div class="ql-review-ans-row">
                            <span style="color: #94a3b8;">Your Answer: </span>
                            <strong style="color: ${item.isCorrect ? '#10b981' : '#ef4444'};">${item.userChoice}</strong>
                            ${!item.isCorrect ? `<span style="color: #94a3b8; margin-left: 14px;">Correct Answer: </span><strong style="color: #10b981;">${item.correctKey}</strong>` : ''}
                        </div>
                        <div class="ql-review-explanation">
                            <strong style="color: #c084fc;">Explanation: </strong>${item.explanation}
                        </div>
                    `;
                    reviewContainer.appendChild(card);
                });
            }
        }

        function toggleAnswerReview() {
            const panel = document.getElementById('reviewAnswersPanel');
            panel.classList.toggle('active');
            if (panel.classList.contains('active')) {
                panel.scrollIntoView({ behavior: 'smooth', block: 'start' });
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
    </script>
</body>
</html>
