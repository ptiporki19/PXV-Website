#!/bin/bash

# Script to update all service pages to use URL parameters for checkout

# Define the new buyNow function
read -r -d '' NEW_FUNCTION << 'EOL'
function buyNow(productName, productPrice, productImage, productDescription, productType) {
    // Store data in localStorage for backup
    localStorage.setItem('checkoutProduct', JSON.stringify({
        name: productName,
        price: productPrice,
        image: productImage,
        description: productDescription,
        type: productType || 'Service Package'
    }));
    
    // Now also pass data directly via URL parameters
    const encodedTitle = encodeURIComponent(productName);
    const encodedPrice = encodeURIComponent(productPrice);
    const encodedImage = encodeURIComponent(productImage);
    const encodedDescription = encodeURIComponent(productDescription);
    const encodedType = encodeURIComponent(productType || 'Service Package');
    
    // Redirect with URL parameters
    window.location.href = \`checkout.html?title=\${encodedTitle}&price=\${encodedPrice}&image=\${encodedImage}&description=\${encodedDescription}&type=\${encodedType}\`;
}
EOL

# List of all service pages to update
SERVICE_PAGES=("service-branding.html" "service-strategy.html" "service-mvp.html" "service-social.html")

# Update each service page
for page in "${SERVICE_PAGES[@]}"; do
  if [ -f "$page" ]; then
    echo "Updating $page..."
    
    # Create a backup
    cp "$page" "${page}.bak"
    
    # Replace the buyNow function in the file
    # This sed command replaces everything between "function buyNow" and the closing brace and next script tag
    if sed -i.tmp -e '/function buyNow/,/}[[:space:]]*<\/script>/c\'"$NEW_FUNCTION"'</script>' "$page"; then
      echo "  ✅ Successfully updated $page"
    else
      echo "  ❌ Failed to update $page"
      # Restore from backup if the update failed
      mv "${page}.bak" "$page"
    fi
    
    # Remove temporary files
    rm -f "${page}.tmp"
  else
    echo "⚠️ File $page not found, skipping."
  fi
done

echo "Update complete! All service pages now use URL parameters for checkout." 