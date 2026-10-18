<%@ Page Title="Master Your Skills with Adaptive Quizzes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- =====================================================================
         Hero Section: High-impact headline, subtext, actions & quiz preview
         ===================================================================== -->
    <section class="ql-hero">
        <div class="ql-container">
            <div class="ql-hero-content">
                <!-- Introductory Badge -->
                <div class="ql-badge-pill">
                    <span class="sparkle-icon">✨</span>
                    <span>The Next Generation of Quiz Learning</span>
                </div>

                <!-- Main Headline -->
                <h1 class="ql-hero-title">
                    Test Your Knowledge.<br />
                    Master Your Skills.
                </h1>

                <!-- Subheadline -->
                <p class="ql-hero-desc">
                    Empower your learning journey with adaptive quizzes, real-time analytics, and AI-assisted personalized feedback designed for mastery.
                </p>

                <!-- Action CTAs -->
                <div class="ql-hero-actions">
                    <a href="#pricing" class="ql-btn ql-btn-primary">Start Learning Free</a>
                    <a href="#quiz-showcase" id="btnWatchDemo" class="ql-btn ql-btn-secondary">Watch Live Demo</a>
                </div>
            </div>

            <!-- Interactive Quiz Showcase / Live Demo Preview Card -->
            <div class="ql-quiz-showcase" id="quizShowcase">
                <!-- Window Chrome Header -->
                <div class="ql-window-header">
                    <div class="ql-window-dots">
                        <span class="ql-dot ql-dot-red"></span>
                        <span class="ql-dot ql-dot-yellow"></span>
                        <span class="ql-dot ql-dot-green"></span>
                    </div>
                    <div class="ql-window-title">
                        <span>quizlearn@workspace: ~/cs/algorithms</span>
                    </div>
                    <div class="ql-window-actions">
                        <button type="button" class="ql-btn-window-reset" id="btnResetQuiz">Reset Question</button>
                    </div>
                </div>

                <!-- Quiz Body Layout -->
                <div class="ql-quiz-body">
                    <!-- Left Sidebar Topics -->
                    <aside class="ql-quiz-sidebar">
                        <div class="ql-sidebar-heading">Computer Science</div>
                        <ul class="ql-sidebar-list">
                            <li class="ql-sidebar-item active" data-topic="algorithms">
                                <span>Algorithm Design</span>
                            </li>
                            <li class="ql-sidebar-item" data-topic="datastructures">
                                <span>Data Structures</span>
                            </li>
                            <li class="ql-sidebar-item" data-topic="webdev">
                                <span>Web Development</span>
                            </li>
                        </ul>
                    </aside>

                    <!-- Main Interactive Question Panel -->
                    <div class="ql-quiz-main">
                        <div>
                            <!-- Meta Header -->
                            <div class="ql-quiz-meta">
                                <span class="ql-quiz-badge" id="quizQuestionMeta">QUESTION 4 OF 10 • ALGORITHMS &amp; COMPLEXITY</span>
                                <span class="ql-quiz-timer">
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/></svg>
                                    01:45 remaining
                                </span>
                            </div>

                            <!-- Question Prompt -->
                            <div class="ql-quiz-question" id="quizQuestionText">
                                Which of the following sorting algorithms guarantees O(n log n) time complexity in the worst case and is not in-place without extra memory overhead?
                            </div>

                            <!-- Question Options List -->
                            <div class="ql-options-list" id="quizOptionsContainer">
                                <!-- Option A -->
                                <div class="ql-option-item" data-correct="false" data-explanation="Quick Sort has a worst-case time complexity of O(n²) when bad pivots are chosen, though it operates in-place.">
                                    <div class="ql-option-left">
                                        <span class="ql-option-indicator">A</span>
                                        <span>Quick Sort (partition-based divide and conquer)</span>
                                    </div>
                                    <span class="ql-option-icon"></span>
                                </div>

                                <!-- Option B (Correct) -->
                                <div class="ql-option-item state-correct" data-correct="true" data-explanation="Merge Sort consistently guarantees O(n log n) across best, average, and worst cases, requiring O(n) auxiliary memory.">
                                    <div class="ql-option-left">
                                        <span class="ql-option-indicator">B</span>
                                        <span>Merge Sort (divide-and-conquer with auxiliary array)</span>
                                    </div>
                                    <span class="ql-option-icon">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="#10B981"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                    </span>
                                </div>

                                <!-- Option C (Incorrect Example in Reference) -->
                                <div class="ql-option-item state-incorrect" data-correct="false" data-explanation="Bubble Sort has an O(n²) worst-case time complexity and is in-place.">
                                    <div class="ql-option-left">
                                        <span class="ql-option-indicator">C</span>
                                        <span>Bubble Sort (nested comparison passes)</span>
                                    </div>
                                    <span class="ql-option-icon">
                                        <svg width="18" height="18" viewBox="0 0 24 24" fill="#EF4444"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>
                                    </span>
                                </div>

                                <!-- Option D -->
                                <div class="ql-option-item" data-correct="false" data-explanation="Heap Sort guarantees O(n log n) in the worst case, but it is an in-place algorithm (O(1) extra auxiliary space).">
                                    <div class="ql-option-left">
                                        <span class="ql-option-indicator">D</span>
                                        <span>Heap Sort (binary heap tree structure)</span>
                                    </div>
                                    <span class="ql-option-icon"></span>
                                </div>
                            </div>
                        </div>

                        <!-- Diagnostic Feedback Box -->
                        <div class="ql-quiz-feedback" id="quizFeedbackBox" style="display: block; border-left-color: #10B981;">
                            <strong>Diagnostic Analysis:</strong> Merge Sort divides the array into two halves, recursively sorts them, and merges the sorted halves. It guarantees O(n log n) performance even on worst-case inputs, at the cost of O(n) auxiliary buffer space.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Trusted Institutions Strip
         ===================================================================== -->
    <section class="ql-institutions">
        <div class="ql-container">
            <div class="ql-institutions-label">
                TRUSTED BY STUDENTS AND EDUCATORS FROM TOP INSTITUTIONS
            </div>
            <div class="ql-institutions-grid">
                <div class="ql-institution-item">
                    <svg class="ql-institution-crest" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 3L1 9l4 2.18v6L12 21l7-3.82v-6l2-1.09V17h2V9L12 3zm6.82 6L12 12.72 5.18 9 12 5.28 18.82 9zM17 15.99l-5 2.73-5-2.73v-3.72L12 15l5-2.73v3.72z"/>
                    </svg>
                    <span>Stanford</span>
                </div>
                <div class="ql-institution-item">
                    <svg class="ql-institution-crest" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M4 10h3v7H4zm6-4h3v11h-3zm6 7h3v4h-3zM2 20h20v2H2z"/>
                    </svg>
                    <span>MIT</span>
                </div>
                <div class="ql-institution-item">
                    <svg class="ql-institution-crest" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2L3 7v10l9 5 9-5V7l-9-5zm0 2.2l6.5 3.6-6.5 3.6L5.5 7.8 12 4.2zM5 9.4l6 3.3v7.3l-6-3.3V9.4zm8 10.6v-7.3l6-3.3v7.3l-6 3.3z"/>
                    </svg>
                    <span>Oxford</span>
                </div>
                <div class="ql-institution-item">
                    <svg class="ql-institution-crest" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"/>
                    </svg>
                    <span>Cambridge</span>
                </div>
                <div class="ql-institution-item">
                    <svg class="ql-institution-crest" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>
                    <span>Caltech</span>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Features Section (4 Cards)
         ===================================================================== -->
    <section class="ql-section" id="features">
        <div class="ql-container">
            <div class="ql-section-header">
                <div class="ql-badge-pill">Powerful Capabilities</div>
                <h2 class="ql-section-title">Modern features for high-performance learning</h2>
                <p class="ql-section-subtitle">
                    Everything you need to test, retain, and elevate your knowledge through science-backed methodologies.
                </p>
            </div>

            <div class="ql-features-grid">
                <!-- Feature 1 -->
                <div class="ql-feature-card">
                    <div class="ql-feature-icon">
                        <svg viewBox="0 0 24 24"><path d="M18 2H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 4h5v8l-2.5-1.5L6 12V4z"/></svg>
                    </div>
                    <h3 class="ql-feature-title">Subject-Based Paths</h3>
                    <p class="ql-feature-desc">
                        Curated learning paths across computer science, engineering, mathematics, and natural sciences.
                    </p>
                </div>

                <!-- Feature 2 -->
                <div class="ql-feature-card">
                    <div class="ql-feature-icon">
                        <svg viewBox="0 0 24 24"><path d="M12 3c-4.97 0-9 4.03-9 9 0 2.12.74 4.07 1.97 5.61L4.35 19.4c-.39.39-.39 1.02 0 1.41.39.39 1.02.39 1.41 0l1.9-1.9C9.22 19.59 10.57 20 12 20c4.97 0 9-4.03 9-9s-4.03-9-9-9zm0 15c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6z"/></svg>
                    </div>
                    <h3 class="ql-feature-title">AI Adaptive Learning</h3>
                    <p class="ql-feature-desc">
                        Dynamic questions that automatically adjust to your skill level in real-time as you solve them.
                    </p>
                </div>

                <!-- Feature 3 -->
                <div class="ql-feature-card">
                    <div class="ql-feature-icon">
                        <svg viewBox="0 0 24 24"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/></svg>
                    </div>
                    <h3 class="ql-feature-title">Performance Tracking</h3>
                    <p class="ql-feature-desc">
                        Comprehensive diagnostic metrics and skill mastery breakdowns to pinpoint your strengths and weaknesses.
                    </p>
                </div>

                <!-- Feature 4 -->
                <div class="ql-feature-card">
                    <div class="ql-feature-icon">
                        <svg viewBox="0 0 24 24"><path d="M7 2v11h3v9l7-12h-4l4-8z"/></svg>
                    </div>
                    <h3 class="ql-feature-title">Instant Diagnostic Feedback</h3>
                    <p class="ql-feature-desc">
                        Detailed step-by-step solutions, key conceptual takeaways, and hints immediately after every answer.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         How It Works Section: THE WORKFLOW (Matches Figma: media_1792088816439.png)
         ===================================================================== -->
    <section class="ql-section" id="how-it-works">
        <div class="ql-container">
            <div class="ql-section-header" style="text-align: center; margin-bottom: 48px;">
                <div class="ql-workflow-eyebrow">THE WORKFLOW</div>
                <h2 class="ql-workflow-title">Three steps to continuous evolution</h2>
                <p class="ql-workflow-subtitle">
                    Our system builds muscle memory through quick-feedback diagnostics.
                </p>
            </div>

            <div class="ql-workflow-grid">
                <!-- Step 1 Card -->
                <div class="ql-workflow-card">
                    <div class="ql-workflow-img-box">
                        <img src="Content/images/step1-choose-subject.png" alt="Choose a Subject" />
                    </div>
                    <div class="ql-workflow-card-body">
                        <div class="ql-workflow-step-tag">STEP 01</div>
                        <h3 class="ql-workflow-step-name">Choose a Subject</h3>
                        <p class="ql-workflow-step-text">
                            Select from our vast technical database or generate custom modules with AI.
                        </p>
                    </div>
                </div>

                <!-- Step 2 Card -->
                <div class="ql-workflow-card">
                    <div class="ql-workflow-img-box">
                        <img src="Content/images/step2-adaptive-quizzes.png" alt="Take Adaptive Quizzes" />
                    </div>
                    <div class="ql-workflow-card-body">
                        <div class="ql-workflow-step-tag">STEP 02</div>
                        <h3 class="ql-workflow-step-name">Take Adaptive Quizzes</h3>
                        <p class="ql-workflow-step-text">
                            Answer tailored, real-time diagnostic scenarios that adapt to your progress.
                        </p>
                    </div>
                </div>

                <!-- Step 3 Card -->
                <div class="ql-workflow-card">
                    <div class="ql-workflow-img-box">
                        <img src="Content/images/step3-analyze-improve.png" alt="Analyze &amp; Improve" />
                    </div>
                    <div class="ql-workflow-card-body">
                        <div class="ql-workflow-step-tag">STEP 03</div>
                        <h3 class="ql-workflow-step-name">Analyze &amp; Improve</h3>
                        <p class="ql-workflow-step-text">
                            Study comprehensive metric breakdowns and pinpoint memory gaps instantly.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Statistics Section
         ===================================================================== -->
    <section class="ql-section" style="padding: 40px 0 70px 0;">
        <div class="ql-container">
            <div class="ql-stats-bar">
                <div class="ql-stat-item">
                    <div class="ql-stat-number">50,000+</div>
                    <div class="ql-stat-label">Questions Solved</div>
                </div>
                <div class="ql-stat-item">
                    <div class="ql-stat-number">10,000+</div>
                    <div class="ql-stat-label">Active Learners</div>
                </div>
                <div class="ql-stat-item">
                    <div class="ql-stat-number">95%</div>
                    <div class="ql-stat-label">Concept Mastery Rate</div>
                </div>
                <div class="ql-stat-item">
                    <div class="ql-stat-number">200+</div>
                    <div class="ql-stat-label">Curated Topics</div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Testimonials Section (3 Cards)
         ===================================================================== -->
    <section class="ql-section" id="testimonials">
        <div class="ql-container">
            <div class="ql-section-header">
                <div class="ql-badge-pill">Student Success Stories</div>
                <h2 class="ql-section-title">What Students Say About QuizLearn</h2>
                <p class="ql-section-subtitle">
                    Discover how thousands of learners are transforming their study habits and exam results.
                </p>
            </div>

            <div class="ql-testimonials-grid">
                <!-- Testimonial 1 -->
                <div class="ql-testimonial-card">
                    <div>
                        <div class="ql-stars">★★★★★</div>
                        <p class="ql-testimonial-quote">
                            "QuizLearn's adaptive quizzes helped me ace my Data Structures midterms! The instant diagnostic feedback pinpointed my exact gaps in dynamic programming."
                        </p>
                    </div>
                    <div class="ql-author-info">
                        <div class="ql-author-avatar">AR</div>
                        <div>
                            <div class="ql-author-name">Alex Rivera</div>
                            <div class="ql-author-role">Stanford University &bull; CS Junior</div>
                        </div>
                    </div>
                </div>

                <!-- Testimonial 2 -->
                <div class="ql-testimonial-card">
                    <div>
                        <div class="ql-stars">★★★★★</div>
                        <p class="ql-testimonial-quote">
                            "The AI study companion is like having a private tutor sitting beside you 24/7. It explains complex database normalization until it truly clicks."
                        </p>
                    </div>
                    <div class="ql-author-info">
                        <div class="ql-author-avatar">PS</div>
                        <div>
                            <div class="ql-author-name">Priya Sharma</div>
                            <div class="ql-author-role">MIT &bull; Electrical Eng &amp; CS</div>
                        </div>
                    </div>
                </div>

                <!-- Testimonial 3 -->
                <div class="ql-testimonial-card">
                    <div>
                        <div class="ql-stars">★★★★★</div>
                        <p class="ql-testimonial-quote">
                            "The performance tracking dashboard transformed how I allocate my revision time. I raised my practice exam scores by 25% in just three weeks."
                        </p>
                    </div>
                    <div class="ql-author-info">
                        <div class="ql-author-avatar">DC</div>
                        <div>
                            <div class="ql-author-name">David Chen</div>
                            <div class="ql-author-role">Oxford University &bull; Mathematics</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Pricing Section: SIMPLE PRICING (Matches Figma: media_1792088827725.png)
         ===================================================================== -->
    <section class="ql-section" id="pricing">
        <div class="ql-container">
            <div class="ql-section-header" style="text-align: center; margin-bottom: 48px;">
                <div class="ql-pricing-eyebrow">SIMPLE PRICING</div>
                <h2 class="ql-pricing-main-title">Student-Friendly Plans</h2>
                <p class="ql-pricing-main-subtitle">
                    Choose a plan that works for your study needs. All plans include core quiz features.
                </p>
            </div>

            <div class="ql-pricing-grid-v2">
                <!-- Card 1: Basic -->
                <div class="ql-pricing-card-v2">
                    <div>
                        <h3 class="ql-v2-tier-title">Basic</h3>
                        <p class="ql-v2-tier-desc">Great for getting started with QuizLearn</p>
                        <div class="ql-v2-cost-row">
                            <span class="ql-v2-price-val">Free</span>
                            <span class="ql-v2-price-sub">/month</span>
                        </div>

                        <div class="ql-v2-placeholder-box"></div>

                        <ul class="ql-v2-features-list">
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Up to 5 quizzes per day</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>3 subject categories</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Basic score summary</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Email support</span>
                            </li>
                        </ul>
                    </div>

                    <a href="Signup.aspx" class="ql-v2-btn-outline">Start Free</a>
                </div>

                <!-- Card 2: Student Pro (Highlighted) -->
                <div class="ql-pricing-card-v2 highlighted">
                    <div>
                        <div class="ql-v2-tier-header">
                            <h3 class="ql-v2-tier-title">Student Pro</h3>
                            <span class="ql-v2-popular-badge">MOST POPULAR</span>
                        </div>
                        <p class="ql-v2-tier-desc">Best for regular practice and exam prep</p>
                        <div class="ql-v2-cost-row">
                            <span class="ql-v2-price-val">&#8377;149</span>
                            <span class="ql-v2-price-sub">/month</span>
                        </div>

                        <div class="ql-v2-placeholder-box"></div>

                        <ul class="ql-v2-features-list">
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Unlimited quizzes</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>All subject categories</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Detailed performance analytics</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>AI Learning Assistant</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Mistake review &amp; explanations</span>
                            </li>
                        </ul>
                    </div>

                    <a href="Signup.aspx" class="ql-v2-btn-solid">Get Student Pro</a>
                </div>

                <!-- Card 3: College Premium -->
                <div class="ql-pricing-card-v2">
                    <div>
                        <h3 class="ql-v2-tier-title">College Premium</h3>
                        <p class="ql-v2-tier-desc">Complete access for serious learners</p>
                        <div class="ql-v2-cost-row">
                            <span class="ql-v2-price-val">&#8377;299</span>
                            <span class="ql-v2-price-sub">/month</span>
                        </div>

                        <div class="ql-v2-placeholder-box"></div>

                        <ul class="ql-v2-features-list">
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Everything in Student Pro</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Custom quiz creation</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Class leaderboards</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Export reports as PDF</span>
                            </li>
                            <li>
                                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                                <span>Priority support</span>
                            </li>
                        </ul>
                    </div>

                    <a href="Signup.aspx" class="ql-v2-btn-outline">Get Premium</a>
                </div>
            </div>
        </div>
    </section>

    <!-- =====================================================================
         Final Call to Action (Banner)
         ===================================================================== -->
    <section class="ql-final-cta">
        <div class="ql-container">
            <div class="ql-cta-card">
                <h2 class="ql-cta-title">Ready to Master Your Skills?</h2>
                <p class="ql-cta-desc">
                    Join thousands of students mastering their subjects with adaptive quizzes, real-time analytics, and instant feedback.
                </p>
                <a href="#pricing" class="ql-btn ql-btn-primary">Start Learning Free</a>
            </div>
        </div>
    </section>

</asp:Content>
