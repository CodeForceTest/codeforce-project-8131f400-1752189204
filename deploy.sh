#!/bin/bash

# CodeForce Marketing Website Deployment Script
# This script helps deploy the website to various hosting platforms

echo "🚀 CodeForce Marketing Website Deployment Helper"
echo "================================================"

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Please run this script from the project root directory."
    exit 1
fi

echo "✅ Project files found"

# Function to start local development server
start_local_server() {
    echo "🌐 Starting local development server..."
    
    # Check if Python 3 is available
    if command -v python3 &> /dev/null; then
        echo "📡 Server starting on http://localhost:8000"
        echo "📱 Mobile preview: https://8000-4e30841b-8b9a-46f3-adfb-8f20bc289e56.h1100.daytona.work"
        echo "🛑 Press Ctrl+C to stop the server"
        python3 -m http.server 8000
    elif command -v python &> /dev/null; then
        echo "📡 Server starting on http://localhost:8000"
        echo "📱 Mobile preview: https://8000-4e30841b-8b9a-46f3-adfb-8f20bc289e56.h1100.daytona.work"
        echo "🛑 Press Ctrl+C to stop the server"
        python -m http.server 8000
    else
        echo "❌ Python not found. Please install Python to run the local server."
        exit 1
    fi
}

# Function to prepare files for deployment
prepare_deployment() {
    echo "📦 Preparing files for deployment..."
    
    # Create deployment directory
    mkdir -p dist
    
    # Copy files to dist directory
    cp index.html dist/
    cp styles.css dist/
    cp script.js dist/
    cp README.md dist/
    
    echo "✅ Files prepared in 'dist' directory"
    echo "📁 Ready to upload to your hosting provider"
}

# Function to show deployment instructions
show_deployment_instructions() {
    echo ""
    echo "🌐 Deployment Instructions"
    echo "========================="
    echo ""
    echo "GitHub Pages:"
    echo "1. Go to your repository settings"
    echo "2. Scroll to 'Pages' section"
    echo "3. Select 'Deploy from a branch'"
    echo "4. Choose 'main' branch and '/ (root)'"
    echo "5. Your site will be available at: https://codeforcetest.github.io/codeforce-project-8131f400-1752189204/"
    echo ""
    echo "Netlify:"
    echo "1. Drag and drop the 'dist' folder to netlify.com/drop"
    echo "2. Or connect your GitHub repository for automatic deployments"
    echo ""
    echo "Vercel:"
    echo "1. Install Vercel CLI: npm i -g vercel"
    echo "2. Run: vercel --prod"
    echo "3. Follow the prompts"
    echo ""
    echo "Traditional Hosting:"
    echo "1. Upload all files from 'dist' directory to your web server"
    echo "2. Ensure index.html is in the root directory"
    echo ""
}

# Main menu
echo ""
echo "What would you like to do?"
echo "1. Start local development server"
echo "2. Prepare files for deployment"
echo "3. Show deployment instructions"
echo "4. Exit"
echo ""

read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        start_local_server
        ;;
    2)
        prepare_deployment
        show_deployment_instructions
        ;;
    3)
        show_deployment_instructions
        ;;
    4)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac