FROM mcr.microsoft.com/dotnet/runtime:10.0

COPY tools/ /usr/local/bin/
COPY sync.sh /sync.sh
RUN chmod +x /sync.sh
ENTRYPOINT ["/sync.sh"]