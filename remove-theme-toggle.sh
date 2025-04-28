#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# Remove the theme toggle button from all HTML files
for file in *.html; do
    # Remove the theme toggle button
    sed -i '' '/<button id="theme-toggle" class="theme-toggle" aria-label="Toggle dark mode">/,/<\/button>/d' "$file"
    
    # Fix any spacing issues that might be left after removal
    sed -i '' 's/<\/ul>[[:space:]]*<div/<\/ul>\n                <div/g' "$file"
    
    # Remove the theme-toggle.js script reference
    sed -i '' '/<script src="js\/theme-toggle.js"><\/script>/d' "$file"
done

# Remove the service pages as well
for file in service-*.html; do
    # Remove the theme toggle button
    sed -i '' '/<button id="theme-toggle" class="theme-toggle" aria-label="Toggle dark mode">/,/<\/button>/d' "$file"
    
    # Fix any spacing issues that might be left after removal
    sed -i '' 's/<\/ul>[[:space:]]*<div/<\/ul>\n                <div/g' "$file"
    
    # Remove any inline theme toggle JavaScript
    sed -i '' '/\/\/ Dark Mode Toggle/,/});/d' "$file"
    
    # Remove the theme-toggle.js script reference
    sed -i '' '/<script src="js\/theme-toggle.js"><\/script>/d' "$file"
done

echo "Theme toggle functionality has been removed from all HTML files!" 