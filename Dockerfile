# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /source

# Copy the project files into the container
COPY . .

# Build and publish the application in release mode
RUN dotnet publish -c Release -o /app

# Stage 2: Set up the runtime environment
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS runtime
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app ./

# Set the entry point for the application
ENTRYPOINT ["dotnet", "DotNetCoreSqlDb.dll"]

# Expose the port your application listens on
EXPOSE 80
