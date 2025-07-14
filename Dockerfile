# Use the official Jekyll image
FROM jekyll/jekyll:latest

# Install webrick gem (required for Jekyll serve)
RUN gem install webrick

# Set working directory
WORKDIR /site

# Copy the rest of the site
COPY . .

# Expose port 4000
EXPOSE 4000

# Default command to serve the site
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--livereload", "--livereload-port", "35729"] 