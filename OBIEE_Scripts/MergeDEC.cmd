set /p REPO_ORIG=<Scripts\repository_filename.txt
xcopy /Y *BASE*.rpd C:\Temp-Merge\original.rpd < Scripts\xcopy.txt
xcopy /Y *BACKUP*.rpd C:\Temp-Merge\backup.rpd < Scripts\xcopy.txt
xcopy /Y *LOCAL*.rpd C:\Temp-Merge\modified.rpd < Scripts\xcopy.txt
xcopy /Y *REMOTE*.rpd C:\Temp-Merge\current.rpd < Scripts\xcopy.txt
%OBIEE_CLIENT_HOME%\domains\bi\bitools\bin\admintool.cmd /command Scripts\AdminToolMergeDEC.txt && xcopy /Y C:\Temp-Merge\current(1).rpd %REPO_ORIG% < Scripts\xcopy.txt && del C:\Temp-Merge\*.rpd
