<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="website.Settings" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style>
        .ql-settings-wrap {
            max-width: 960px;
            margin: 0 auto;
            width: 100%;
        }
        .ql-toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #10b981;
            color: #ffffff;
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
            z-index: 10000;
        }
        .ql-toast.show {
            transform: translateY(0);
            opacity: 1;
        }
    </style>
</head>
<body class="ql-dashboard-layout">
    <form id="formSettings" runat="server">
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
                <a href="Settings.aspx" class="ql-nav-item active" id="navSettings">
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
            <!-- Top App Header -->
            <header class="ql-app-header">
                <div class="ql-header-left">
                    <button type="button" class="ql-mobile-menu-btn" id="btnToggleSidebar" aria-label="Toggle navigation drawer">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <line x1="3" y1="12" x2="21" y2="12"></line>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <line x1="3" y1="18" x2="21" y2="18"></line>
                        </svg>
                    </button>
                    <span style="font-size: 15px; font-weight: 700; color: #ffffff;">Settings</span>
                </div>

                <div class="ql-header-right">
                    <button type="button" class="ql-notif-btn" id="btnNotifications" title="Notifications" onclick="showToast('No new notifications.')">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                        </svg>
                    </button>

                    <div class="ql-user-pill" id="userPill" onclick="window.location.href='Profile.aspx'" title="View Profile">
                        <span class="ql-user-name" id="lblHeaderUserName"><%: StudentName %></span>
                        <div class="ql-user-avatar" id="lblHeaderAvatar"><%: StudentInitials %></div>
                    </div>
                </div>
            </header>

            <!-- Settings Content Body -->
            <main class="ql-dash-body" style="align-self: center;">
                <div class="ql-settings-wrap">
                    <!-- Heading -->
                    <div style="margin-bottom: 28px;">
                        <h1 style="font-size: 26px; font-weight: 800; color: #ffffff; margin: 0 0 6px 0; letter-spacing: -0.02em;">Settings & Preferences</h1>
                        <p style="font-size: 14px; color: #94a3b8; margin: 0;">Customize your quiz taking experience, notifications, and account credentials.</p>
                    </div>

                    <!-- Section 1: Quiz & Learning Preferences -->
                    <div class="ql-settings-card">
                        <div class="ql-settings-sec-head">
                            <h2 class="ql-settings-sec-title">Quiz & Learning Experience</h2>
                            <p class="ql-settings-sec-desc">Control how questions are presented and timed during practice sessions.</p>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Auto-Advance Questions</h3>
                                <p class="ql-settings-item-desc">Automatically move to the next question immediately after selecting an answer.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkAutoAdvance" checked="checked" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Instant Explanation & Feedback</h3>
                                <p class="ql-settings-item-desc">Display solution rationale immediately upon answering in practice mode.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkInstantFeedback" checked="checked" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Sound Effects</h3>
                                <p class="ql-settings-item-desc">Play subtle audio cues for answer selection, timers, and quiz completion.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkSoundEffects" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Timer Display Mode</h3>
                                <p class="ql-settings-item-desc">Choose how the remaining time is shown on the quiz header bar.</p>
                            </div>
                            <select id="ddlTimerMode" class="ql-settings-text-input" style="width: auto; cursor: pointer;">
                                <option value="countdown">Countdown (e.g. 19:45 remaining)</option>
                                <option value="stopwatch">Elapsed Stopwatch (0:15 elapsed)</option>
                                <option value="hidden">Hidden until final 2 minutes</option>
                            </select>
                        </div>

                        <div class="ql-settings-item" style="border-bottom: none;">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Default Difficulty Filter</h3>
                                <p class="ql-settings-item-desc">Set your default preferred difficulty when opening Explore Quizzes.</p>
                            </div>
                            <select id="ddlDefaultDifficulty" class="ql-settings-text-input" style="width: auto; cursor: pointer;">
                                <option value="all">All Difficulties</option>
                                <option value="easy">Easy (Fundamentals)</option>
                                <option value="medium" selected="selected">Medium (Intermediate)</option>
                                <option value="hard">Hard (Advanced Problem Solving)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Section 2: Notifications & Reminders -->
                    <div class="ql-settings-card">
                        <div class="ql-settings-sec-head">
                            <h2 class="ql-settings-sec-title">Notifications & Study Alerts</h2>
                            <p class="ql-settings-sec-desc">Choose which updates and study reminders you want to receive.</p>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">New Quiz Releases</h3>
                                <p class="ql-settings-item-desc">Receive email alerts when new topic quizzes or practice mock tests are published.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkNotifNewQuizzes" checked="checked" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Mistake Notebook Revision Alerts</h3>
                                <p class="ql-settings-item-desc">Periodic reminder notifications to review incorrect answers before they fade from memory.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkNotifMistakes" checked="checked" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>

                        <div class="ql-settings-item" style="border-bottom: none;">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Weekly Performance Digest</h3>
                                <p class="ql-settings-item-desc">Receive a weekend email breakdown of topics mastered and percentile rank.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkNotifDigest" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>
                    </div>

                    <!-- Section 3: Theme & Display -->
                    <div class="ql-settings-card">
                        <div class="ql-settings-sec-head">
                            <h2 class="ql-settings-sec-title">Appearance & Display</h2>
                            <p class="ql-settings-sec-desc">Configure code editor styling and contrast options.</p>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Theme Mode</h3>
                                <p class="ql-settings-item-desc">QuizLearn uses a tailored dark palette optimized for reading code and questions.</p>
                            </div>
                            <span class="ql-profile-badge ql-profile-badge-pro" style="padding: 6px 14px; font-size: 12px;">Dark Cosmos (Active)</span>
                        </div>

                        <div class="ql-settings-item">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">Code Snippet Font</h3>
                                <p class="ql-settings-item-desc">Font family used for rendering C#, Java, and SQL code blocks.</p>
                            </div>
                            <select id="ddlCodeFont" class="ql-settings-text-input" style="width: auto; cursor: pointer;">
                                <option value="JetBrains Mono" selected="selected">JetBrains Mono</option>
                                <option value="Fira Code">Fira Code</option>
                                <option value="Consolas">Consolas</option>
                            </select>
                        </div>

                        <div class="ql-settings-item" style="border-bottom: none;">
                            <div class="ql-settings-item-info">
                                <h3 class="ql-settings-item-title">High Contrast Mode</h3>
                                <p class="ql-settings-item-desc">Boost card borders and option contrast for maximum readability in bright rooms.</p>
                            </div>
                            <label class="ql-toggle">
                                <input type="checkbox" id="chkHighContrast" />
                                <span class="ql-toggle-slider"></span>
                            </label>
                        </div>
                    </div>

                    <!-- Section 4: Security & Credentials -->
                    <div class="ql-settings-card" id="securitySection">
                        <div class="ql-settings-sec-head">
                            <h2 class="ql-settings-sec-title">Security & Password</h2>
                            <p class="ql-settings-sec-desc">Update your login password and manage account security.</p>
                        </div>

                        <div class="ql-settings-input-group">
                            <div class="ql-settings-field-wrap">
                                <label class="ql-settings-field-label">Current Password</label>
                                <input type="password" id="txtCurrentPass" class="ql-settings-text-input" placeholder="Enter current password" />
                            </div>

                            <div class="ql-settings-field-wrap">
                                <label class="ql-settings-field-label">New Password</label>
                                <input type="password" id="txtNewPass" class="ql-settings-text-input" placeholder="Minimum 6 characters" />
                            </div>

                            <div class="ql-settings-field-wrap">
                                <label class="ql-settings-field-label">Confirm New Password</label>
                                <input type="password" id="txtConfirmPass" class="ql-settings-text-input" placeholder="Re-enter new password" />
                            </div>
                        </div>

                        <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                            <button type="button" class="ql-btn-practice-mistakes" onclick="updatePassword()" style="padding: 9px 20px; font-size: 13px;">
                                Update Password
                            </button>
                        </div>
                    </div>

                    <!-- Bottom Action Bar -->
                    <div style="display: flex; justify-content: flex-end; align-items: center; gap: 14px; margin-top: 20px;">
                        <button type="button" class="ql-btn-review-link" onclick="resetDefaults()" style="padding: 10px 20px; border-radius: 9px; border: 1px solid rgba(255,255,255,0.1);">
                            Reset Defaults
                        </button>
                        <button type="button" class="ql-btn-practice-mistakes" onclick="saveAllSettings()" style="padding: 11px 26px; font-size: 14px; font-weight: 700;">
                            Save Changes
                        </button>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <!-- Toast Feedback Notification -->
    <div class="ql-toast" id="settingsToast">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="toastMsg">Settings saved successfully!</span>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Load user profile name if in localStorage
            try {
                const profile = JSON.parse(localStorage.getItem('ql_student_profile') || '{}');
                if (profile.fullName) {
                    document.getElementById('lblHeaderUserName').innerText = profile.fullName;
                    const parts = profile.fullName.trim().split(' ').filter(Boolean);
                    if (parts.length >= 2) {
                        document.getElementById('lblHeaderAvatar').innerText = (parts[0][0] + parts[1][0]).toUpperCase();
                    }
                }
            } catch (e) {}

            // Load saved settings
            try {
                const saved = JSON.parse(localStorage.getItem('ql_settings') || '{}');
                if (saved.autoAdvance !== undefined) document.getElementById('chkAutoAdvance').checked = saved.autoAdvance;
                if (saved.instantFeedback !== undefined) document.getElementById('chkInstantFeedback').checked = saved.instantFeedback;
                if (saved.soundEffects !== undefined) document.getElementById('chkSoundEffects').checked = saved.soundEffects;
                if (saved.timerMode) document.getElementById('ddlTimerMode').value = saved.timerMode;
                if (saved.defaultDifficulty) document.getElementById('ddlDefaultDifficulty').value = saved.defaultDifficulty;
                if (saved.notifNewQuizzes !== undefined) document.getElementById('chkNotifNewQuizzes').checked = saved.notifNewQuizzes;
                if (saved.notifMistakes !== undefined) document.getElementById('chkNotifMistakes').checked = saved.notifMistakes;
                if (saved.notifDigest !== undefined) document.getElementById('chkNotifDigest').checked = saved.notifDigest;
                if (saved.codeFont) document.getElementById('ddlCodeFont').value = saved.codeFont;
                if (saved.highContrast !== undefined) document.getElementById('chkHighContrast').checked = saved.highContrast;
            } catch (e) {}

            // Mobile toggle
            const toggleBtn = document.getElementById('btnToggleSidebar');
            const sidebar = document.getElementById('dashboardSidebar');
            if (toggleBtn && sidebar) {
                toggleBtn.addEventListener('click', function () {
                    sidebar.classList.toggle('open');
                });
            }
        });

        function saveAllSettings() {
            const settings = {
                autoAdvance: document.getElementById('chkAutoAdvance').checked,
                instantFeedback: document.getElementById('chkInstantFeedback').checked,
                soundEffects: document.getElementById('chkSoundEffects').checked,
                timerMode: document.getElementById('ddlTimerMode').value,
                defaultDifficulty: document.getElementById('ddlDefaultDifficulty').value,
                notifNewQuizzes: document.getElementById('chkNotifNewQuizzes').checked,
                notifMistakes: document.getElementById('chkNotifMistakes').checked,
                notifDigest: document.getElementById('chkNotifDigest').checked,
                codeFont: document.getElementById('ddlCodeFont').value,
                highContrast: document.getElementById('chkHighContrast').checked
            };

            localStorage.setItem('ql_settings', JSON.stringify(settings));
            showToast('Preferences saved successfully!');
        }

        function updatePassword() {
            const current = document.getElementById('txtCurrentPass').value;
            const newP = document.getElementById('txtNewPass').value;
            const confirmP = document.getElementById('txtConfirmPass').value;

            if (!current) {
                alert('Please enter your current password.');
                return;
            }
            if (newP.length < 6) {
                alert('New password must be at least 6 characters.');
                return;
            }
            if (newP !== confirmP) {
                alert('New password and confirmation do not match.');
                return;
            }

            document.getElementById('txtCurrentPass').value = '';
            document.getElementById('txtNewPass').value = '';
            document.getElementById('txtConfirmPass').value = '';
            showToast('Password updated successfully!');
        }

        function resetDefaults() {
            if (confirm('Reset all settings to default values?')) {
                document.getElementById('chkAutoAdvance').checked = true;
                document.getElementById('chkInstantFeedback').checked = true;
                document.getElementById('chkSoundEffects').checked = false;
                document.getElementById('ddlTimerMode').value = 'countdown';
                document.getElementById('ddlDefaultDifficulty').value = 'medium';
                document.getElementById('chkNotifNewQuizzes').checked = true;
                document.getElementById('chkNotifMistakes').checked = true;
                document.getElementById('chkNotifDigest').checked = false;
                document.getElementById('ddlCodeFont').value = 'JetBrains Mono';
                document.getElementById('chkHighContrast').checked = false;
                saveAllSettings();
            }
        }

        function showToast(msg) {
            const toast = document.getElementById('settingsToast');
            document.getElementById('toastMsg').innerText = msg;
            toast.classList.add('show');
            setTimeout(function () {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
