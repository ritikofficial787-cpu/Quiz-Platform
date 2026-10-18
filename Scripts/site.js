/**
 * QuizLearn - Client-Side Interactive Logic
 * Vanilla JavaScript implementation for interactive demo features
 */

document.addEventListener('DOMContentLoaded', function () {
    initQuizShowcase();
    initSmoothScroll();
    initMobileNav();
    initPricingInteractions();
});

/**
 * Interactive Quiz Preview Showcase
 * Allows visitors to click options and experience immediate diagnostic feedback.
 */
function initQuizShowcase() {
    const optionItems = document.querySelectorAll('.ql-option-item');
    const feedbackBox = document.getElementById('quizFeedbackBox');
    const resetBtn = document.getElementById('btnResetQuiz');
    const sidebarItems = document.querySelectorAll('.ql-sidebar-item');

    if (!optionItems.length) return;

    // Quiz questions dataset for interactive preview
    const sampleQuestions = {
        algorithms: {
            category: "QUESTION 4 OF 10 • ALGORITHMS & COMPLEXITY",
            question: "Which of the following sorting algorithms guarantees O(n log n) time complexity in the worst case and is not in-place without extra memory overhead?",
            options: [
                { id: "A", text: "Quick Sort (partition-based divide and conquer)", isCorrect: false, explanation: "Quick Sort has a worst-case time complexity of O(n²) when bad pivots are chosen, though it operates in-place." },
                { id: "B", text: "Merge Sort (divide-and-conquer with auxiliary array)", isCorrect: true, explanation: "Merge Sort consistently guarantees O(n log n) across best, average, and worst cases, requiring O(n) auxiliary memory." },
                { id: "C", text: "Bubble Sort (nested comparison passes)", isCorrect: false, explanation: "Bubble Sort has an O(n²) worst-case time complexity and is in-place." },
                { id: "D", text: "Heap Sort (binary heap tree structure)", isCorrect: false, explanation: "Heap Sort guarantees O(n log n) in the worst case, but it is an in-place algorithm (O(1) extra auxiliary space)." }
            ]
        },
        datastructures: {
            category: "QUESTION 2 OF 8 • DATA STRUCTURES",
            question: "What is the worst-case lookup time in a balanced Binary Search Tree (AVL or Red-Black Tree) with n elements?",
            options: [
                { id: "A", text: "O(1) constant time", isCorrect: false, explanation: "Hash tables offer average O(1) lookups, but balanced BSTs require logarithmic comparisons." },
                { id: "B", text: "O(log n) logarithmic time", isCorrect: true, explanation: "Because self-balancing trees maintain height h <= 1.44 log₂(n), searches always complete in O(log n) time." },
                { id: "C", text: "O(n) linear time", isCorrect: false, explanation: "Unbalanced BSTs can degenerate to O(n) linked lists, but balanced trees strictly avoid this." },
                { id: "D", text: "O(n log n) time", isCorrect: false, explanation: "O(n log n) is common for comparison sorts, not single element lookups." }
            ]
        },
        webdev: {
            category: "QUESTION 1 OF 6 • WEB DEVELOPMENT",
            question: "In standard ASP.NET Web Forms architecture, which event in the page lifecycle occurs first when a request arrives?",
            options: [
                { id: "A", text: "Page_Load event", isCorrect: false, explanation: "Page_Load occurs after PreInit, Init, and InitComplete have finished." },
                { id: "B", text: "Page_PreInit event", isCorrect: true, explanation: "Page_PreInit is the entry event in the lifecycle where themes and master pages are dynamically set." },
                { id: "C", text: "Control Event Handlers (e.g., Button_Click)", isCorrect: false, explanation: "Control events are raised after Page_Load completes." },
                { id: "D", text: "Page_Render event", isCorrect: false, explanation: "Render occurs at the end of the lifecycle right before Unload." }
            ]
        }
    };

    let currentTopic = 'algorithms';

    // Click handler for quiz options
    optionItems.forEach(item => {
        item.addEventListener('click', function () {
            const isCorrect = this.getAttribute('data-correct') === 'true';
            const feedbackText = this.getAttribute('data-explanation');

            // Reset all options
            optionItems.forEach(opt => {
                opt.classList.remove('state-correct', 'state-incorrect');
                const iconContainer = opt.querySelector('.ql-option-icon');
                if (iconContainer) iconContainer.innerHTML = '';
            });

            // Mark clicked option
            if (isCorrect) {
                this.classList.add('state-correct');
                const icon = this.querySelector('.ql-option-icon');
                if (icon) {
                    icon.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="#10B981"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>';
                }
                if (feedbackBox) {
                    feedbackBox.style.display = 'block';
                    feedbackBox.style.borderLeftColor = '#10B981';
                    feedbackBox.innerHTML = `<strong>Correct!</strong> ${feedbackText}`;
                }
            } else {
                this.classList.add('state-incorrect');
                const icon = this.querySelector('.ql-option-icon');
                if (icon) {
                    icon.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="#EF4444"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>';
                }
                // Highlight the correct answer alongside
                const correctOpt = document.querySelector('.ql-option-item[data-correct="true"]');
                if (correctOpt) {
                    correctOpt.classList.add('state-correct');
                    const cIcon = correctOpt.querySelector('.ql-option-icon');
                    if (cIcon) {
                        cIcon.innerHTML = '<svg width="18" height="18" viewBox="0 0 24 24" fill="#10B981"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>';
                    }
                }
                if (feedbackBox) {
                    feedbackBox.style.display = 'block';
                    feedbackBox.style.borderLeftColor = '#EF4444';
                    feedbackBox.innerHTML = `<strong>Diagnostic Hint:</strong> ${feedbackText}`;
                }
            }
        });
    });

    // Reset button
    if (resetBtn) {
        resetBtn.addEventListener('click', function (e) {
            e.preventDefault();
            resetQuizState();
        });
    }

    function resetQuizState() {
        optionItems.forEach(opt => {
            opt.classList.remove('state-correct', 'state-incorrect');
            const icon = opt.querySelector('.ql-option-icon');
            if (icon) icon.innerHTML = '';
        });
        if (feedbackBox) {
            feedbackBox.style.display = 'none';
        }
    }

    // Sidebar topic selector
    sidebarItems.forEach(item => {
        item.addEventListener('click', function () {
            const topicKey = this.getAttribute('data-topic');
            if (topicKey && sampleQuestions[topicKey]) {
                sidebarItems.forEach(s => s.classList.remove('active'));
                this.classList.add('active');
                currentTopic = topicKey;
                loadQuestion(sampleQuestions[topicKey]);
            }
        });
    });

    function loadQuestion(data) {
        const metaEl = document.getElementById('quizQuestionMeta');
        const titleEl = document.getElementById('quizQuestionText');
        const container = document.getElementById('quizOptionsContainer');

        if (metaEl) metaEl.textContent = data.category;
        if (titleEl) titleEl.textContent = data.question;

        if (container) {
            container.innerHTML = '';
            data.options.forEach(opt => {
                const optEl = document.createElement('div');
                optEl.className = 'ql-option-item';
                optEl.setAttribute('data-correct', opt.isCorrect ? 'true' : 'false');
                optEl.setAttribute('data-explanation', opt.explanation);
                optEl.innerHTML = `
                    <div class="ql-option-left">
                        <span class="ql-option-indicator">${opt.id}</span>
                        <span>${opt.text}</span>
                    </div>
                    <span class="ql-option-icon"></span>
                `;
                container.appendChild(optEl);
            });
            // Re-bind listeners for newly rendered options
            initQuizShowcase();
        }
        resetQuizState();
    }
}

