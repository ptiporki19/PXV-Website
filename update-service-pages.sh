#!/bin/bash

# Script to correct the content of service pages

# Update service-branding.html
sed -i '' 's|<title>Content Strategy & Creation - PrimeX</title>|<title>Brand Identity & Design - PrimeX</title>|g' service-branding.html
sed -i '' 's|<h1>Content Strategy & Creation</h1>|<h1>Brand Identity & Design</h1>|g' service-branding.html
sed -i '' 's|<p>High-quality, engaging content that positions your brand as an authority and drives conversions</p>|<p>Create a compelling visual brand identity that captivates your audience and sets you apart from competitors</p>|g' service-branding.html

# Update service-market.html
sed -i '' 's|<title>Content Strategy & Creation - PrimeX</title>|<title>Market Research & Analysis - PrimeX</title>|g' service-market.html
sed -i '' 's|<h1>Content Strategy & Creation</h1>|<h1>Market Research & Analysis</h1>|g' service-market.html
sed -i '' 's|<p>High-quality, engaging content that positions your brand as an authority and drives conversions</p>|<p>Data-driven insights to inform your business strategy and help you make confident decisions</p>|g' service-market.html

# Update service-mvp.html
sed -i '' 's|<title>Content Strategy & Creation - PrimeX</title>|<title>MVP Development - PrimeX</title>|g' service-mvp.html
sed -i '' 's|<h1>Content Strategy & Creation</h1>|<h1>MVP Development</h1>|g' service-mvp.html
sed -i '' 's|<p>High-quality, engaging content that positions your brand as an authority and drives conversions</p>|<p>Fast-track your business idea with a minimum viable product that validates your concept and attracts early users</p>|g' service-mvp.html

# Update service-social.html
sed -i '' 's|<title>Content Strategy & Creation - PrimeX</title>|<title>Social Media Management - PrimeX</title>|g' service-social.html
sed -i '' 's|<h1>Content Strategy & Creation</h1>|<h1>Social Media Management</h1>|g' service-social.html
sed -i '' 's|<p>High-quality, engaging content that positions your brand as an authority and drives conversions</p>|<p>Strategic social media presence that engages your audience and builds meaningful connections with potential clients</p>|g' service-social.html

# Update service-seo.html
sed -i '' 's|<title>Content Strategy & Creation - PrimeX</title>|<title>SEO Optimization - PrimeX</title>|g' service-seo.html
sed -i '' 's|<h1>Content Strategy & Creation</h1>|<h1>SEO Optimization</h1>|g' service-seo.html
sed -i '' 's|<p>High-quality, engaging content that positions your brand as an authority and drives conversions</p>|<p>Boost your online visibility and attract organic traffic with data-driven search engine optimization strategies</p>|g' service-seo.html

# Update service overview section headings in each file
sed -i '' 's|<h2 style="color: white;">Compelling Content That Converts</h2>|<h2 style="color: white;">Create a Strong Brand Identity</h2>|g' service-branding.html
sed -i '' 's|<h2 style="color: white;">Compelling Content That Converts</h2>|<h2 style="color: white;">Data-Driven Market Insights</h2>|g' service-market.html
sed -i '' 's|<h2 style="color: white;">Compelling Content That Converts</h2>|<h2 style="color: white;">Validate Your Business Idea Faster</h2>|g' service-mvp.html
sed -i '' 's|<h2 style="color: white;">Compelling Content That Converts</h2>|<h2 style="color: white;">Engage Your Audience on Social Media</h2>|g' service-social.html
sed -i '' 's|<h2 style="color: white;">Compelling Content That Converts</h2>|<h2 style="color: white;">Improve Your Search Engine Rankings</h2>|g' service-seo.html

# Update service package titles
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Packages</h2>|<h2 class="section-title" style="color: white;">Our Branding Packages</h2>|g' service-branding.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Packages</h2>|<h2 class="section-title" style="color: white;">Our Market Research Packages</h2>|g' service-market.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Packages</h2>|<h2 class="section-title" style="color: white;">Our MVP Development Packages</h2>|g' service-mvp.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Packages</h2>|<h2 class="section-title" style="color: white;">Our Social Media Packages</h2>|g' service-social.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Packages</h2>|<h2 class="section-title" style="color: white;">Our SEO Packages</h2>|g' service-seo.html

# Update CTA section headers
sed -i '' 's|<h2 style="color: white;">Ready to elevate your content strategy?</h2>|<h2 style="color: white;">Ready to elevate your brand identity?</h2>|g' service-branding.html
sed -i '' 's|<h2 style="color: white;">Ready to elevate your content strategy?</h2>|<h2 style="color: white;">Ready to get data-driven insights?</h2>|g' service-market.html
sed -i '' 's|<h2 style="color: white;">Ready to elevate your content strategy?</h2>|<h2 style="color: white;">Ready to launch your MVP?</h2>|g' service-mvp.html
sed -i '' 's|<h2 style="color: white;">Ready to elevate your content strategy?</h2>|<h2 style="color: white;">Ready to elevate your social media presence?</h2>|g' service-social.html
sed -i '' 's|<h2 style="color: white;">Ready to elevate your content strategy?</h2>|<h2 style="color: white;">Ready to improve your search visibility?</h2>|g' service-seo.html

# Update CTA description
sed -i '' "s|<p style=\"color: #e0e0e0;\">Let's create compelling content that resonates with your audience and drives business growth.</p>|<p style=\"color: #e0e0e0;\">Let's create a compelling brand identity that resonates with your audience and sets you apart from competitors.</p>|g" service-branding.html
sed -i '' "s|<p style=\"color: #e0e0e0;\">Let's create compelling content that resonates with your audience and drives business growth.</p>|<p style=\"color: #e0e0e0;\">Let's uncover insights that help you make strategic decisions and grow your business with confidence.</p>|g" service-market.html
sed -i '' "s|<p style=\"color: #e0e0e0;\">Let's create compelling content that resonates with your audience and drives business growth.</p>|<p style=\"color: #e0e0e0;\">Let's build a functional MVP that validates your concept and positions your business for success.</p>|g" service-mvp.html
sed -i '' "s|<p style=\"color: #e0e0e0;\">Let's create compelling content that resonates with your audience and drives business growth.</p>|<p style=\"color: #e0e0e0;\">Let's create a strategic social media presence that engages your audience and builds your brand.</p>|g" service-social.html
sed -i '' "s|<p style=\"color: #e0e0e0;\">Let's create compelling content that resonates with your audience and drives business growth.</p>|<p style=\"color: #e0e0e0;\">Let's optimize your website for better search rankings and increased organic traffic.</p>|g" service-seo.html

# Update process section titles
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Creation Process</h2>|<h2 class="section-title" style="color: white;">Our Branding Process</h2>|g' service-branding.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Creation Process</h2>|<h2 class="section-title" style="color: white;">Our Market Research Process</h2>|g' service-market.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Creation Process</h2>|<h2 class="section-title" style="color: white;">Our MVP Development Process</h2>|g' service-mvp.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Creation Process</h2>|<h2 class="section-title" style="color: white;">Our Social Media Management Process</h2>|g' service-social.html
sed -i '' 's|<h2 class="section-title" style="color: white;">Our Content Creation Process</h2>|<h2 class="section-title" style="color: white;">Our SEO Optimization Process</h2>|g' service-seo.html

echo "Service pages updated successfully!" 