// EmailJS configuration for contact form
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contact-form');
    
    if (contactForm) {
        // Initialize EmailJS with your public key
        emailjs.init("OEEQiRc8BvpWqMPla");
        
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Show loading state
            const submitButton = contactForm.querySelector('button[type="submit"]');
            const originalButtonText = submitButton.textContent;
            submitButton.disabled = true;
            submitButton.textContent = "Sending...";
            
            // Get form values
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone') ? document.getElementById('phone').value.trim() : '';
            const subject = document.getElementById('subject').value.trim();
            const message = document.getElementById('message').value.trim();
            
            // Simple validation
            if (!name || !email || !subject || !message) {
                alert('Please fill in all required fields.');
                submitButton.disabled = false;
                submitButton.textContent = originalButtonText;
                return;
            }
            
            // Prepare template parameters for EmailJS
            const templateParams = {
                from_name: name,
                reply_to: email,
                phone_number: phone,
                subject: subject,
                message: message
            };
            
            // Send email using EmailJS - main notification to site owner
            emailjs.send('service_8ni9hlj', 'template_7wm7yde', templateParams)
                .then(function(response) {
                    console.log('Main email sent successfully!', response);
                    
                    // Send auto-reply email to the client
                    return emailjs.send('service_8ni9hlj', 'template_7fa5pqo', templateParams);
                })
                .then(function(response) {
                    console.log('Auto-reply email sent successfully!', response);
                    
                    // Show success message
                    const formContainer = contactForm.parentElement;
                    const successMessage = document.createElement('div');
                    successMessage.classList.add('form-success');
                    successMessage.innerHTML = `
                        <i class="fas fa-check-circle"></i>
                        <h3>Thank you for your message!</h3>
                        <p>We've received your inquiry and will get back to you shortly. A confirmation email has been sent to your inbox.</p>
                    `;
                    
                    // Hide form and show success message
                    contactForm.style.display = 'none';
                    formContainer.appendChild(successMessage);
                    
                    // Reset form
                    contactForm.reset();
                })
                .catch(function(error) {
                    console.error('Error sending email:', error);
                    alert('Sorry, there was an error sending your message. Please try again or contact us directly at info@primexvanguard.com');
                    submitButton.disabled = false;
                    submitButton.textContent = originalButtonText;
                });
        });
    }
}); 