/**
 * PrimeX - Light Theme
 * Light Theme Only Implementation
 */

document.addEventListener('DOMContentLoaded', function() {
    // Always use light theme
    document.body.classList.remove('dark-theme');
    localStorage.setItem('theme', 'light');
}); 