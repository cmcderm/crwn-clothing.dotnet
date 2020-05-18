FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

ENV ASPNETCORE_URLS=http://+:5001
ENV DOTNET_USE_POLLING_FILE_WATCHER=true

RUN apt update
RUN apt install -y nodejs npm

EXPOSE 5000
EXPOSE 5001

WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "ReactDotnet.dll"]