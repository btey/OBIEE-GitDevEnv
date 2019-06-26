set /p REPO_ORIG=<Scripts\repository_filename.txt
@echo OpenOffline %cd%\%REPO_ORIG% Admin123 > c:\Temp-Merge\OpenRPD.txt
%OBIEE_CLIENT_HOME%\domains\bi\bitools\bin\admintool.cmd /command C:\Temp-Merge\OpenRPD.txt