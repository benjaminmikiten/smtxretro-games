# Development server port
PORT := 4000

# Docker image name
IMAGE_NAME := retro-game-repair
CONTAINER_NAME := retro-game-repair-dev

# Default target
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make dev     - Start Jekyll development server with Docker"
	@echo "  make serve   - Start Jekyll development server only"
	@echo "  make build   - Build the Jekyll site with Docker"
	@echo "  make clean   - Clean build artifacts and Docker images"
	@echo "  make install - Build Docker image"
	@echo "  make stop    - Stop running containers"

# Development command - starts Jekyll server with Docker
.PHONY: dev
dev:
	@echo "Starting Jekyll development server with Docker..."
	@echo "Server will be available at http://localhost:$(PORT)"
	@echo "Press Ctrl+C to stop"
	@echo ""
	@if command -v docker >/dev/null 2>&1; then \
		docker-compose up --build; \
	else \
		echo "Docker not found. Please install Docker to run this project."; \
		echo "Download from: https://www.docker.com/products/docker-desktop"; \
		exit 1; \
	fi

# Start Jekyll development server only
.PHONY: serve
serve:
	@echo "Starting Jekyll development server on port $(PORT)..."
	@if command -v docker >/dev/null 2>&1; then \
		docker-compose up --build -d; \
		echo "Server started! Visit http://localhost:$(PORT)"; \
		echo "Run 'make stop' to stop the server"; \
	else \
		echo "Docker not found. Please install Docker to run this project."; \
		echo "Download from: https://www.docker.com/products/docker-desktop"; \
		exit 1; \
	fi

# Build the Jekyll site with Docker
.PHONY: build
build:
	@echo "Building Jekyll site with Docker..."
	@if command -v docker >/dev/null 2>&1; then \
		docker run --rm -v $$(pwd):/site -w /site jekyll/jekyll:4.3.0 jekyll build; \
		echo "Build completed! Site is in _site/ directory"; \
	else \
		echo "Docker not found. Please install Docker to run this project."; \
		echo "Download from: https://www.docker.com/products/docker-desktop"; \
		exit 1; \
	fi

# Clean build artifacts and Docker images
.PHONY: clean
clean:
	@echo "Cleaning build artifacts and Docker images..."
	@rm -rf _site/ .jekyll-cache/ .sass-cache/ .DS_Store
	@if command -v docker >/dev/null 2>&1; then \
		docker-compose down --rmi all --volumes --remove-orphans 2>/dev/null || true; \
		docker rmi $(IMAGE_NAME) 2>/dev/null || true; \
		docker system prune -f; \
	fi
	@echo "Clean completed!"

# Build Docker image
.PHONY: install
install:
	@echo "Building Docker image..."
	@if command -v docker >/dev/null 2>&1; then \
		docker-compose build; \
		echo "Docker image built successfully!"; \
	else \
		echo "Docker not found. Please install Docker to run this project."; \
		echo "Download from: https://www.docker.com/products/docker-desktop"; \
		exit 1; \
	fi

# Stop running containers
.PHONY: stop
stop:
	@echo "Stopping Docker containers..."
	@if command -v docker >/dev/null 2>&1; then \
		docker-compose down; \
		echo "Containers stopped!"; \
	else \
		echo "Docker not found."; \
	fi

# Show project info
.PHONY: info
info:
	@echo "Project: San Marcos Retro Game Repair Website"
	@echo "Type: Jekyll Static Site (Docker)"
	@echo "Port: $(PORT)"
	@echo "Docker version:"
	@docker --version 2>/dev/null || echo "Docker not installed"
	@echo "Files:"
	@ls -la _layouts/ _includes/ assets/ 2>/dev/null || echo "No Jekyll files found"
	@echo "Docker containers:"
	@docker ps -a --filter "name=$(CONTAINER_NAME)" 2>/dev/null || echo "No containers found" 