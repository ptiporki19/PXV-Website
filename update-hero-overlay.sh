#!/bin/bash

# Navigate to the website directory
cd /Users/MAC/Documents/PXV/PXV\ -\ Website/

# Replace the inline background-color opacity in all HTML files
find . -name "*.html" -exec sed -i '' 's/background-color: rgba(0, 0, 0, 0.6);/background-color: rgba(0, 0, 0, 0.4);/g' {} \;

# Replace any other rgba black overlay colors with the same opacity value
find . -name "*.html" -exec sed -i '' 's/background-color: rgba\(0, 0, 0, 0.6\)/background-color: rgba(0, 0, 0, 0.4)/g' {} \;

echo "Updated hero overlay opacity from 0.6 to 0.4 in all HTML files!" 