# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0-bookworm-slim AS build
ARG GITHUB_ACTOR
ARG GITHUB_TOKEN

# Configure NuGet source
RUN dotnet nuget add source --username $GITHUB_ACTOR --password $GITHUB_TOKEN --store-password-in-clear-text --name github "https://nuget.pkg.github.com/daciertech/index.json"

# Install the tool
RUN dotnet tool install Dacier.SchedulerCli --global

# Stage 2: Final
FROM mcr.microsoft.com/dotnet/runtime:9.0-bookworm-slim AS final
COPY --from=build /root/.dotnet /root/.dotnet
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
ENV PATH="/root/.dotnet/tools:${PATH}"
ENTRYPOINT ["/sync.sh"]