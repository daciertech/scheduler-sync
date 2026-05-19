FROM mcr.microsoft.com/dotnet/runtime:10.0

RUN dotnet tool install Dacier.SchedulerCli
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
ENV PATH="/root/.dotnet/tools:${PATH}"
ENTRYPOINT ["/sync.sh"]