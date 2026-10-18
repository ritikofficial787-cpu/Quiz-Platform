<%@ Page Title="Student Dashboard - QuizLearn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="website.Dashboard" %>

<asp:Content ID="HeadContentArea" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .ql-dashboard-hero {
            padding: 48px 0 32px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            background: radial-gradient(circle at 50% 0%, rgba(124, 58, 237, 0.12) 0%, transparent 70%);
        }
        .ql-dashboard-header-inner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .ql-dashboard-welcome h1 {
            font-size: 32px;
            font-weight: 800;
            margin: 0 0 6px 0;
            color: #ffffff;
        }
        .ql-dashboard-welcome p {
            color: #94a3b8;
            margin: 0;
            font-size: 15px;
        }
        .ql-dashboard-badge {
            display: inline-block;
            background: rgba(124, 58, 237, 0.18);
            border: 1px solid rgba(139, 92, 246, 0.35);
            color: #c084fc;
            padding: 4px 12px;
            border-radius: 9999px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .ql-dashboard-stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin: 36px 0;
        }
        .ql-dash-card {
            background: #111422;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 14px;
            padding: 24px;
            transition: transform 0.2s, border-color 0.2s;
        }
        .ql-dash-card:hover {
            transform: translateY(-2px);
            border-color: rgba(139, 92, 246, 0.3);
        }
        .ql-dash-card-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: rgba(124, 58, 237, 0.15);
            border: 1px solid rgba(139, 92, 246, 0.25);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #a78bfa;
            margin-bottom: 16px;
        }
        .ql-dash-card-icon svg {
            width: 22px;
            height: 22px;
        }
        .ql-dash-card-value {
            font-size: 28px;
            font-weight: 800;
            color: #ffffff;
            margin-bottom: 4px;
        }
        .ql-dash-card-label {
            font-size: 13px;
            color: #94a3b8;
            font-weight: 500;
        }
        .ql-dash-sections-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
            margin-bottom: 60px;
        }
        .ql-dash-panel {
            background: #111422;
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 14px;
            padding: 28px;
        }
        .ql-dash-panel h3 {
            font-size: 18px;
            font-weight: 700;
            margin: 0 0 16px 0;
            color: #ffffff;
        }
        .ql-track-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 14px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.06);
        }
        .ql-track-item:last-child {
            border-bottom: none;
        }
        .ql-track-name {
            font-weight: 600;
            color: #ffffff;
            font-size: 14px;
        }
        .ql-track-meta {
            font-size: 12px;
            color: #94a3b8;
        }
        .ql-track-progress {
            font-size: 13px;
            font-weight: 600;
            color: #10b981;
        }
        @media (max-width: 900px) {
            .ql-dash-sections-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContentArea" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Hero Banner -->
    <section class="ql-dashboard-hero">
        <div class="ql-container">
            <div class="ql-dashboard-header-inner">
                <div class="ql-dashboard-welcome">
                    <span class="ql-dashboard-badge">Verified Learner Account</span>
                    <h1>Welcome back, <asp:Literal ID="litUserName" runat="server">Learner</asp:Literal>!</h1>
                    <p>Logged in as <asp:Literal ID="litUserEmail" runat="server" /> &bull; Ready to accelerate your mastery today?</p>
                </div>
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Sign Out" CssClass="ql-btn ql-btn-secondary ql-btn-sm" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content Grid -->
    <div class="ql-container" style="padding-top: 36px; padding-bottom: 48px;">
        <!-- Prototype Navigation Banner -->
        <div style="background: rgba(124, 58, 237, 0.12); border: 1px solid rgba(139, 92, 246, 0.35); border-radius: 12px; padding: 16px 22px; margin-bottom: 28px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 14px;">
            <div>
                <span class="ql-dashboard-badge" style="margin-bottom: 4px;">Frontend Prototype</span>
                <div style="color: #ffffff; font-weight: 700; font-size: 15px;">New Student Profile Setup & Student Dashboard UI</div>
                <div style="color: #94a3b8; font-size: 13px;">Experience the new onboarding and dedicated student dashboard screens built with vanilla JS and client storage.</div>
            </div>
            <div style="display: flex; gap: 10px;">
                <a href="StudentProfileSetup.aspx" class="ql-btn ql-btn-secondary ql-btn-sm">Profile Setup →</a>
                <a href="StudentDashboard.aspx" class="ql-btn ql-btn-primary ql-btn-sm">Student Dashboard →</a>
            </div>
        </div>

        <!-- Metrics Row -->
        <div class="ql-dashboard-stats-grid">
            <div class="ql-dash-card">
                <div class="ql-dash-card-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="19" y1="5" x2="5" y2="19"></line>
                        <circle cx="6.5" cy="6.5" r="2.5"></circle>
                        <circle cx="17.5" cy="17.5" r="2.5"></circle>
                    </svg>
                </div>
                <div class="ql-dash-card-value">92%</div>
                <div class="ql-dash-card-label">Overall Accuracy Rate</div>
            </div>

            <div class="ql-dash-card">
                <div class="ql-dash-card-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path>
                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path>
                    </svg>
                </div>
                <div class="ql-dash-card-value">12</div>
                <div class="ql-dash-card-label">Quizzes Completed</div>
            </div>

            <div class="ql-dash-card">
                <div class="ql-dash-card-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                    </svg>
                </div>
                <div class="ql-dash-card-value">Top 10%</div>
                <div class="ql-dash-card-label">Global Leaderboard Rank</div>
            </div>
        </div>

        <!-- Dashboard Learning Paths & Recommended Exercises -->
        <div class="ql-dash-sections-grid">
            <div class="ql-dash-panel">
                <h3>Recommended Learning Tracks</h3>
                <div class="ql-track-item">
                    <div>
                        <div class="ql-track-name">Data Structures &amp; Algorithms</div>
                        <div class="ql-track-meta">Binary Search Trees, Heaps, Graph Traversals</div>
                    </div>
                    <span class="ql-track-progress">85% Complete</span>
                </div>
                <div class="ql-track-item">
                    <div>
                        <div class="ql-track-name">System Design &amp; Scalability</div>
                        <div class="ql-track-meta">Load Balancing, Caching, Database Sharding</div>
                    </div>
                    <span class="ql-track-progress">60% Complete</span>
                </div>
                <div class="ql-track-item">
                    <div>
                        <div class="ql-track-name">Full-Stack Web Architecture</div>
                        <div class="ql-track-meta">ASP.NET Lifecycle, Session Management, Security</div>
                    </div>
                    <span class="ql-track-progress">90% Complete</span>
                </div>
            </div>

            <div class="ql-dash-panel">
                <h3>Quick Actions</h3>
                <div style="display: flex; flex-direction: column; gap: 12px;">
                    <a href="<%= ResolveUrl("~/") %>#quiz-showcase" class="ql-btn ql-btn-primary" style="text-align: center;">Practice Next Quiz</a>
                    <a href="<%= ResolveUrl("~/") %>#features" class="ql-btn ql-btn-secondary" style="text-align: center;">Explore Topics</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
