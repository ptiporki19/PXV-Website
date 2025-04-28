/**
 * PrimeX - Theme Toggle
 * Dark/Light Theme Toggle Functionality
 */

document.addEventListener('DOMContentLoaded', function() {
    // Check for saved theme preference or use prefers-color-scheme
    const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
    const currentTheme = localStorage.getItem('theme');
    
    // Initialize theme based on saved preference or system preference
    if (currentTheme === 'dark' || (!currentTheme && prefersDarkScheme.matches)) {
        document.body.classList.add('dark-theme');
        if (document.getElementById('theme-toggle-icon')) {
            document.getElementById('theme-toggle-icon').classList.remove('fa-moon');
            document.getElementById('theme-toggle-icon').classList.add('fa-sun');
        }
    } else {
        document.body.classList.remove('dark-theme');
        if (document.getElementById('theme-toggle-icon')) {
            document.getElementById('theme-toggle-icon').classList.remove('fa-sun');
            document.getElementById('theme-toggle-icon').classList.add('fa-moon');
        }
    }
    
    // Toggle theme when button is clicked
    const themeToggle = document.getElementById('theme-toggle');
    if (themeToggle) {
        themeToggle.addEventListener('click', function() {
            // Toggle dark class on body
            document.body.classList.toggle('dark-theme');
            
            // Update the icon
            const themeIcon = document.getElementById('theme-toggle-icon');
            if (themeIcon) {
                themeIcon.classList.toggle('fa-moon');
                themeIcon.classList.toggle('fa-sun');
            }
            
            // Save preference to localStorage
            if (document.body.classList.contains('dark-theme')) {
                localStorage.setItem('theme', 'dark');
            } else {
                localStorage.setItem('theme', 'light');
            }
        });
    }
    
    // Listen for system preference changes
    prefersDarkScheme.addEventListener('change', e => {
        if (!localStorage.getItem('theme')) {
            if (e.matches) {
                document.body.classList.add('dark-theme');
                if (document.getElementById('theme-toggle-icon')) {
                    document.getElementById('theme-toggle-icon').classList.remove('fa-moon');
                    document.getElementById('theme-toggle-icon').classList.add('fa-sun');
                }
            } else {
                document.body.classList.remove('dark-theme');
                if (document.getElementById('theme-toggle-icon')) {
                    document.getElementById('theme-toggle-icon').classList.remove('fa-sun');
                    document.getElementById('theme-toggle-icon').classList.add('fa-moon');
                }
            }
        }
    });
}); 