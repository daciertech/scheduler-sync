FROM mcr.microsoft.com/dotnet/runtime:8.0-bullseye-slim AS base
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
RUN donet tool install Dacier.SchedulerCli --global
ENTRYPOINT ["/sync.sh"]