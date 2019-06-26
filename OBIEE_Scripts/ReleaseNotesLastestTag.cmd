for /f %%a in ('git describe --tags --abbrev HEAD') do @set latesttag=%%a
for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set CURR_BRANCH=%%i
git log %latesttag%..master --pretty=format:"%%h - %%s" | find "-" > C:\Temp-Merge\ReleaseNotesLatestTag.txt
notepad C:\Temp-Merge\ReleaseNotesLatestTag.txt


