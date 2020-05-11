FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

RUN apt update
RUN apt install -y nodejs npm

EXPOSE 5000 5001 443

WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "ReactDotnet.dll"]