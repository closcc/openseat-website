# OpenSeat Website - Deployment Guide

This guide provides step-by-step instructions for deploying the OpenSeat website to various hosting platforms.

## 📋 Prerequisites

- A GitHub account (for GitHub Pages or Vercel)
- Google Analytics account (optional, for tracking)
- Domain name: `openseat.cc` (optional)

## 🚀 Deployment Options

### Option 1: GitHub Pages (Recommended - Free)

1. **Create a new GitHub repository**
   ```bash
   # Create a new directory for the website
   mkdir openseat-website
   cd openseat-website
   
   # Copy the website files
   cp index.html ./
   cp -r assets ./
   ```

2. **Initialize Git and push to GitHub**
   ```bash
   git init
   git add .
       git commit -m "Initial commit: OpenSeat website"
   
   # Create a new repository on GitHub, then:
   git remote add origin https://github.com/yourusername/openseat-website.git
   git branch -M main
   git push -u origin main
   ```

3. **Enable GitHub Pages**
   - Go to your repository on GitHub
   - Click "Settings" → "Pages"
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
   - Click "Save"

4. **Custom Domain (Optional)**
   - In the same Pages settings, add your custom domain: `openseat.cc`
   - Add a CNAME file in your repository:
     ```
     openseat.cc
     ```

### Option 2: Vercel (Recommended - Free)

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Deploy**
   ```bash
   # Navigate to your website directory
   cd openseat-website
   
   # Deploy to Vercel
   vercel
   
   # Follow the prompts:
   # - Link to existing project: No
   # - Project name: openseat-website
   # - Directory: ./
   ```

3. **Custom Domain**
   - Go to your Vercel dashboard
   - Select your project
   - Go to "Settings" → "Domains"
   - Add your custom domain: `openseat.cc`

### Option 3: Netlify (Free)

1. **Drag and Drop**
   - Go to [netlify.com](https://netlify.com)
   - Sign up/Login
   - Drag your website folder to the deploy area

2. **Custom Domain**
   - Go to "Site settings" → "Domain management"
   - Add custom domain: `openseat.cc`

## 🔧 Configuration

### Google Analytics Setup

1. **Create Google Analytics Account**
   - Go to [analytics.google.com](https://analytics.google.com)
   - Create a new property for `openseat.cc`

2. **Update Tracking ID**
   - Replace `GA_MEASUREMENT_ID` in `index.html` with your actual Google Analytics Measurement ID
   - Format: `G-XXXXXXXXXX`

### App Store Links

When your app is published, update the download buttons in `index.html`:

```html
<!-- App Store -->
<a href="https://apps.apple.com/app/openseat/idXXXXXXXXX" class="download-btn" id="app-store-btn">

<!-- Google Play Store -->
<a href="https://play.google.com/store/apps/details?id=com.openseat.app" class="download-btn" id="play-store-btn">
```

### Social Media Links

Update the social media links when accounts are created:

```html
<!-- Instagram -->
<a href="https://instagram.com/openseat" class="social-link" id="instagram-link">

<!-- Twitter -->
<a href="https://twitter.com/openseat" class="social-link" id="twitter-link">
```

## 📱 Testing

### Local Testing
```bash
# Using Python (if installed)
python -m http.server 8000

# Using Node.js (if installed)
npx serve .

# Using PHP (if installed)
php -S localhost:8000
```

Then visit `http://localhost:8000`

### Mobile Testing
- Test on various devices and screen sizes
- Use browser developer tools to simulate mobile devices
- Test all interactive elements (buttons, links)

## 🔍 SEO Optimization

The website includes basic SEO elements:
- Meta description
- Proper heading structure
- Alt text for images
- Semantic HTML

### Additional SEO (Optional)
1. **Add a sitemap.xml**
2. **Add robots.txt**
3. **Submit to Google Search Console**
4. **Add Open Graph tags for social sharing**

## 🛠️ Maintenance

### Regular Updates
- Update app store links when published
- Add social media links when accounts are created
- Update content as needed
- Monitor Google Analytics for insights

### Performance Monitoring
- Use Google PageSpeed Insights
- Monitor Core Web Vitals
- Optimize images if needed

## 📞 Support

For deployment issues:
- GitHub Pages: Check repository settings and build logs
- Vercel: Check deployment logs in dashboard
- Netlify: Check build logs in dashboard

## 🎯 Next Steps

1. **Set up Google Analytics** for tracking user behavior
2. **Create social media accounts** and update links
3. **Publish the app** and update store links
4. **Set up email forwarding** for contact@openseat.cc
5. **Monitor performance** and user engagement

---

**Note:** All placeholder links currently show alerts. Replace them with actual URLs when the app and social media accounts are ready. 