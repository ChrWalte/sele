
# build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# copy project file to build stage
COPY src/sele.csproj .

# restore project
RUN dotnet restore

# copy the rest of the files to build stage
COPY src/. .

# build the project in release mode
RUN dotnet publish -c Release -o /bin --no-restore

# publish the project in release mode
# RUN dotnet publish -c Release -o /bin --no-restore

# final/running stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final

# create and copy build files into sele folder
WORKDIR /sele
COPY --from=build /src/bin/Release/net6.0 .

# start sele at startup
ENTRYPOINT ["./sele"]
