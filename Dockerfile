
# build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src

# copy project file to build stage
COPY src/sele.csproj .

# restore project
RUN dotnet restore

# copy the appsettings.json file to the build stage
# this file contains settings regrading what files to serve
# envirement variables take pirority when it comes to settings
COPY src/appsettings.json .

# copy the rest of the files to build stage
COPY src/. .

# publish the project in release mode
RUN dotnet publish -c Release -o /bin

# final/running stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS final

# create and copy build files into sele folder
WORKDIR /sele
COPY --from=build /src/bin/Release/net6.0 .

# start sele at startup
ENTRYPOINT ["dotnet", "sele.dll"]
