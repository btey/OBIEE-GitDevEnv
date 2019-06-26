for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURR_BRANCH=%%i
git log master..%CURR_BRANCH% --merges --pretty=format:"%%h - %%s" | find "-" > C:\Temp-Merge\ReleaseNotes.txt
notepad C:\Temp-Merge\ReleaseNotes.txt