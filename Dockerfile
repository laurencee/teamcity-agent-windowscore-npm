
FROM jetbrains/teamcity-agent:2018.1.1-windowsservercore-ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
 Invoke-WebRequest 'https://nodejs.org/dist/v10.8.0/node-v10.8.0-x64.msi' -OutFile node.msi -UseBasicParsing ; \
 Start-Process msiexec.exe -ArgumentList '/i', 'node.msi', '/quiet', '/norestart' -NoNewWindow -Wait;