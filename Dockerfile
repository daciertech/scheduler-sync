FROM mcr.microsoft.com/dotnet/runtime:9.0-bookworm-slim AS base
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
RUN donet tool install Dacier.SchedulerCli --global
ENTRYPOINT ["/sync.sh"]