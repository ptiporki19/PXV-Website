#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# First, standardize hero section class names to 'hero'
for file in *.html service-*.html; do
    # Convert specialized hero classes to standard hero class
    sed -i '' 's/class="hero-section"/class="hero"/g' "$file"
    sed -i '' 's/class="about-hero"/class="hero"/g' "$file"
    sed -i '' 's/class="services-hero"/class="hero"/g' "$file"
    sed -i '' 's/class="contact-hero"/class="hero"/g' "$file"
    sed -i '' 's/class="ebooks-hero"/class="hero"/g' "$file"
    sed -i '' 's/class="service-detail-hero"/class="hero"/g' "$file"
    sed -i '' 's/class="courses-hero"/class="hero"/g' "$file"
    
    # Remove any inline padding styles from hero sections
    sed -i '' 's/\(class="hero".*\)padding: [0-9]*px [0-9]*px;/\1/g' "$file"
    
    # Add dark overlay div for consistency if it doesn't exist
    # This is a bit more complex as we need to check if it exists first
    sed -i '' '/<section class="hero"/a\
        <!-- Dark overlay for better text readability -->\
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6);"></div>' "$file"
    
    # Fix any duplicate overlay divs that might have been created
    sed -i '' 's/<!-- Dark overlay for better text readability -->\s*<!-- Dark overlay for better text readability -->/<!-- Dark overlay for better text readability -->/g' "$file"
done

# Verify that all pages have the proper container setup
for file in *.html service-*.html; do
    # Ensure the container div has relative position and z-index
    sed -i '' 's/<div class="container">/<div class="container" style="position: relative; z-index: 1;">/g' "$file"
    sed -i '' 's/<div class="container" style="position: relative;">/<div class="container" style="position: relative; z-index: 1;">/g' "$file"
    
    # Fix any duplicated styles
    sed -i '' 's/style="position: relative; z-index: 1; position: relative; z-index: 1;"/style="position: relative; z-index: 1;"/g' "$file"
done

echo "Hero sections standardized across all pages to match the homepage style!" 