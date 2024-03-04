# Stage 1: Build environment (Golang image)
FROM go:1.22 AS builder

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Install dependencies
RUN go get -d -v ./...

# Run tests
RUN go test -v ./...

# Install code formatters and linters
RUN go get mvdan.cc/gofumpt golang.org/x/vuln-check github.com/ossf/scorecard/cmd/v2@latest

# Run code formatting
RUN gofumpt -s -w .

# Run vulnerability checks
RUN go vet ./...
RUN go vet -vettool=$(which go-vet-vuln-check) ./...
RUN scorecard -v

# Stage 2: Slim runtime environment (Alpine image)
FROM alpine:latest

# Install PostgreSQL client
RUN apk add postgresql-client

# Copy environment variables (replace with actual values)
COPY .env /app/.env

# Set working directory
WORKDIR /app

# Copy application binary from builder stage
COPY --from=builder /app/lpp /app/lpp

# Expose port (adjust if needed)
EXPOSE 5432

# Define command to run the application with environment variables
CMD ["lpp", "-dbhost=${POSTGRES_HOST}", "-dbuser=${POSTGRES_USER}", "-dbpassword=${POSTGRES_PASSWORD}"]

# .env file (replace with your actual values)
# POSTGRES_HOST=your_postgres_host
# POSTGRES_USER=your_postgres_user
# POSTGRES_PASSWORD=your_postgres_password
