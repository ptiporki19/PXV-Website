#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# Add the theme toggle button to all HTML files in the navigation area
# This looks for the pattern where navigation ends and mobile-menu-btn begins
for file in *.html; do
    # Skip service-content.html as we've already modified it
    if [ "$file" != "service-content.html" ]; then
        # Add the theme toggle button before the mobile-menu-btn div
        sed -i.bak '/<div class="mobile-menu-btn">/i \
                <button id="theme-toggle" class="theme-toggle" aria-label="Toggle dark mode">\
                    <i id="theme-toggle-icon" class="fas fa-moon"><\/i>\
                <\/button>' "$file"
        
        # Add the theme-toggle.js script before the closing body tag
        sed -i.bak '/<script src="js\/main.js"><\/script>/a \
    <script src="js\/theme-toggle.js"><\/script>' "$file"
        
        # Only keep the last backup
        rm -f "$file.bak"
    fi
done

echo "Dark theme toggle functionality has been added to all HTML files!" 