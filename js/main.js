/**
 * PrimeX - Main JavaScript File
 * Enhanced with micro-animations and modern interactions
 */

document.addEventListener('DOMContentLoaded', function() {
    
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu');
    const navMenu = document.querySelector('nav ul');
    
    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            // Close menu when clicking outside
            document.addEventListener('click', function(event) {
                if (!event.target.closest('nav') && navMenu.classList.contains('active')) {
                    navMenu.classList.remove('active');
                }
            });
        });
    }
    
    // Close menu when clicking a link
    const navLinks = document.querySelectorAll('nav ul li a');
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            navMenu.classList.remove('active');
        });
    });
    
    // Scroll animation for elements
    const scrollElements = document.querySelectorAll('.scroll-animation');
    
    const elementInView = (el, percentageScroll = 100) => {
        const elementTop = el.getBoundingClientRect().top;
        return (
            elementTop <= 
            ((window.innerHeight || document.documentElement.clientHeight) * (percentageScroll/100))
        );
    };
    
    const displayScrollElement = (element) => {
        element.classList.add('scrolled');
    };
    
    const hideScrollElement = (element) => {
        element.classList.remove('scrolled');
    };
    
    const handleScrollAnimation = () => {
        scrollElements.forEach((el) => {
            if (elementInView(el, 80)) {
                displayScrollElement(el);
            } else {
                hideScrollElement(el);
            }
        });
    };
    
    // Initialize animation check
    handleScrollAnimation();
    
    // Add event listener
    window.addEventListener('scroll', () => {
        handleScrollAnimation();
    });
    
    // Testimonial carousel
    const testimonials = document.querySelectorAll('.testimonial-item');
    const prevBtn = document.querySelector('.testimonial-prev');
    const nextBtn = document.querySelector('.testimonial-next');
    let currentIndex = 0;
    
    if (testimonials.length > 0) {
        // Show first testimonial
        testimonials[0].classList.add('active');
        
        const showTestimonial = (index) => {
            testimonials.forEach(item => {
                item.classList.remove('active');
            });
            testimonials[index].classList.add('active');
        };
        
        const nextTestimonial = () => {
            currentIndex = (currentIndex + 1) % testimonials.length;
            showTestimonial(currentIndex);
        };
        
        const prevTestimonial = () => {
            currentIndex = (currentIndex - 1 + testimonials.length) % testimonials.length;
            showTestimonial(currentIndex);
        };
        
        if (nextBtn) {
            nextBtn.addEventListener('click', nextTestimonial);
        }
        
        if (prevBtn) {
            prevBtn.addEventListener('click', prevTestimonial);
        }
        
        // Auto advance every 5 seconds
        setInterval(nextTestimonial, 5000);
    }
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
                
                // If mobile menu is open, close it
                if (mobileMenu && mobileMenu.classList.contains('active')) {
                    mobileMenuBtn.click();
                }
            }
        });
    });
    
    // Tab navigation for product details
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');
    
    if (tabButtons.length > 0) {
        tabButtons.forEach(button => {
            button.addEventListener('click', () => {
                const targetTab = button.getAttribute('data-tab');
                
                // Remove active class from all buttons and content
                tabButtons.forEach(btn => btn.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));
                
                // Add active class to current button and content
                button.classList.add('active');
                document.getElementById(targetTab).classList.add('active');
            });
        });
        
        // Check if hash exists in URL
        const checkHash = () => {
            if (window.location.hash) {
                const hash = window.location.hash.substring(1);
                const tabButton = document.querySelector(`.tab-btn[data-tab="${hash}"]`);
                
                if (tabButton) {
                    tabButton.click();
                    
                    // Scroll to tabs section with a slight delay
                    setTimeout(() => {
                        const tabsSection = document.querySelector('.product-tabs');
                        if (tabsSection) {
                            window.scrollTo({
                                top: tabsSection.offsetTop - 80,
                                behavior: 'smooth'
                            });
                        }
                    }, 100);
                }
            }
        };
        
        // Check hash on page load
        checkHash();
        
        // Listen for hash changes
        window.addEventListener('hashchange', checkHash);
    }
    
    // Product image gallery
    const mainImage = document.querySelector('.product-main-image img');
    const thumbnails = document.querySelectorAll('.product-thumbnail');
    
    if (mainImage && thumbnails.length > 0) {
        thumbnails.forEach(thumb => {
            thumb.addEventListener('click', function() {
                // Update main image src
                const newSrc = this.querySelector('img').getAttribute('src');
                mainImage.setAttribute('src', newSrc);
                
                // Update active class
                thumbnails.forEach(t => t.classList.remove('active'));
                this.classList.add('active');
                
                // Add animation effect
                mainImage.classList.add('image-change');
                setTimeout(() => {
                    mainImage.classList.remove('image-change');
                }, 500);
            });
        });
    }
    
    // Button hover animation
    const buttons = document.querySelectorAll('.btn');
    
    if (buttons.length > 0) {
        buttons.forEach(button => {
            button.addEventListener('mouseenter', function(e) {
                const x = e.clientX - button.getBoundingClientRect().left;
                const y = e.clientY - button.getBoundingClientRect().top;
                
                const ripple = document.createElement('span');
                ripple.classList.add('btn-ripple');
                ripple.style.left = `${x}px`;
                ripple.style.top = `${y}px`;
                
                button.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });
    }
    
    // Contact form handling
    const contactForm = document.getElementById('contactForm');
    
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form values and trim whitespace
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone') ? document.getElementById('phone').value.trim() : '';
            const subject = document.getElementById('subject').value.trim();
            const message = document.getElementById('message').value.trim();
            
            // Simple validation
            if (!name || !email || !subject || !message) {
                alert('Please fill in all required fields.');
                return;
            }
            
            // Simulated form submission (replace with actual form submission)
            console.log('Form submitted:', { name, email, phone, subject, message });
            
            // Show success message
            const formContainer = contactForm.parentElement;
            const successMessage = document.createElement('div');
            successMessage.classList.add('form-success');
            successMessage.innerHTML = `
                <i class="fas fa-check-circle"></i>
                <h3>Thank you for your message!</h3>
                <p>We've received your inquiry and will get back to you shortly.</p>
            `;
            
            // Hide form and show success message
            contactForm.style.display = 'none';
            formContainer.appendChild(successMessage);
            
            // Optional: Reset form
            contactForm.reset();
            
            // Optional: Redirect after delay
            // setTimeout(() => {
            //     window.location.href = 'index.html';
            // }, 3000);
        });
    }
    
    // FAQ Accordion
    const faqItems = document.querySelectorAll('.faq-item');
    
    if (faqItems.length > 0) {
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            
            if (question) {
                question.addEventListener('click', () => {
                    const currentlyActive = document.querySelector('.faq-item.active');
                    
                    // If there's an active item and it's not the one clicked, close it
                    if (currentlyActive && currentlyActive !== item) {
                        currentlyActive.classList.remove('active');
                    }
                    
                    // Toggle the active class on the clicked item
                    item.classList.toggle('active');
                });
            }
        });
    }
    
    // Add CSS class for animations
    document.body.classList.add('js-loaded');
}); 