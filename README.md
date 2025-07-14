# Retro Game Repair Website

A modern, responsive website for retro game repair services, designed to be hosted on GitHub Pages.

## Features

- 🎮 Modern, responsive design
- 📱 Mobile-friendly navigation
- 🎨 Beautiful gradients and animations
- 📝 Contact form with validation
- ⚡ Fast loading and smooth scrolling
- 🚀 Ready for GitHub Pages deployment

## Project Structure

```
retro-game-repair/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions deployment
├── index.html                  # Main HTML file
├── styles.css                  # CSS styles
├── script.js                   # JavaScript functionality
├── package.json                # Project configuration
└── README.md                   # This file
```

## Getting Started

### Prerequisites

- A GitHub account
- Git installed on your machine

### Local Development

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/retro-game-repair.git
   cd retro-game-repair
   ```

2. Start a local development server:

   ```bash
   npm run dev
   # or
   python3 -m http.server 8000
   ```

3. Open your browser and navigate to `http://localhost:8000`

### Deployment to GitHub Pages

1. Push your code to GitHub:

   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. Go to your repository settings on GitHub:

   - Navigate to Settings > Pages
   - Set Source to "GitHub Actions"
   - The GitHub Actions workflow will automatically deploy your site

3. Your site will be available at: `https://yourusername.github.io/retro-game-repair`

## Customization

### Updating Content

- Edit `index.html` to change the website content
- Modify `styles.css` to update the design
- Update `script.js` to add new functionality

### Changing Colors

The main color scheme is defined in `styles.css`:

- Primary gradient: `#667eea` to `#764ba2`
- Accent color: `#ff6b6b`
- Text colors: `#333` (dark) and `#666` (light)

### Adding New Sections

1. Add the HTML structure to `index.html`
2. Add corresponding CSS styles to `styles.css`
3. Add any JavaScript functionality to `script.js`

## GitHub Actions Workflow

The `.github/workflows/deploy.yml` file automatically:

- Triggers on pushes to the main branch
- Sets up Node.js environment
- Installs dependencies
- Builds the project
- Deploys to GitHub Pages

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

If you have any questions or need help with customization, please open an issue on GitHub.
