#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat 

#FROM mcr.microsoft.com/dotnet/framework/aspnet:3.5
#ARG source
#WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/publish} .

#
# contains example Dockerfile
#
# https://stackoverflow.com/questions/49512727/docker-copy-failed-createfile-looking-for-file-in-strange-location

#
# windows annoying docker build path issue
# WHEN: the COPY command fails due to not being able to find the file
# THEN: remove all the entries from the .dockerignore file as its stuffing up the path... (windows is lame)
#

#
# watch from 18 mins on
#
# https://www.youtube.com/watch?v=15PAnxTYMQI&list=PLTPsG0Q7bWTXIgHAoDT13ieAGaV1fpVzU&index=4&t=1085s

#
# odds are you will need to install the nuget.exe so that it can run from the command line
#
# https://docs.microsoft.com/en-us/nuget/install-nuget-client-tools

#
# msbuild will need to be added to the enviroment path
# C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\amd64
#


#FROM mcr.microsoft.com/dotnet/framework/aspnet:3.5 as build

#WORKDIR /src

# restore dependencies
#COPY ./SoapTest.sln .
#COPY ./SoapTest.vbproj .
#COPY ./Web.config .
#COPY ./nuget.exe .
#COPY ./MSBuild.exe .
#RUN nuget restore

# build
#COPY . .
#RUN msbuild /p:Configuration=Release /m



FROM mcr.microsoft.com/dotnet/framework/aspnet:4.6.2
WORKDIR /inetpub/wwwroot
COPY ./bin/release/publish .

# docker build --tag soaptest .

# docker run -p 8080:80  -p 4443:443 -d soaptest

# http://localhost:8080/WebService1.asmx
