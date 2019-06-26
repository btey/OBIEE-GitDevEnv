for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURR_BRANCH=%%i
git log master..%CURR_BRANCH% --pretty=format:"%%h -%%d %%s (%%cr) <%%an>" | find "-" > C:\Temp-Merge\ReleaseNotesAllDetails.txt
notepad C:\Temp-Merge\ReleaseNotesAllDetails.txt