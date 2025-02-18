FROM mcr.microsoft.com/dotnet/runtime:9.0-bookworm-slim AS base
ARG GITHUB_ACTOR
ARG GITHUB_TOKEN
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
RUN dotnet nuget add source --username $GITHUB_ACTOR --password $GITHUB_TOKEN --store-password-in-clear-text --name github "https://nuget.pkg.github.com/daciertech/index.json"
RUN donet tool install Dacier.SchedulerCli --global
ENTRYPOINT ["/sync.sh"]