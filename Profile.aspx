<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="website.Profile" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Profile - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style>
        /* Main Layout Width Fix */
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
        .ql-profile-wrap {
            max-width: 100% !important;
            margin: 0 !important;
            width: 100% !important;
        }

        /* Profile Header Card */
        .ql-profile-header-card {
            background: linear-gradient(135deg, rgba(124, 58, 237, 0.16) 0%, rgba(15, 18, 30, 0.98) 100%);
            border: 1px solid rgba(139, 92, 246, 0.28);
            border-radius: 18px;
            padding: 32px 36px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 24px;
            margin-bottom: 28px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.45);
            position: relative;
            overflow: hidden;
        }
        .ql-profile-header-card::before {
            content: '';
            position: absolute;
            top: -60px;
            right: -60px;
            width: 220px;
            height: 220px;
            background: radial-gradient(circle, rgba(124, 58, 237, 0.22) 0%, transparent 70%);
            border-radius: 50%;
            pointer-events: none;
        }
        .ql-profile-user-left {
            display: flex;
            align-items: center;
            gap: 24px;
        }
        .ql-profile-avatar-large {
            width: 86px;
            height: 86px;
            border-radius: 20px;
            background: linear-gradient(135deg, #7c3aed 0%, #ec4899 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 800;
            color: #ffffff;
            box-shadow: 0 8px 24px rgba(124, 58, 237, 0.45);
            border: 2px solid rgba(255, 255, 255, 0.16);
            flex-shrink: 0;
        }
        .ql-profile-title-name {
            font-size: 28px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 6px 0;
            letter-spacing: -0.02em;
        }
        .ql-profile-email {
            color: #94a3b8;
            font-size: 14px;
            margin: 0 0 12px 0;
        }
        .ql-profile-pill-tags {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }
        .ql-profile-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-size: 11.5px;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 9999px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .ql-profile-badge-pro {
            background: rgba(124, 58, 237, 0.2);
            border: 1px solid rgba(139, 92, 246, 0.35);
            color: #c084fc;
        }
        .ql-profile-badge-verified {
            background: rgba(16, 185, 129, 0.15);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #34d399;
        }
        .ql-profile-badge-active {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #e2e8f0;
        }
        .ql-profile-actions {
            display: flex;
            gap: 12px;
            align-items: center;
            flex-shrink: 0;
        }
        .ql-btn-edit-profile {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #7c3aed 0%, #6d28d9 100%);
            border: 1px solid rgba(167, 139, 250, 0.4);
            color: #ffffff;
            font-size: 13.5px;
            font-weight: 600;
            padding: 10px 22px;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(124, 58, 237, 0.35);
            transition: all 0.2s ease;
            text-decoration: none;
        }
        .ql-btn-edit-profile:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(124, 58, 237, 0.5);
            background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
        }
        .ql-btn-settings-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #cbd5e1;
            font-size: 13.5px;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .ql-btn-settings-link:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(139, 92, 246, 0.35);
            color: #ffffff;
        }

        /* Profile 4-Stat Cards Grid */
        .ql-profile-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }
        .ql-profile-stat-card {
            background: #0f121e;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 22px 24px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 140px;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }
        .ql-profile-stat-card:hover {
            border-color: rgba(139, 92, 246, 0.35);
            transform: translateY(-2px);
            background: #121626;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
        }
        .ql-profile-stat-card .ql-stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }
        .ql-profile-stat-card .ql-stat-label {
            font-size: 13px;
            color: #94a3b8;
            font-weight: 600;
            letter-spacing: 0.01em;
        }
        .ql-profile-stat-card .ql-stat-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            transition: transform 0.2s ease;
        }
        .ql-profile-stat-card:hover .ql-stat-icon {
            transform: scale(1.06);
        }
        .ql-profile-stat-card .ql-stat-icon svg {
            width: 20px;
            height: 20px;
            stroke-width: 2;
            fill: none;
            stroke: currentColor;
            stroke-linecap: round;
            stroke-linejoin: round;
        }
        .ql-profile-stat-card .ql-stat-icon.purple {
            background: rgba(124, 58, 237, 0.16);
            border: 1px solid rgba(139, 92, 246, 0.3);
            color: #c084fc;
        }
        .ql-profile-stat-card .ql-stat-icon.green {
            background: rgba(16, 185, 129, 0.16);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #34d399;
        }
        .ql-profile-stat-card .ql-stat-icon.blue {
            background: rgba(14, 165, 233, 0.16);
            border: 1px solid rgba(14, 165, 233, 0.3);
            color: #38bdf8;
        }
        .ql-profile-stat-card .ql-stat-icon.amber {
            background: rgba(245, 158, 11, 0.16);
            border: 1px solid rgba(245, 158, 11, 0.3);
            color: #fbbf24;
        }
        .ql-profile-stat-card .ql-stat-value {
            font-size: 32px;
            font-weight: 800;
            color: #ffffff;
            line-height: 1.1;
            margin-bottom: 8px;
            letter-spacing: -0.02em;
        }
        .ql-profile-stat-card .ql-stat-trend {
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }
        .ql-profile-stat-card .ql-stat-trend.positive {
            color: #34d399;
        }
        .ql-profile-stat-card .ql-stat-trend.neutral {
            color: #94a3b8;
        }

        /* Two-column Profile Grid */
        .ql-profile-grid-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 28px;
            align-items: start;
        }
        .ql-profile-card {
            background: #0f121e;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 26px 28px;
            box-sizing: border-box;
            transition: border-color 0.2s ease;
        }
        .ql-profile-card:hover {
            border-color: rgba(139, 92, 246, 0.25);
        }
        .ql-profile-card-title {
            font-size: 16.5px;
            font-weight: 700;
            color: #ffffff;
            margin: 0 0 20px 0;
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 14px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.06);
        }
        .ql-card-title-icon {
            width: 34px;
            height: 34px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .ql-card-title-icon svg {
            width: 18px;
            height: 18px;
            stroke-width: 2;
            fill: none;
            stroke: currentColor;
            stroke-linecap: round;
            stroke-linejoin: round;
        }
        .ql-card-title-icon.purple {
            background: rgba(124, 58, 237, 0.16);
            border: 1px solid rgba(139, 92, 246, 0.3);
            color: #c084fc;
        }
        .ql-card-title-icon.blue {
            background: rgba(14, 165, 233, 0.16);
            border: 1px solid rgba(14, 165, 233, 0.3);
            color: #38bdf8;
        }
        .ql-card-title-icon.green {
            background: rgba(16, 185, 129, 0.16);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #34d399;
        }
        .ql-card-title-icon.amber {
            background: rgba(245, 158, 11, 0.16);
            border: 1px solid rgba(245, 158, 11, 0.3);
            color: #fbbf24;
        }
        .ql-profile-data-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 13px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.04);
        }
        .ql-profile-data-row:last-child {
            border-bottom: none;
        }
        .ql-profile-data-label {
            color: #94a3b8;
            font-size: 13.5px;
            font-weight: 500;
        }
        .ql-profile-data-val {
            color: #f1f5f9;
            font-weight: 600;
            font-size: 14px;
        }
        .ql-profile-status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(16, 185, 129, 0.15);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #34d399;
            font-size: 12px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 9999px;
        }
        .ql-profile-status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #34d399;
            box-shadow: 0 0 8px rgba(52, 211, 153, 0.6);
        }
        .ql-profile-track-chip {
            display: inline-flex;
            align-items: center;
            padding: 6px 14px;
            border-radius: 9999px;
            background: rgba(124, 58, 237, 0.14);
            border: 1px solid rgba(139, 92, 246, 0.28);
            color: #c084fc;
            font-size: 12px;
            font-weight: 600;
            transition: all 0.2s ease;
        }
        .ql-profile-track-chip:hover {
            background: rgba(124, 58, 237, 0.24);
            border-color: rgba(139, 92, 246, 0.45);
            transform: translateY(-1px);
        }
        .ql-profile-badge-item {
            display: flex;
            align-items: center;
            gap: 14px;
            background: rgba(255, 255, 255, 0.025);
            border: 1px solid rgba(255, 255, 255, 0.06);
            padding: 12px 16px;
            border-radius: 12px;
            transition: all 0.2s ease;
        }
        .ql-profile-badge-item:hover {
            background: rgba(255, 255, 255, 0.04);
            border-color: rgba(139, 92, 246, 0.25);
            transform: translateX(2px);
        }
        .ql-profile-badge-emoji {
            font-size: 24px;
            line-height: 1;
            flex-shrink: 0;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .ql-profile-stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 900px) {
            .ql-profile-grid-2col {
                grid-template-columns: 1fr;
            }
            .ql-profile-stats-grid {
                grid-template-columns: 1fr;
            }
            .ql-profile-header-card {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }
            .ql-profile-actions {
                width: 100%;
                justify-content: flex-start;
            }
        }

        .ql-edit-modal-backdrop {
            display: none;
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(4, 6, 12, 0.85);
            backdrop-filter: blur(8px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .ql-edit-modal-backdrop.open {
            display: flex;
        }
        .ql-edit-modal-box {
            background: #0f121e;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            width: 100%;
            max-width: 540px;
            padding: 28px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.6);
            position: relative;
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
    <form id="formProfile" runat="server">
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

                    <a href="Profile.aspx" class="ql-nav-item active" id="navProfile">
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
                    <span style="font-size: 15px; font-weight: 700; color: #ffffff;">Student Profile</span>
                </div>

                <div class="ql-header-right">
                    <button type="button" class="ql-notif-btn" id="btnNotifications" title="Notifications" onclick="showNotificationToast()">
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

            <!-- Profile Body -->
            <main class="ql-dash-body">
                <div class="ql-profile-wrap">
                    <!-- Profile Header Card -->
                    <div class="ql-profile-header-card">
                        <div class="ql-profile-user-left">
                            <div class="ql-profile-avatar-large" id="profileBigAvatar"><%: StudentInitials %></div>
                            <div>
                                <h1 class="ql-profile-title-name" id="profileDisplayName"><%: StudentName %></h1>
                                <p class="ql-profile-email" id="profileDisplayEmail"><%: StudentEmail %></p>
                                <div class="ql-profile-pill-tags">
                                    <span class="ql-profile-badge ql-profile-badge-pro">★ Pro Learner</span>
                                    <span class="ql-profile-badge ql-profile-badge-verified">✓ Verified Student</span>
                                    <span class="ql-profile-badge ql-profile-badge-active">Active Member</span>
                                </div>
                            </div>
                        </div>

                        <div class="ql-profile-actions">
                            <button type="button" class="ql-btn-edit-profile" onclick="openEditModal()">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                                <span>Edit Profile</span>
                            </button>
                            <a href="Settings.aspx" class="ql-btn-settings-link">
                                <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="3"></circle>
                                    <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                                </svg>
                                <span>Settings</span>
                            </a>
                        </div>
                    </div>

                    <!-- Quick Stats Overview (4 Cards in responsive row) -->
                    <div class="ql-profile-stats-grid">
                        <!-- Stat 1: Quizzes Completed -->
                        <div class="ql-profile-stat-card">
                            <div class="ql-stat-top">
                                <span class="ql-stat-label">Quizzes Completed</span>
                                <div class="ql-stat-icon purple">
                                    <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                </div>
                            </div>
                            <div class="ql-stat-value">14</div>
                            <div class="ql-stat-trend positive">↑ 3 this week</div>
                        </div>

                        <!-- Stat 2: Overall Accuracy -->
                        <div class="ql-profile-stat-card">
                            <div class="ql-stat-top">
                                <span class="ql-stat-label">Overall Accuracy</span>
                                <div class="ql-stat-icon green">
                                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                </div>
                            </div>
                            <div class="ql-stat-value">78%</div>
                            <div class="ql-stat-trend positive">Top 15% rank</div>
                        </div>

                        <!-- Stat 3: Mistakes Reviewed -->
                        <div class="ql-profile-stat-card">
                            <div class="ql-stat-top">
                                <span class="ql-stat-label">Mistakes Reviewed</span>
                                <div class="ql-stat-icon blue">
                                    <svg viewBox="0 0 24 24"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                </div>
                            </div>
                            <div class="ql-stat-value">8 / 12</div>
                            <div class="ql-stat-trend neutral">66.7% cleared</div>
                        </div>

                        <!-- Stat 4: Study Hours -->
                        <div class="ql-profile-stat-card">
                            <div class="ql-stat-top">
                                <span class="ql-stat-label">Study Hours</span>
                                <div class="ql-stat-icon amber">
                                    <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                </div>
                            </div>
                            <div class="ql-stat-value">12.5 h</div>
                            <div class="ql-stat-trend positive">Consistent learner</div>
                        </div>
                    </div>

                    <!-- 2-Column Grid -->
                    <div class="ql-profile-grid-2col">
                        <!-- Left Column: Academic & Educational Information -->
                        <div>
                            <!-- Academic Profile Card -->
                            <div class="ql-profile-card" style="margin-bottom: 24px;">
                                <h2 class="ql-profile-card-title">
                                    <div class="ql-card-title-icon purple">
                                        <svg viewBox="0 0 24 24">
                                            <path d="M22 10v6M2 10l10-5 10 5-10 5z"></path>
                                            <path d="M6 12v5c3 3 9 3 12 0v-5"></path>
                                        </svg>
                                    </div>
                                    <span>Academic & Study Profile</span>
                                </h2>

                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Education Level</span>
                                    <span class="ql-profile-data-val" id="profileEducationLevel">Undergraduate (B.Tech / B.E.)</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Institution / College</span>
                                    <span class="ql-profile-data-val" id="profileCollege">National Institute of Technology</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Target Goal / Exam</span>
                                    <span class="ql-profile-data-val" id="profileTargetExam">Campus Placements & GATE</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Difficulty Preference</span>
                                    <span class="ql-profile-data-val" id="profileDifficulty">Intermediate / Medium</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Daily Study Target</span>
                                    <span class="ql-profile-data-val">20 mins / day</span>
                                </div>
                            </div>

                            <!-- Enrolled Subject Tracks Card -->
                            <div class="ql-profile-card">
                                <h2 class="ql-profile-card-title">
                                    <div class="ql-card-title-icon blue">
                                        <svg viewBox="0 0 24 24">
                                            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path>
                                            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path>
                                        </svg>
                                    </div>
                                    <span>Enrolled Subject Tracks</span>
                                </h2>

                                <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 20px;" id="profileSubjectsContainer">
                                    <span class="ql-profile-track-chip">C# & .NET</span>
                                    <span class="ql-profile-track-chip">Java Basics</span>
                                    <span class="ql-profile-track-chip">DBMS & SQL</span>
                                    <span class="ql-profile-track-chip">Operating Systems</span>
                                    <span class="ql-profile-track-chip">Web Development</span>
                                </div>

                                <div style="font-size: 13px; color: #94a3b8; line-height: 1.6;">
                                    You are enrolled in foundational computer science subjects. Recommended quizzes and weekly practice sets are tailored to these tracks.
                                </div>
                            </div>
                        </div>

                        <!-- Right Column: Account & Activity -->
                        <div>
                            <!-- Account Information Card -->
                            <div class="ql-profile-card" style="margin-bottom: 24px;">
                                <h2 class="ql-profile-card-title">
                                    <div class="ql-card-title-icon green">
                                        <svg viewBox="0 0 24 24">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                    </div>
                                    <span>Account Information</span>
                                </h2>

                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Account Type</span>
                                    <span class="ql-profile-data-val">Student (Pro Plan)</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Email Address</span>
                                    <span class="ql-profile-data-val" id="profileCardEmail"><%: StudentEmail %></span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Member Since</span>
                                    <span class="ql-profile-data-val">October 2026</span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Status</span>
                                    <span class="ql-profile-data-val">
                                        <span class="ql-profile-status-badge">
                                            <span class="ql-profile-status-dot"></span> Active
                                        </span>
                                    </span>
                                </div>
                                <div class="ql-profile-data-row">
                                    <span class="ql-profile-data-label">Language</span>
                                    <span class="ql-profile-data-val">English (US)</span>
                                </div>
                            </div>

                            <!-- Milestones & Badges Card -->
                            <div class="ql-profile-card">
                                <h2 class="ql-profile-card-title">
                                    <div class="ql-card-title-icon amber">
                                        <svg viewBox="0 0 24 24">
                                            <circle cx="12" cy="8" r="7"></circle>
                                            <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"></polyline>
                                        </svg>
                                    </div>
                                    <span>Milestones & Badges</span>
                                </h2>

                                <div style="display: flex; flex-direction: column; gap: 12px;">
                                    <div class="ql-profile-badge-item">
                                        <span class="ql-profile-badge-emoji">🎯</span>
                                        <div>
                                            <div style="font-size: 13.5px; font-weight: 700; color: #fff;">First Quiz Mastered</div>
                                            <div style="font-size: 11.5px; color: #94a3b8;">Scored 90%+ in C# OOP Fundamentals</div>
                                        </div>
                                    </div>
                                    <div class="ql-profile-badge-item">
                                        <span class="ql-profile-badge-emoji">⚡</span>
                                        <div>
                                            <div style="font-size: 13.5px; font-weight: 700; color: #fff;">Rapid Learner</div>
                                            <div style="font-size: 11.5px; color: #94a3b8;">Completed 5 quizzes in a single day</div>
                                        </div>
                                    </div>
                                    <div class="ql-profile-badge-item">
                                        <span class="ql-profile-badge-emoji">📖</span>
                                        <div>
                                            <div style="font-size: 13.5px; font-weight: 700; color: #fff;">Mistake Detective</div>
                                            <div style="font-size: 11.5px; color: #94a3b8;">Reviewed 8 notebook questions</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>

    <!-- Edit Profile Modal -->
    <div class="ql-edit-modal-backdrop" id="editProfileModal">
        <div class="ql-edit-modal-box">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 12px; border-bottom: 1px solid rgba(255,255,255,0.08);">
                <h3 style="font-size: 18px; font-weight: 700; color: #ffffff; margin: 0;">Edit Student Profile</h3>
                <button type="button" onclick="closeEditModal()" style="background: none; border: none; color: #94a3b8; font-size: 24px; cursor: pointer;">&times;</button>
            </div>

            <div style="display: flex; flex-direction: column; gap: 16px; margin-bottom: 24px;">
                <div class="ql-settings-field-wrap">
                    <label class="ql-settings-field-label">Full Name</label>
                    <input type="text" id="editTxtFullName" class="ql-settings-text-input" placeholder="Your full name" />
                </div>

                <div class="ql-settings-field-wrap">
                    <label class="ql-settings-field-label">Education Level</label>
                    <select id="editDdlEducation" class="ql-settings-text-input" style="cursor: pointer;">
                        <option value="Undergraduate (B.Tech / B.E.)">Undergraduate (B.Tech / B.E.)</option>
                        <option value="Postgraduate (M.Tech / MCA)">Postgraduate (M.Tech / MCA)</option>
                        <option value="High School (11th - 12th)">High School (11th - 12th)</option>
                        <option value="Diploma / Polytechnic">Diploma / Polytechnic</option>
                        <option value="Self-Taught / Professional">Self-Taught / Professional</option>
                    </select>
                </div>

                <div class="ql-settings-field-wrap">
                    <label class="ql-settings-field-label">Institution / University</label>
                    <input type="text" id="editTxtCollege" class="ql-settings-text-input" placeholder="College / University Name" />
                </div>

                <div class="ql-settings-field-wrap">
                    <label class="ql-settings-field-label">Target Exam / Goal</label>
                    <select id="editDdlTarget" class="ql-settings-text-input" style="cursor: pointer;">
                        <option value="Campus Placements & GATE">Campus Placements & GATE</option>
                        <option value="Semester Exams & Academics">Semester Exams & Academics</option>
                        <option value="Software Engineer Hiring">Software Engineer Hiring</option>
                        <option value="Skill Certification">Skill Certification</option>
                    </select>
                </div>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px;">
                <button type="button" class="ql-btn-review-link" onclick="closeEditModal()" style="padding: 9px 18px; border-radius: 9px; border: 1px solid rgba(255,255,255,0.1);">Cancel</button>
                <button type="button" class="ql-btn-practice-mistakes" onclick="saveProfileChanges()" style="padding: 9px 20px;">Save Profile</button>
            </div>
        </div>
    </div>

    <!-- Notification / Toast Feedback -->
    <div class="ql-toast" id="profileToast">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
        <span id="toastMessage">Profile updated successfully!</span>
    </div>

    <script>
        // Load saved profile data from localStorage if present
        document.addEventListener('DOMContentLoaded', function () {
            try {
                const saved = localStorage.getItem('ql_student_profile');
                if (saved) {
                    const data = JSON.parse(saved);
                    if (data.fullName) {
                        document.getElementById('profileDisplayName').innerText = data.fullName;
                        document.getElementById('lblHeaderUserName').innerText = data.fullName;
                        const initials = getInitials(data.fullName);
                        document.getElementById('profileBigAvatar').innerText = initials;
                        document.getElementById('lblHeaderAvatar').innerText = initials;
                    }
                    if (data.email) {
                        document.getElementById('profileDisplayEmail').innerText = data.email;
                        document.getElementById('profileCardEmail').innerText = data.email;
                    }
                    if (data.educationLevel) {
                        document.getElementById('profileEducationLevel').innerText = data.educationLevel;
                    }
                    if (data.college) {
                        document.getElementById('profileCollege').innerText = data.college;
                    }
                    if (data.targetExam) {
                        document.getElementById('profileTargetExam').innerText = data.targetExam;
                    }
                }
            } catch (e) {
                console.error(e);
            }

            // Mobile sidebar toggle
            const toggleBtn = document.getElementById('btnToggleSidebar');
            const sidebar = document.getElementById('dashboardSidebar');
            if (toggleBtn && sidebar) {
                toggleBtn.addEventListener('click', function () {
                    sidebar.classList.toggle('open');
                });
            }
        });

        function getInitials(name) {
            const parts = name.trim().split(' ').filter(Boolean);
            if (parts.length >= 2) return (parts[0][0] + parts[1][0]).toUpperCase();
            if (parts.length === 1) return parts[0].substring(0, 2).toUpperCase();
            return 'LE';
        }

        function openEditModal() {
            const name = document.getElementById('profileDisplayName').innerText;
            const edu = document.getElementById('profileEducationLevel').innerText;
            const college = document.getElementById('profileCollege').innerText;
            const target = document.getElementById('profileTargetExam').innerText;

            document.getElementById('editTxtFullName').value = name;
            document.getElementById('editTxtCollege').value = college;

            const ddlEdu = document.getElementById('editDdlEducation');
            for (let i = 0; i < ddlEdu.options.length; i++) {
                if (ddlEdu.options[i].value === edu) {
                    ddlEdu.selectedIndex = i;
                    break;
                }
            }

            const ddlTarget = document.getElementById('editDdlTarget');
            for (let i = 0; i < ddlTarget.options.length; i++) {
                if (ddlTarget.options[i].value === target) {
                    ddlTarget.selectedIndex = i;
                    break;
                }
            }

            document.getElementById('editProfileModal').classList.add('open');
        }

        function closeEditModal() {
            document.getElementById('editProfileModal').classList.remove('open');
        }

        function saveProfileChanges() {
            const newName = document.getElementById('editTxtFullName').value.trim();
            const newCollege = document.getElementById('editTxtCollege').value.trim() || 'National Institute of Technology';
            const newEdu = document.getElementById('editDdlEducation').value;
            const newTarget = document.getElementById('editDdlTarget').value;

            if (!newName) {
                alert('Please enter your full name.');
                return;
            }

            // Update DOM
            document.getElementById('profileDisplayName').innerText = newName;
            document.getElementById('lblHeaderUserName').innerText = newName;
            const initials = getInitials(newName);
            document.getElementById('profileBigAvatar').innerText = initials;
            document.getElementById('lblHeaderAvatar').innerText = initials;
            document.getElementById('profileEducationLevel').innerText = newEdu;
            document.getElementById('profileCollege').innerText = newCollege;
            document.getElementById('profileTargetExam').innerText = newTarget;

            // Persist to localStorage
            let current = {};
            try {
                current = JSON.parse(localStorage.getItem('ql_student_profile') || '{}');
            } catch (e) {}

            current.fullName = newName;
            current.educationLevel = newEdu;
            current.college = newCollege;
            current.targetExam = newTarget;

            localStorage.setItem('ql_student_profile', JSON.stringify(current));

            closeEditModal();
            showToast('Profile updated successfully!');
        }

        function showToast(msg) {
            const toast = document.getElementById('profileToast');
            document.getElementById('toastMessage').innerText = msg;
            toast.classList.add('show');
            setTimeout(function () {
                toast.classList.remove('show');
            }, 3000);
        }

        function showNotificationToast() {
            showToast('You have 2 pending revision questions in Mistake Notebook!');
        }
    </script>
</body>
</html>
