set /p REPO_ORIG=<Scripts\repository_filename.txt
set /p REPO_NAME=<Scripts\repository_name.txt
copy %OBIEE_GIT_REPOS%\%REPO_NAME%\%REPO_ORIG% C:\Temp-Merge\%REPO_NAME%_B.rpd