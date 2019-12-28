# escape=`

# Use the latest Windows Server Core image with .NET Framework 4.8.
ARG REPO=mcr.microsoft.com/dotnet/framework/sdk
FROM $REPO:4.7.2-windowsservercore-ltsc2016
ARG VER=1.0.0.0

# Copy source code from host
COPY . 'C:\\source\\'
WORKDIR 'C:\\source\\'

# Restore the powershell for correct batch processing.
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install .NET core sdk
RUN .\dotnet-install.ps1 -InstallDir 'C:\Program Files\dotnet' -Version '2.0.0'
RUN .\dotnet-install.ps1 -InstallDir 'C:\Program Files\dotnet' -Version '2.1.2'
