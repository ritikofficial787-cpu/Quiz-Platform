/**
 * QuizLearn Authentication Page Helper Script
 * Handles password visibility toggles, OAuth tooltip alerts, and UI helpers.
 */

document.addEventListener('DOMContentLoaded', function () {
    // Add auth-page class to body so Site.Master navbar/footer are hidden
    document.body.classList.add('auth-page');

    initPasswordToggles();
    initOAuthButtons();
});

function initPasswordToggles() {
    const toggleButtons = document.querySelectorAll('.ql-password-toggle-btn');

    toggleButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            const targetInputId = this.getAttribute('data-target');
            if (!targetInputId) return;

            const input = document.getElementById(targetInputId);
            if (!input) return;

            const isPassword = input.type === 'password';
            input.type = isPassword ? 'text' : 'password';

            // Toggle eye icon
            if (isPassword) {
                // Eye slash icon (hide)
                this.innerHTML = `
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
                        <line x1="1" y1="1" x2="23" y2="23"/>
                    </svg>`;
                this.setAttribute('aria-label', 'Hide password');
            } else {
                // Eye open icon (show)
                this.innerHTML = `
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                        <circle cx="12" cy="12" r="3"/>
                    </svg>`;
                this.setAttribute('aria-label', 'Show password');
            }
        });
    });
}

function initOAuthButtons() {
    const oauthBtns = document.querySelectorAll('.ql-btn-social');
    oauthBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const provider = this.getAttribute('data-provider') || 'OAuth';
            alert(`${provider} authentication will be integrated in the production phase.`);
        });
    });
}

// Store admin or student profile in storage upon successful credentials match
document.addEventListener('DOMContentLoaded', function () {
    const loginBtn = document.querySelector('.ql-btn-auth-primary');
    if (loginBtn) {
        loginBtn.addEventListener('click', function () {
            const emailInput = document.querySelector('input[type="email"]');
            const passInput = document.querySelector('input[type="password"]');
            if (emailInput && passInput) {
                const em = emailInput.value.trim().toLowerCase();
                const pw = passInput.value;
                if (em === 'ritik@gmail.com' && pw === '123456') {
                    localStorage.setItem('ql_admin_auth', JSON.stringify({
                        email: 'Ritik@gmail.com',
                        name: 'Admin',
                        avatar: 'A',
                        role: 'Admin'
                    }));
                } else if (em === 'abc@gmail.com' && pw === '123456') {
                    localStorage.setItem('ql_student_profile', JSON.stringify({
                        fullName: 'Learner',
                        email: 'abc@gmail.com',
                        educationLevel: 'Undergraduate',
                        targetExam: 'Competitive Exam / Placement',
                        difficulty: 'Intermediate',
                        subjects: ['Data Structures', 'Algorithms', 'Web Development', 'Computer Networks']
                    }));
                }
            }
        });
    }
});