/**
 * Smooth scrolling for navigation anchor links and Watch Live Demo button
 */
function initSmoothScroll() {
    const demoBtn = document.getElementById('btnWatchDemo');
    const quizCard = document.getElementById('quizShowcase');

    if (demoBtn && quizCard) {
        demoBtn.addEventListener('click', function (e) {
            e.preventDefault();
            quizCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
            quizCard.classList.remove('pulse-highlight');
            // Re-trigger animation
            void quizCard.offsetWidth;
            quizCard.classList.add('pulse-highlight');
        });
    }

    // Anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            if (targetId && targetId !== '#') {
                const targetEl = document.querySelector(targetId);
                if (targetEl) {
                    e.preventDefault();
                    targetEl.scrollIntoView({ behavior: 'smooth' });
                }
            }
        });
    });
}

/**
 * Mobile navigation toggle
 */
function initMobileNav() {
    const toggleBtn = document.getElementById('navbarToggleBtn');
    const mobileMenu = document.getElementById('mobileNavMenu');

    if (toggleBtn && mobileMenu) {
        toggleBtn.addEventListener('click', function () {
            const isVisible = mobileMenu.style.display === 'flex';
            mobileMenu.style.display = isVisible ? 'none' : 'flex';
        });

        // Close when clicking mobile links
        mobileMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function () {
                mobileMenu.style.display = 'none';
            });
        });
    }
}

/**
 * Interactive Feedback Toast for pricing plans and future features
 */
function initPricingInteractions() {
    const pricingButtons = document.querySelectorAll('.ql-pricing-action');
    const toast = document.getElementById('qlToast');

    pricingButtons.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const planName = this.getAttribute('data-plan') || 'plan';
            showToast(`Selected ${planName}! (Frontend Demo — user accounts and subscriptions will connect in the next phase)`);
        });
    });

    window.showToast = function (msg) {
        if (!toast) return;
        toast.textContent = msg;
        toast.classList.add('show');
        setTimeout(function () {
            toast.classList.remove('show');
        }, 3500);
    };
}
