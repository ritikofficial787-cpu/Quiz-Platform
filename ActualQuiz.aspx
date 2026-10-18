<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActualQuiz.aspx.cs" Inherits="website.ActualQuiz" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><asp:Literal ID="litPageTitle" runat="server">Quiz Session</asp:Literal> - QuizLearn</title>
    
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
    <form id="formActualQuiz" runat="server">
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

                    <a href="ExploreQuizzes.aspx" class="ql-nav-item active" id="navQuizzes">
                        <svg viewBox="0 0 24 24">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                        <span>Quizzes</span>
                    </a>

                    <a href="QuizResult.aspx" class="ql-nav-item" id="navResults">
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
            <!-- Runner Top Bar (matching actual-quiz screenshot) -->
            <header class="ql-quiz-top-bar">
                <a href="QuizDetails.aspx?id=<%= QuizId %>" class="ql-exit-link" id="btnExitQuiz">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                        <line x1="19" y1="12" x2="5" y2="12"></line>
                        <polyline points="12 19 5 12 12 5"></polyline>
                    </svg>
                    <span>Exit Quiz</span>
                </a>

                <div class="ql-quiz-top-center">
                    <span class="ql-quiz-top-title"><asp:Literal ID="litTopQuizTitle" runat="server">C# OOP Fundamentals</asp:Literal></span>
                    <span class="ql-card-cat-badge" style="margin-bottom: 0;"><asp:Literal ID="litTopCategoryBadge" runat="server">C#</asp:Literal></span>
                </div>

                <div class="ql-quiz-top-right">
                    <button type="button" class="ql-btn-save-exit" onclick="confirmSaveAndExit()">Save &amp; Exit</button>
                    <div class="ql-user-pill" title="Current Learner">
                        <span class="ql-user-name" id="lblHeaderUserName">Aarav Sharma</span>
                        <div class="ql-user-avatar" id="lblHeaderAvatar">AS</div>
                    </div>
                </div>
            </header>

            <!-- Quiz Runner Main Area -->
            <main class="ql-dash-body" style="padding-top: 24px;">
                <div class="ql-runner-wrap">
                    <!-- Progress Header: Question Indicator & Countdown Timer -->
                    <div class="ql-runner-meta-header">
                        <span class="ql-runner-q-indicator-top" id="lblQuestionCounterTop">Question 1 of 15</span>
                        <span class="ql-runner-timer" id="lblTimerDisplay">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="12" cy="12" r="10"></circle>
                                <polyline points="12 6 12 12 16 14"></polyline>
                            </svg>
                            <span id="timerText">20:00</span>
                        </span>
                    </div>

                    <!-- Progress Bar across the card -->
                    <div class="ql-runner-progress-track">
                        <div class="ql-runner-progress-fill" id="progressBarFill" style="width: 6.67%;"></div>
                    </div>

                    <!-- Main Question Card Container -->
                    <div class="ql-runner-card">
                        <!-- Step Tag -->
                        <div class="ql-runner-step-tag" id="lblCardStepTag">QUESTION 1 OF 15</div>

                        <!-- Question Text -->
                        <h2 class="ql-runner-q-text" id="lblQuestionText">
                            Which principle of OOP allows a class to hide its internal implementation details and expose only the necessary functionality?
                        </h2>

                        <!-- 4 Selectable Option Buttons -->
                        <div class="ql-runner-options-list" id="optionsContainer">
                            <!-- Populated dynamically via JS -->
                        </div>

                        <!-- Card Footer Navigation -->
                        <div class="ql-runner-footer-nav">
                            <button type="button" class="ql-btn-runner-prev" id="btnPrevQuestion" onclick="goToPrevQuestion()" disabled="disabled">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <line x1="19" y1="12" x2="5" y2="12"></line>
                                    <polyline points="12 19 5 12 12 5"></polyline>
                                </svg>
                                <span>Previous</span>
                            </button>

                            <span class="ql-runner-q-counter-center" id="lblQuestionCounterCenter">Question 1 of 15</span>

                            <div class="ql-runner-right-actions">
                                <button type="button" class="ql-btn-runner-next" id="btnNextOrSubmit" onclick="handleNextOrSubmit()">
                                    <span id="btnNextOrSubmitText">Next Question</span>
                                    <svg id="nextArrowSvg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                        <polyline points="12 5 19 12 12 19"></polyline>
                                    </svg>
                                </button>
                                <span class="ql-runner-submit-subtext" id="lblSubmitSubtext" style="display: none;">
                                    Finalize your answers before submitting.
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <script>
        // Static Questions Database (15 questions per category)
        const QUIZ_DATA_MAP = {
            "csharp-oop": {
                id: "csharp-oop",
                title: "C# OOP Fundamentals",
                category: "C# Programming",
                categoryBadge: "C#",
                durationSeconds: 1200, // 20 minutes
                difficulty: "Medium",
                questions: [
                    {
                        id: 1,
                        text: "Which principle of OOP allows a class to hide its internal implementation details and expose only the necessary functionality?",
                        options: [
                            { key: "A", text: "Inheritance" },
                            { key: "B", text: "Encapsulation" },
                            { key: "C", text: "Polymorphism" },
                            { key: "D", text: "Abstraction" }
                        ],
                        correctKey: "B",
                        explanation: "Encapsulation bundles data with code that manipulates it, preventing direct outside access to internal object representation."
                    },
                    {
                        id: 2,
                        text: "Which C# access modifier ensures a member is accessible only within its own class and derived classes?",
                        options: [
                            { key: "A", text: "public" },
                            { key: "B", text: "private" },
                            { key: "C", text: "protected" },
                            { key: "D", text: "internal" }
                        ],
                        correctKey: "C",
                        explanation: "The 'protected' modifier makes a member accessible within its class and by derived class instances."
                    },
                    {
                        id: 3,
                        text: "What keyword is used in C# to prevent a class from being inherited by any other class?",
                        options: [
                            { key: "A", text: "static" },
                            { key: "B", text: "sealed" },
                            { key: "C", text: "readonly" },
                            { key: "D", text: "abstract" }
                        ],
                        correctKey: "B",
                        explanation: "A 'sealed' class cannot be inherited, protecting against unintended derivation."
                    },
                    {
                        id: 4,
                        text: "Which keyword in C# is used to indicate that a method or property in a base class can be overridden in a derived class?",
                        options: [
                            { key: "A", text: "virtual" },
                            { key: "B", text: "new" },
                            { key: "C", text: "abstract" },
                            { key: "D", text: "static" }
                        ],
                        correctKey: "A",
                        explanation: "The 'virtual' keyword marks a member as overrideable by inheriting classes."
                    },
                    {
                        id: 5,
                        text: "Which keyword must be used in a derived class to provide a new implementation for a virtual method from the base class?",
                        options: [
                            { key: "A", text: "virtual" },
                            { key: "B", text: "override" },
                            { key: "C", text: "extends" },
                            { key: "D", text: "implements" }
                        ],
                        correctKey: "B",
                        explanation: "The 'override' modifier extends or alters the abstract or virtual implementation of an inherited method."
                    },
                    {
                        id: 6,
                        text: "Can an abstract class in C# contain concrete (fully implemented) methods?",
                        options: [
                            { key: "A", text: "No, all methods must be abstract" },
                            { key: "B", text: "Yes, it can contain both abstract and concrete methods" },
                            { key: "C", text: "Only static methods with no parameters" },
                            { key: "D", text: "Only constructors" }
                        ],
                        correctKey: "B",
                        explanation: "Abstract classes can provide base implementations alongside abstract signatures that child classes must implement."
                    },
                    {
                        id: 7,
                        text: "How many classes can a C# class directly inherit from?",
                        options: [
                            { key: "A", text: "Unlimited" },
                            { key: "B", text: "Two" },
                            { key: "C", text: "Exactly one" },
                            { key: "D", text: "Zero" }
                        ],
                        correctKey: "C",
                        explanation: "C# enforces single class inheritance to avoid the diamond problem of multiple inheritance."
                    },
                    {
                        id: 8,
                        text: "What is the primary difference between an Interface and an Abstract Class in C# regarding inheritance?",
                        options: [
                            { key: "A", text: "Interfaces cannot declare method signatures" },
                            { key: "B", text: "A class can implement multiple interfaces, but inherit only one class" },
                            { key: "C", text: "Abstract classes cannot have fields" },
                            { key: "D", text: "Interfaces can be instantiated directly" }
                        ],
                        correctKey: "B",
                        explanation: "A class may implement multiple interfaces simultaneously, but inherit from only a single base class."
                    },
                    {
                        id: 9,
                        text: "Which OOP mechanism allows defining multiple methods with the same name but different signatures in the same class?",
                        options: [
                            { key: "A", text: "Method Overriding" },
                            { key: "B", text: "Method Overloading" },
                            { key: "C", text: "Method Hiding" },
                            { key: "D", text: "Dynamic Dispatch" }
                        ],
                        correctKey: "B",
                        explanation: "Method overloading is compile-time polymorphism where methods share a name but differ in parameters."
                    },
                    {
                        id: 10,
                        text: "What is the purpose of the 'base' keyword in C#?",
                        options: [
                            { key: "A", text: "To reference the derived class instance" },
                            { key: "B", text: "To access members of the base class from within a derived class" },
                            { key: "C", text: "To terminate a loop early" },
                            { key: "D", text: "To create an anonymous object" }
                        ],
                        correctKey: "B",
                        explanation: "The 'base' keyword accesses members or constructors of the parent base class."
                    },
                    {
                        id: 11,
                        text: "Which of the following represents compile-time (static) polymorphism in C#?",
                        options: [
                            { key: "A", text: "Virtual method overriding" },
                            { key: "B", text: "Method overloading and operator overloading" },
                            { key: "C", text: "Interface implementation" },
                            { key: "D", text: "Abstract method implementation" }
                        ],
                        correctKey: "B",
                        explanation: "Method and operator overloading are determined at compile time by compiler type analysis."
                    },
                    {
                        id: 12,
                        text: "What keyword is explicitly used to hide a base class member with the same signature in a derived class?",
                        options: [
                            { key: "A", text: "new" },
                            { key: "B", text: "override" },
                            { key: "C", text: "hidden" },
                            { key: "D", text: "shadow" }
                        ],
                        correctKey: "A",
                        explanation: "The 'new' modifier suppresses compiler warnings when deliberately hiding an inherited member."
                    },
                    {
                        id: 13,
                        text: "What is the primary role of a constructor in C#?",
                        options: [
                            { key: "A", text: "To garbage collect an object" },
                            { key: "B", text: "To initialize an object's state upon creation" },
                            { key: "C", text: "To convert objects into JSON strings" },
                            { key: "D", text: "To implement multiple interfaces" }
                        ],
                        correctKey: "B",
                        explanation: "Constructors execute automatically when allocating memory for a new instance, setting up valid initial state."
                    },
                    {
                        id: 14,
                        text: "What does the OOP principle 'Abstraction' primarily focus on?",
                        options: [
                            { key: "A", text: "Showing essential features and hiding complex background mechanics" },
                            { key: "B", text: "Duplicating variables across threads" },
                            { key: "C", text: "Preventing variables from being garbage collected" },
                            { key: "D", text: "Writing SQL queries inside classes" }
                        ],
                        correctKey: "A",
                        explanation: "Abstraction isolates the user from implementation complexity by providing a simplified, essential interface."
                    },
                    {
                        id: 15,
                        text: "Which OOP concept allows the same method to behave differently depending on the object?",
                        options: [
                            { key: "A", text: "Encapsulation" },
                            { key: "B", text: "Inheritance" },
                            { key: "C", text: "Polymorphism" },
                            { key: "D", text: "Constructor" }
                        ],
                        correctKey: "C",
                        explanation: "Polymorphism allows objects of different concrete classes to respond to the same method invocation in their own unique way."
                    }
                ]
            }
        };

        // Fallback for other quizzes to guarantee 15 questions
        function getQuizData(quizId) {
            if (QUIZ_DATA_MAP[quizId]) {
                return QUIZ_DATA_MAP[quizId];
            }
            // Generate standard 15-question quiz if another category chosen
            const defaultQuiz = QUIZ_DATA_MAP["csharp-oop"];
            return {
                ...defaultQuiz,
                id: quizId,
                title: quizId.replace(/-/g, ' ').toUpperCase() + " Fundamentals"
            };
        }

        // Current Quiz State
        const CURRENT_QUIZ_ID = (document.getElementById('hdnQuizId') && document.getElementById('hdnQuizId').value) || 
                                (new URLSearchParams(window.location.search).get('id')) || 
                                'csharp-oop';
        const quizData = getQuizData(CURRENT_QUIZ_ID);
        const totalQuestions = quizData.questions.length;
        let currentQuestionIndex = 0; // 0-indexed (0 to 14)
        
        // Track user's answers: array of { questionId, selectedKey, isCorrect }
        const userAnswers = new Array(totalQuestions).fill(null);

        // Timer
        let secondsRemaining = quizData.durationSeconds;
        let timerInterval = null;
        let startTime = new Date();

        document.addEventListener('DOMContentLoaded', function () {
            initStudentProfile();
            renderQuestion(0);
            startCountdownTimer();
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

        function renderQuestion(index) {
            currentQuestionIndex = index;
            const q = quizData.questions[index];
            const qNum = index + 1;

            // Update Header counters
            document.getElementById('lblQuestionCounterTop').textContent = `Question ${qNum} of ${totalQuestions}`;
            document.getElementById('lblQuestionCounterCenter').textContent = `Question ${qNum} of ${totalQuestions}`;
            document.getElementById('lblCardStepTag').textContent = `QUESTION ${qNum} OF ${totalQuestions}`;

            // Update Progress Bar fill
            const pct = (qNum / totalQuestions) * 100;
            document.getElementById('progressBarFill').style.width = `${pct}%`;

            // Question Text
            document.getElementById('lblQuestionText').textContent = q.text;

            // Render Options
            const container = document.getElementById('optionsContainer');
            container.innerHTML = '';

            const currentSelected = userAnswers[index];

            q.options.forEach(opt => {
                const btn = document.createElement('button');
                btn.type = 'button';
                btn.className = 'ql-runner-option-btn';
                if (currentSelected === opt.key) {
                    btn.classList.add('selected');
                }

                btn.innerHTML = `
                    <span class="ql-opt-letter">${opt.key}</span>
                    <span>${opt.text}</span>
                    <span class="ql-opt-check-circle"></span>
                `;

                btn.addEventListener('click', function () {
                    selectOption(opt.key);
                });

                container.appendChild(btn);
            });

            // Update Previous Button
            const btnPrev = document.getElementById('btnPrevQuestion');
            btnPrev.disabled = (index === 0);

            // Update Next / Submit Button
            const isLast = (index === totalQuestions - 1);
            const btnNextOrSubmitText = document.getElementById('btnNextOrSubmitText');
            const nextArrowSvg = document.getElementById('nextArrowSvg');
            const lblSubmitSubtext = document.getElementById('lblSubmitSubtext');

            if (isLast) {
                btnNextOrSubmitText.textContent = "Submit Quiz";
                nextArrowSvg.style.display = "none";
                lblSubmitSubtext.style.display = "block";
            } else {
                btnNextOrSubmitText.textContent = "Next Question";
                nextArrowSvg.style.display = "inline";
                lblSubmitSubtext.style.display = "none";
            }
        }

        function selectOption(key) {
            userAnswers[currentQuestionIndex] = key;
            const btns = document.querySelectorAll('.ql-runner-option-btn');
            btns.forEach(b => {
                const letter = b.querySelector('.ql-opt-letter').textContent.trim();
                if (letter === key) {
                    b.classList.add('selected');
                } else {
                    b.classList.remove('selected');
                }
            });
        }

        function goToPrevQuestion() {
            if (currentQuestionIndex > 0) {
                renderQuestion(currentQuestionIndex - 1);
            }
        }

        function handleNextOrSubmit() {
            const isLast = (currentQuestionIndex === totalQuestions - 1);
            if (isLast) {
                submitQuiz();
            } else {
                renderQuestion(currentQuestionIndex + 1);
            }
        }

        function startCountdownTimer() {
            const timerText = document.getElementById('timerText');

            function updateTimer() {
                const mins = Math.floor(secondsRemaining / 60);
                const secs = secondsRemaining % 60;
                timerText.textContent = `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

                if (secondsRemaining <= 0) {
                    clearInterval(timerInterval);
                    alert('Time is up! Your quiz will now be submitted.');
                    submitQuiz();
                } else {
                    secondsRemaining--;
                }
            }

            updateTimer();
            timerInterval = setInterval(updateTimer, 1000);
        }

        function submitQuiz() {
            if (timerInterval) clearInterval(timerInterval);

            // Calculate total time taken in minutes
            const elapsedSeconds = quizData.durationSeconds - secondsRemaining;
            const elapsedMinutes = Math.max(1, Math.round(elapsedSeconds / 60));

            // Grade the quiz
            let correctCount = 0;
            let wrongCount = 0;
            let skippedCount = 0;

            const reviewItems = quizData.questions.map((q, idx) => {
                const userChoice = userAnswers[idx];
                const isCorrect = (userChoice === q.correctKey);
                const isSkipped = (userChoice === null);

                if (isCorrect) correctCount++;
                else if (isSkipped) skippedCount++;
                else wrongCount++;

                return {
                    questionNum: idx + 1,
                    text: q.text,
                    userChoice: userChoice || 'Skipped',
                    correctKey: q.correctKey,
                    isCorrect: isCorrect,
                    isSkipped: isSkipped,
                    explanation: q.explanation
                };
            });

            const scorePct = Math.round((correctCount / totalQuestions) * 100);

            // Package results
            const resultPayload = {
                quizId: quizData.id,
                quizTitle: quizData.title,
                category: quizData.category,
                difficulty: quizData.difficulty,
                totalQuestions: totalQuestions,
                correctCount: correctCount,
                wrongCount: wrongCount,
                skippedCount: skippedCount,
                scorePct: scorePct,
                timeTakenMinutes: elapsedMinutes,
                submittedAt: new Date().toISOString(),
                reviewItems: reviewItems
            };

            // Store in sessionStorage and localStorage for the results page
            try {
                sessionStorage.setItem('ql_last_quiz_result', JSON.stringify(resultPayload));
                localStorage.setItem('ql_last_quiz_result', JSON.stringify(resultPayload));
            } catch (err) {
                console.warn('Storage error', err);
            }

            // Redirect to QuizResult page
            window.location.href = `QuizResult.aspx?id=${encodeURIComponent(quizData.id)}`;
        }

        function confirmSaveAndExit() {
            if (confirm('Are you sure you want to pause and exit? Your progress will be saved.')) {
                submitQuiz();
            }
        }
    </script>
</body>
</html>
