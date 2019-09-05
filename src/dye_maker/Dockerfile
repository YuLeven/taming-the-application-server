FROM microsoft/dotnet:2.2-sdk-alpine AS build
WORKDIR /dye-maker/
COPY . .
WORKDIR /dye-maker/src/DyeMaker.WebAPI

RUN dotnet restore
