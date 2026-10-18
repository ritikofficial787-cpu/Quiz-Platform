<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddQuiz.aspx.cs" Inherits="website.AdminAddQuiz" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create New Quiz - QuizLearn Admin</title>
    
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
    <form id="formAdminAddQuiz" runat="server">
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

                    <a href="AdminAddQuiz.aspx" class="ql-nav-item active" id="navAddQuiz">
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

                    <div class="ql-user-pill" title="Admin Account">
                        <span class="ql-user-name" id="lblAdminUserName"><%: AdminName %></span>
                        <div class="ql-user-avatar" id="lblAdminAvatar" style="background: linear-gradient(135deg, #7c3aed, #ec4899);"><%: AdminAvatar %></div>
                    </div>
                </div>
            </header>

            <!-- Admin Body -->
            <main class="ql-dash-body">
                <div style="max-width: 980px; margin: 0 auto; width: 100%;">
                    <!-- Heading -->
                    <div style="margin-bottom: 26px;">
                        <h1 style="font-size: 26px; font-weight: 800; color: #ffffff; margin: 0 0 6px 0;">Create New Quiz</h1>
                        <p style="font-size: 14px; color: #94a3b8; margin: 0;">Add quiz details and questions.</p>
                    </div>

                    <!-- QUIZ DETAILS BOX -->
                    <div class="ql-admin-form-box">
                        <div class="ql-admin-box-title">QUIZ DETAILS</div>
                        <div class="ql-admin-quiz-meta-row">
                            <div class="ql-admin-field-group">
                                <label class="ql-admin-field-label">QUIZ TITLE</label>
                                <input type="text" class="ql-admin-input" id="txtQuizTitle" value="C# OOP Fundamentals" placeholder="e.g. C# OOP Fundamentals" />
                            </div>

                            <div class="ql-admin-field-group">
                                <label class="ql-admin-field-label">SUBJECT</label>
                                <input type="text" class="ql-admin-input" id="txtSubject" value="C#" placeholder="e.g. C#" />
                            </div>

                            <div class="ql-admin-field-group">
                                <label class="ql-admin-field-label">DIFFICULTY</label>
                                <select class="ql-admin-select" id="ddlDifficulty">
                                    <option value="Easy">Easy</option>
                                    <option value="Medium" selected="selected">Medium</option>
                                    <option value="Hard">Hard</option>
                                </select>
                            </div>

                            <div class="ql-admin-field-group">
                                <label class="ql-admin-field-label">QUES.</label>
                                <input type="number" class="ql-admin-input" id="numQuestions" value="15" min="1" max="100" />
                            </div>

                            <div class="ql-admin-field-group">
                                <label class="ql-admin-field-label">TIME</label>
                                <input type="text" class="ql-admin-input" id="txtDuration" value="20m" placeholder="e.g. 20m" />
                            </div>
                        </div>
                    </div>

                    <!-- QUESTIONS CONTAINER -->
                    <div id="questionsContainer">
                        <!-- QUESTION 1 -->
                        <div class="ql-admin-q-card" id="qBlock_1" data-qindex="1">
                            <div class="ql-admin-box-title">QUESTION 1</div>
                            
                            <div class="ql-admin-field-group" style="margin-bottom: 16px;">
                                <label class="ql-admin-field-label">QUESTION TEXT</label>
                                <input type="text" class="ql-admin-input q-text-input" value="Which OOP principle hides internal implementation details?" placeholder="Enter question..." />
                            </div>

                            <div class="ql-admin-options-grid-2x2">
                                <div class="ql-admin-field-group">
                                    <label class="ql-admin-field-label">OPTION A</label>
                                    <input type="text" class="ql-admin-input opt-a" value="Inheritance" placeholder="Option A text..." />
                                </div>

                                <div class="ql-admin-field-group">
                                    <label class="ql-admin-field-label">OPTION B</label>
                                    <input type="text" class="ql-admin-input opt-b" value="Encapsulation" placeholder="Option B text..." />
                                </div>

                                <div class="ql-admin-field-group">
                                    <label class="ql-admin-field-label">OPTION C</label>
                                    <input type="text" class="ql-admin-input opt-c" value="Polymorphism" placeholder="Option C text..." />
                                </div>

                                <div class="ql-admin-field-group">
                                    <label class="ql-admin-field-label">OPTION D</label>
                                    <input type="text" class="ql-admin-input opt-d" value="Abstraction" placeholder="Option D text..." />
                                </div>
                            </div>

                            <div class="ql-admin-field-group" style="max-width: 220px;">
                                <label class="ql-admin-field-label">CORRECT ANSWER</label>
                                <select class="ql-admin-select opt-correct">
                                    <option value="A">Option A</option>
                                    <option value="B" selected="selected">Option B</option>
                                    <option value="C">Option C</option>
                                    <option value="D">Option D</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- BOTTOM ACTIONS -->
                    <div class="ql-admin-form-bottom-actions">
                        <button type="button" class="ql-admin-add-q-trigger" onclick="addAnotherQuestion()">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                            </svg>
                            <span>Add Another Question</span>
                        </button>

                        <div style="display: flex; gap: 12px;">
                            <a href="AdminDashboard.aspx" class="ql-admin-btn-action-secondary" style="width: auto; padding: 10px 22px;">Cancel</a>
                            <button type="button" class="ql-admin-btn-action-primary" style="width: auto; padding: 10px 26px;" onclick="saveQuizData()">Save Quiz</button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <script>
        let questionCount = 1;

        document.addEventListener('DOMContentLoaded', function () {
            initMobileSidebar();
        });

        function addAnotherQuestion() {
            questionCount++;
            const container = document.getElementById('questionsContainer');
            const qDiv = document.createElement('div');
            qDiv.className = 'ql-admin-q-card';
            qDiv.id = `qBlock_${questionCount}`;
            qDiv.setAttribute('data-qindex', questionCount);

            qDiv.innerHTML = `
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
                    <div class="ql-admin-box-title" style="margin: 0;">QUESTION ${questionCount}</div>
                    <button type="button" onclick="removeQuestion(${questionCount})" style="background: transparent; border: none; color: #ef4444; font-size: 12px; cursor: pointer;">✕ Remove</button>
                </div>
                
                <div class="ql-admin-field-group" style="margin-bottom: 16px;">
                    <label class="ql-admin-field-label">QUESTION TEXT</label>
                    <input type="text" class="ql-admin-input q-text-input" placeholder="Enter question..." />
                </div>

                <div class="ql-admin-options-grid-2x2">
                    <div class="ql-admin-field-group">
                        <label class="ql-admin-field-label">OPTION A</label>
                        <input type="text" class="ql-admin-input opt-a" placeholder="Option A text..." />
                    </div>

                    <div class="ql-admin-field-group">
                        <label class="ql-admin-field-label">OPTION B</label>
                        <input type="text" class="ql-admin-input opt-b" placeholder="Option B text..." />
                    </div>

                    <div class="ql-admin-field-group">
                        <label class="ql-admin-field-label">OPTION C</label>
                        <input type="text" class="ql-admin-input opt-c" placeholder="Option C text..." />
                    </div>

                    <div class="ql-admin-field-group">
                        <label class="ql-admin-field-label">OPTION D</label>
                        <input type="text" class="ql-admin-input opt-d" placeholder="Option D text..." />
                    </div>
                </div>

                <div class="ql-admin-field-group" style="max-width: 220px;">
                    <label class="ql-admin-field-label">CORRECT ANSWER</label>
                    <select class="ql-admin-select opt-correct">
                        <option value="A">Option A</option>
                        <option value="B">Option B</option>
                        <option value="C">Option C</option>
                        <option value="D">Option D</option>
                    </select>
                </div>
            `;

            container.appendChild(qDiv);
            document.getElementById('numQuestions').value = questionCount;
            qDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function removeQuestion(index) {
            const el = document.getElementById(`qBlock_${index}`);
            if (el) {
                el.remove();
                questionCount = Math.max(1, questionCount - 1);
                document.getElementById('numQuestions').value = questionCount;
            }
        }

        function saveQuizData() {
            const title      = document.getElementById('txtQuizTitle').value.trim();
            const subject    = document.getElementById('txtSubject').value.trim();
            const difficulty = document.getElementById('ddlDifficulty').value;
            const durationRaw= document.getElementById('txtDuration').value.trim();
            const duration   = parseInt(durationRaw, 10) || 20;

            if (!title) {
                alert('Please enter a quiz title.');
                document.getElementById('txtQuizTitle').focus();
                return;
            }

            const questions = [];
            const cards = document.querySelectorAll('.ql-admin-q-card');
            cards.forEach((card, idx) => {
                const text    = card.querySelector('.q-text-input')?.value?.trim() || '';
                const optA    = card.querySelector('.opt-a')?.value?.trim()        || '';
                const optB    = card.querySelector('.opt-b')?.value?.trim()        || '';
                const optC    = card.querySelector('.opt-c')?.value?.trim()        || '';
                const optD    = card.querySelector('.opt-d')?.value?.trim()        || '';
                const correct = card.querySelector('.opt-correct')?.value          || 'A';
                if (!text) return;
                questions.push({ text, optA, optB, optC, optD, correct });
            });

            if (questions.length === 0) {
                alert('Please add at least one question with a question text.');
                return;
            }

            const btn = document.querySelector('.ql-admin-btn-action-primary[onclick="saveQuizData()"]');
            if (btn) { btn.disabled = true; btn.textContent = 'Saving...'; }

            fetch('Services/SaveQuizRequest.ashx', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ title, subject, difficulty, duration: duration.toString(), questions })
            })
            .then(r => r.json())
            .then(data => {
                if (data.ok) {
                    alert('Quiz "' + title + '" saved successfully with ' + questions.length + ' question(s)!');
                    window.location.href = 'AdminManageQuizzes.aspx';
                } else {
                    alert('Error: ' + (data.error || 'Unknown error'));
                    if (btn) { btn.disabled = false; btn.textContent = 'Save Quiz'; }
                }
            })
            .catch(err => {
                alert('Network error: ' + err.message);
                if (btn) { btn.disabled = false; btn.textContent = 'Save Quiz'; }
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
