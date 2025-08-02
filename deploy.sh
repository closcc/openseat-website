#!/bin/bash

# OpenSeat Website Deployment Script
# This script helps you deploy the website to various platforms

set -e

echo "🚀 OpenSeat Website Deployment Script"
echo "=============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if required files exist
check_files() {
    print_info "Checking required files..."
    
    if [ ! -f "index.html" ]; then
        print_error "index.html not found!"
        exit 1
    fi
    
    if [ ! -d "assets" ]; then
        print_error "assets directory not found!"
        exit 1
    fi
    
    print_status "All required files found"
}

# GitHub Pages deployment
deploy_github_pages() {
    print_info "Setting up GitHub Pages deployment..."
    
    # Initialize git if not already done
    if [ ! -d ".git" ]; then
        git init
        git add .
        git commit -m "Initial commit: OpenSeat website"
    fi
    
    print_warning "Please create a new GitHub repository and run:"
    echo "git remote add origin https://github.com/YOUR_USERNAME/openseat-website.git"
    echo "git branch -M main"
    echo "git push -u origin main"
    echo ""
    print_info "Then enable GitHub Pages in your repository settings"
}

# Vercel deployment
deploy_vercel() {
    print_info "Setting up Vercel deployment..."
    
    # Check if Vercel CLI is installed
    if ! command -v vercel &> /dev/null; then
        print_warning "Vercel CLI not found. Installing..."
        npm install -g vercel
    fi
    
    print_info "Deploying to Vercel..."
    vercel --yes
}

# Local testing
test_local() {
    print_info "Starting local server for testing..."
    
    # Check for Python
    if command -v python3 &> /dev/null; then
        print_info "Starting Python server on http://localhost:8000"
        python3 -m http.server 8000 &
        SERVER_PID=$!
        echo "Server started with PID: $SERVER_PID"
        echo "Press Ctrl+C to stop the server"
        wait $SERVER_PID
    elif command -v python &> /dev/null; then
        print_info "Starting Python server on http://localhost:8000"
        python -m http.server 8000 &
        SERVER_PID=$!
        echo "Server started with PID: $SERVER_PID"
        echo "Press Ctrl+C to stop the server"
        wait $SERVER_PID
    else
        print_error "Python not found. Please install Python or use another local server."
    fi
}

# Main menu
show_menu() {
    echo ""
    echo "Choose deployment option:"
    echo "1) Setup for GitHub Pages"
    echo "2) Deploy to Vercel"
    echo "3) Test locally"
    echo "4) Setup all (GitHub Pages + Vercel)"
    echo "5) Exit"
    echo ""
    read -p "Enter your choice (1-5): " choice
    
    case $choice in
        1)
            check_files
            deploy_github_pages
            ;;
        2)
            check_files
            deploy_vercel
            ;;
        3)
            check_files
            test_local
            ;;
        4)
            check_files
            deploy_github_pages
            deploy_vercel
            ;;
        5)
            print_info "Goodbye!"
            exit 0
            ;;
        *)
            print_error "Invalid choice. Please try again."
            show_menu
            ;;
    esac
}

# Check if script is run with arguments
if [ $# -eq 0 ]; then
    show_menu
else
    case $1 in
        "github")
            check_files
            deploy_github_pages
            ;;
        "vercel")
            check_files
            deploy_vercel
            ;;
        "local")
            check_files
            test_local
            ;;
        "all")
            check_files
            deploy_github_pages
            deploy_vercel
            ;;
        *)
            print_error "Usage: $0 [github|vercel|local|all]"
            exit 1
            ;;
    esac
fi

print_status "Deployment script completed!"
print_info "Next steps:"
echo "1. Update Google Analytics ID in index.html"
echo "2. Add actual app store links when published"
echo "3. Add social media links when accounts are created"
echo "4. Set up custom domain (openseat.cc)" 