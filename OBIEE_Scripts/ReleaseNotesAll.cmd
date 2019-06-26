for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURR_BRANCH=%%i
git log master..%CURR_BRANCH% --pretty=format:"%%h -%%d %%s" | find "-" > C:\Temp-Merge\ReleaseNotesAll.txt
notepad C:\Temp-Merge\ReleaseNotesAll.txt