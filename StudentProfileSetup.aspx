<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentProfileSetup.aspx.cs" Inherits="website.StudentProfileSetup" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Profile Setup - QuizLearn</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Stylesheets -->
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/StudentPortal.css" rel="stylesheet" type="text/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body class="ql-onboard-body">
    <!-- Top Ambient Glow -->
    <div class="ql-glow-top"></div>

    <form id="formProfileSetup" runat="server">
        <!-- Onboarding Top Header -->
        <header class="ql-onboard-header">
            <a href="Default.aspx" class="ql-onboard-brand" title="QuizLearn Home">
                <div class="ql-onboard-logo-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                    </svg>
                </div>
                <span class="ql-onboard-brand-text">QuizLearn</span>
            </a>

            <div class="ql-onboard-breadcrumb">
                <span class="tag-onboarding">ONBOARDING</span>
                <span class="divider">/</span>
                <span class="tag-current">Profile Setup</span>
            </div>
        </header>

        <!-- Main Onboarding Content -->
        <main class="ql-onboard-content">
            <!-- Step Badge -->
            <div class="ql-step-pill">STEP 1 OF 1</div>

            <h1 class="ql-onboard-heading">Tell us about yourself</h1>
            <p class="ql-onboard-subheading">Help us personalize your QuizLearn experience.</p>

            <!-- Card Container -->
            <div class="ql-onboard-card">
                <!-- Validation Alert -->
                <div id="validationAlert" class="ql-validation-alert" role="alert">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="8" x2="12" y2="12"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16"></line>
                    </svg>
                    <span id="validationAlertText">Please select at least 3 subjects to continue.</span>
                </div>

                <!-- Form Row 1: Education Level & College / School -->
                <div class="ql-form-row">
                    <div class="ql-field-group">
                        <label class="ql-field-label" for="ddlEducationLevel">Education Level</label>
                        <div class="ql-select-wrapper">
                            <select id="ddlEducationLevel" class="ql-field-select" runat="server">
                                <option value="" selected="selected">Select level</option>
                                <option value="Undergraduate">Undergraduate (B.Tech / B.E. / BCA / B.Sc)</option>
                                <option value="Postgraduate">Postgraduate (M.Tech / MCA / M.Sc)</option>
                                <option value="High School">High School (11th - 12th)</option>
                                <option value="Diploma">Diploma / Polytechnic</option>
                                <option value="Self-Taught">Self-Taught / Professional</option>
                            </select>
                            <span class="ql-select-arrow">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>

                    <div class="ql-field-group">
                        <label class="ql-field-label" for="txtCollegeSchool">College / School</label>
                        <asp:TextBox ID="txtCollegeSchool" runat="server" CssClass="ql-field-input" placeholder="Enter your college or school" MaxLength="150" />
                    </div>
                </div>

                <!-- Form Row 2: Course / Branch & Year / Semester -->
                <div class="ql-form-row">
                    <div class="ql-field-group">
                        <label class="ql-field-label" for="ddlCourse">Course / Branch</label>
                        <div class="ql-select-wrapper">
                            <select id="ddlCourse" class="ql-field-select" runat="server">
                                <option value="" selected="selected">Select course</option>
                                <option value="Computer Science">Computer Science & Engineering</option>
                                <option value="Information Technology">Information Technology</option>
                                <option value="Data Science & AI">Data Science & Artificial Intelligence</option>
                                <option value="Electronics & Communication">Electronics & Communication</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                <option value="Other">Other Science & Tech</option>
                            </select>
                            <span class="ql-select-arrow">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>

                    <div class="ql-field-group">
                        <label class="ql-field-label" for="ddlYearSemester">Year / Semester</label>
                        <div class="ql-select-wrapper">
                            <select id="ddlYearSemester" class="ql-field-select" runat="server">
                                <option value="" selected="selected">Select year</option>
                                <option value="1st Year">1st Year (Semester 1-2)</option>
                                <option value="2nd Year">2nd Year (Semester 3-4)</option>
                                <option value="3rd Year">3rd Year (Semester 5-6)</option>
                                <option value="4th Year">4th Year (Semester 7-8)</option>
                                <option value="Final Prep / Graduated">Final Prep / Graduated</option>
                            </select>
                            <span class="ql-select-arrow">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="6 9 12 15 18 9"></polyline>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Subjects Selection Section -->
                <div class="ql-subjects-section">
                    <h3 class="ql-subjects-title">What subjects do you want to learn?</h3>
                    <p class="ql-subjects-subtitle">Select at least 3 subjects to get started.</p>

                    <!-- Hidden input to hold comma-separated selected subjects -->
                    <input type="hidden" id="hdnSelectedSubjects" name="hdnSelectedSubjects" value="Data Structures,Algorithms,Web Development,Machine Learning" />

                    <div class="ql-chips-container" id="subjectsChipsContainer">
                        <!-- Chips matching reference screenshot -->
                        <button type="button" class="ql-subject-chip selected" data-subject="Data Structures">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Data Structures</span>
                        </button>

                        <button type="button" class="ql-subject-chip selected" data-subject="Algorithms">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Algorithms</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Database Systems">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Database Systems</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Operating Systems">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Operating Systems</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Computer Networks">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Computer Networks</span>
                        </button>

                        <button type="button" class="ql-subject-chip selected" data-subject="Web Development">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Web Development</span>
                        </button>

                        <button type="button" class="ql-subject-chip selected" data-subject="Machine Learning">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Machine Learning</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Discrete Mathematics">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Discrete Mathematics</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Software Engineering">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Software Engineering</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Cloud Computing">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Cloud Computing</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Cybersecurity">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Cybersecurity</span>
                        </button>

                        <button type="button" class="ql-subject-chip" data-subject="Digital Electronics">
                            <span class="chip-check">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3">
                                    <polyline points="20 6 9 17 4 12"></polyline>
                                </svg>
                            </span>
                            <span>Digital Electronics</span>
                        </button>
                    </div>
                </div>

                <!-- Continue Button -->
                <button type="button" id="btnContinue" class="ql-btn-continue">
                    <span>Continue to Dashboard</span>
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>

                <!-- Skip Link -->
                <div class="ql-onboard-skip-wrap">
                    <a href="StudentDashboard.aspx" class="ql-onboard-skip" id="btnSkipForNow">Skip for now</a>
                </div>
            </div>
        </main>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const chips = document.querySelectorAll('.ql-subject-chip');
            const hdnSelectedSubjects = document.getElementById('hdnSelectedSubjects');
            const btnContinue = document.getElementById('btnContinue');
            const validationAlert = document.getElementById('validationAlert');
            const validationAlertText = document.getElementById('validationAlertText');
            const ddlEducationLevel = document.getElementById('<%= ddlEducationLevel.ClientID %>');
            const txtCollegeSchool = document.getElementById('<%= txtCollegeSchool.ClientID %>');
            const ddlCourse = document.getElementById('<%= ddlCourse.ClientID %>');
            const ddlYearSemester = document.getElementById('<%= ddlYearSemester.ClientID %>');

            // Load saved profile from localStorage if exists
            try {
                const savedProfileRaw = localStorage.getItem('ql_student_profile');
                if (savedProfileRaw) {
                    const saved = JSON.parse(savedProfileRaw);
                    if (saved.educationLevel && ddlEducationLevel) ddlEducationLevel.value = saved.educationLevel;
                    if (saved.collegeSchool && txtCollegeSchool) txtCollegeSchool.value = saved.collegeSchool;
                    if (saved.course && ddlCourse) ddlCourse.value = saved.course;
                    if (saved.yearSemester && ddlYearSemester) ddlYearSemester.value = saved.yearSemester;

                    if (Array.isArray(saved.subjects) && saved.subjects.length > 0) {
                        chips.forEach(chip => {
                            const sub = chip.getAttribute('data-subject');
                            if (saved.subjects.includes(sub)) {
                                chip.classList.add('selected');
                            } else {
                                chip.classList.remove('selected');
                            }
                        });
                        updateHiddenSubjectList();
                    }
                }
            } catch (err) {
                console.warn('Could not read existing profile from localStorage', err);
            }

            // Subject Chip Click Handler
            chips.forEach(chip => {
                chip.addEventListener('click', function (e) {
                    e.preventDefault();
                    this.classList.toggle('selected');
                    updateHiddenSubjectList();
                    hideValidationAlert();
                });
            });

            function getSelectedSubjects() {
                const selected = [];
                document.querySelectorAll('.ql-subject-chip.selected').forEach(c => {
                    selected.push(c.getAttribute('data-subject'));
                });
                return selected;
            }

            function updateHiddenSubjectList() {
                const selected = getSelectedSubjects();
                hdnSelectedSubjects.value = selected.join(',');
            }

            function showValidationAlert(message) {
                validationAlertText.textContent = message;
                validationAlert.classList.add('visible');
                validationAlert.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
            }

            function hideValidationAlert() {
                validationAlert.classList.remove('visible');
            }

            // Frontend Continue Validation and Storage
            btnContinue.addEventListener('click', function (e) {
                e.preventDefault();
                hideValidationAlert();

                const educationLevel = ddlEducationLevel ? ddlEducationLevel.value : '';
                const collegeSchool = txtCollegeSchool ? txtCollegeSchool.value.trim() : '';
                const course = ddlCourse ? ddlCourse.value : '';
                const yearSemester = ddlYearSemester ? ddlYearSemester.value : '';
                const selectedSubjects = getSelectedSubjects();

                // Validate minimum subjects selection
                if (selectedSubjects.length < 3) {
                    showValidationAlert('Please select at least 3 subjects to personalize your QuizLearn experience.');
                    return;
                }

                // Friendly warning if empty fields, but allow continuing
                if (!educationLevel || !collegeSchool || !course || !yearSemester) {
                    if (!confirm('Some education details are unselected. Would you like to proceed with your selected subjects?')) {
                        return;
                    }
                }

                // Package prototype profile into client-side storage
                const studentProfile = {
                    educationLevel: educationLevel || 'Undergraduate',
                    collegeSchool: collegeSchool || 'Institute of Technology',
                    course: course || 'Computer Science',
                    yearSemester: yearSemester || '2nd Year',
                    subjects: selectedSubjects,
                    configuredAt: new Date().toISOString(),
                    isDemoProfile: true
                };

                try {
                    localStorage.setItem('ql_student_profile', JSON.stringify(studentProfile));
                    sessionStorage.setItem('ql_student_profile', JSON.stringify(studentProfile));
                } catch (err) {
                    console.warn('Storage error:', err);
                }

                // Redirect to Student Dashboard
                window.location.href = 'StudentDashboard.aspx';
            });
        });
    </script>
</body>
</html>
