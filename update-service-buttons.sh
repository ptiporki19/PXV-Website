#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# Target files: service-*.html excluding service-content.html
# Note: Using find instead of a simple loop for better handling of filenames and potential future subdirs
find . -maxdepth 1 -name 'service-*.html' -not -name 'service-content.html' -print0 | while IFS= read -r -d $'\0' file; do
    echo "Processing $file..."
    
    # Remove the "Get Started" button line completely
    sed -i.bak '/<a href="contact\.html" class="btn btn-secondary">Get Started<\/a>/d' "$file"
    
    # Add justify-content: center to the button-group div style (handle existing style attribute)
    # This is more complex with sed, might need refinement if style attributes vary greatly
    # Attempt 1: Basic substitution assuming style attribute exists
    sed -i.bak 's/style="display: flex; gap: 10px;"/style="display: flex; gap: 10px; justify-content: center;"/g' "$file"
    
    # Attempt 2: If style already has justify-content, do nothing; otherwise, append it (more robust but complex)
    # Using awk for better logic handling might be preferable here if sed fails.
    # Example (conceptual, might need tweaking):
    # awk '/<div class="button-group"/ { if ($0 ~ /justify-content:/) { print } else { sub(/style="[^"]*"/, "& justify-content: center;"); print } } !/<div class="button-group"/' "$file" > temp && mv temp "$file"
    
    # Remove the backup file created by the first sed command
    rm -f "$file.bak"
    
    echo "Finished processing $file."
done

echo "Removed 'Get Started' button and centered 'Buy Now' button on service pages!" 