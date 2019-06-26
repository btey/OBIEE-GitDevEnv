set /p REPO_ORIG=<Scripts\repository_filename.txt
set /p REPO_NAME=<Scripts\repository_name.txt

%OBIEE_CLIENT_HOME%\bi\modules\oracle.bi.commandline.tools\scripts\datamodel.cmd uploadrpd -I %OBIEE_GIT_REPOS%\%REPO_NAME%\%REPO_ORIG% -W Admin123 -SI ssi -U weblogic -P weblogic1234 -S %OBIEE_SERVER% -N 9502