#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# Fix duplicate overlays and remove inline padding
for file in *.html service-*.html; do
    # Remove the inline padding style from hero sections
    sed -i '' 's/class="hero" style="background-image: \([^;]*\); background-size: \([^;]*\); background-position: \([^;]*\); position: \([^;]*\); color: \([^;]*\); padding: [0-9]*px [0-9]*px;/class="hero" style="background-image: \1; background-size: \2; background-position: \3; position: \4; color: \5;/g' "$file"
    
    # Look for and remove duplicate dark overlay divs
    sed -i '' '/<section class="hero"/,/<div class="container"/s/<!-- Dark overlay for better text readability -->\s*<!-- Dark overlay for better text readability -->/<!-- Dark overlay for better text readability -->/g' "$file"
    
    # Find and remove any duplicate overlay divs
    sed -i '' '/<section class="hero"/,/<div class="container"/s/<div style="position: absolute;[^>]*><\/div>\s*<div style="position: absolute;[^>]*><\/div>/<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6);"><\/div>/g' "$file"

    # Standardize the overlay color to match homepage
    sed -i '' '/<section class="hero"/,/<div class="container"/s/<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba\([^)]*\));"/<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6);"/g' "$file"
done

echo "Hero section fixes applied!" 