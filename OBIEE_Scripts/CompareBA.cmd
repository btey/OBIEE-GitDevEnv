set /p REPO_ORIG=<Scripts\repository_filename.txt
set /p REPO_NAME=<Scripts\repository_name.txt

#echo cp $1 c:\Temp-Merge\%REPO_NAME%_B.rpd
#echo cp $2 c:\Temp-Merge\%REPO_NAME%_A.rpd

@echo OpenOffline c:\Temp-Merge\%REPO_NAME%_B.rpd Admin123 > c:\Temp-Merge\CompareRPD.txt
@echo Compare c:\Temp-Merge\%REPO_NAME%_A.rpd Admin123 >> c:\Temp-Merge\CompareRPD.txt

%OBIEE_CLIENT_HOME%\domains\bi\bitools\bin\admintool.cmd /command C:\Temp-Merge\CompareRPD.txt