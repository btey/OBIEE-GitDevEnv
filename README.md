# OBIEE-GitDevEnv
OBIEE Development Environment to work with GIT and GitFlow

## Introduction

In different sites they talk about the advantage of working with Git in the development of projects with OBIEE. Some give some details about how they implement their development flow, but only one ([Rittman Mead](https://github.com/RittmanMead/obi-concurrent-develop)) ends up giving specific details on how to implement it. The following method is more simple that Rittman Mead uses and focuses on the development of the RPD. I hope that this will help those who work in the singular world of Oracle, and even more in Oracle Business Intelligence. The following method is the one I have used (and still use) in my years as an OBIEE developer.

## Work tools

OBIEE only has one development client for Windows platform. I hope that one day, as a Linux user, Oracle will come to deliver a version for Linux. Although some time ago, speaking with an Oracle representative, he commented that they were working on a version of RPD based on the Oracle database. We will see if one day it becomes a reality, and if it works.

These are the work tools:

* Admintool (OBIEE client)
* SourceTree (Atlassian)

Server tools:

* Private Git server (GitLab)

## Configuring the work environment

### Setup your main git repository paths

Choose a path for the Git repositories, for example "C:\Git-Repos" (avoid use a path with blank spaces, here we will clone all the projects), and choose another temporary path where the merges will be compiled between different versions:

```
c:\Git-Repos [contains all cloned repositories]
c:\Temp-Merge [temp path for merges]
```
### Setup a git repo for all the OBIEE scripts

On your private git server create a new repository where you save all the scripts. Any subsequent change can be easily updated in all work teams. This scripts are in the folder ```OBIEE_Scripts``` and contain the following scripts:

* Abort Merge
* Compare A>B
* Compare B>A
* Set Compare A
* Set Compare B
* Download RPD
* Merge
* Merge DEC
* Open RPD
* Patch
* Release Notes
* Release Notes (All)
* Release Notes (All details)
* Release Notes (Latest tag)
* Upload RPD

### Setup environment variables

The above scripts need certain environment variables to work. In Windows 10 you can add them by following these steps:

* Open a window Explorer.
* Right click on "This PC" and select the "Properties" option.
* In the System window, select the "Advanced System Settings" option.
* In the System Properties window, Advanced Tab, click on the "Environment variables" button.

Then add the following variables:

| Variable          | Value (this are examples)               | Description                    |
|-------------------|-----------------------------------------|--------------------------------|
| OBIEE_CLIENT_HOME | C:\Oracle\Middleware\OracleBI12c_122130 | Path of the Admintool client   |
| OBIEE_GIT_REPOS   | C:\Git-Repos                            | Path of the git repositories   |
| OBIEE_SERVER      | 192.168.56.103                          | OBIEE Server IP (your sandbox) |

### Setup custom actions for use with SourceTree

The above scripts must be added as custom actions inside SourceTree. Follow these steps for each script and go to Tools > Options > Custom Actions. From there we will create the following actions:

#### Abort Merge

```
Menu Caption: Abort Merge
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\AbortMerge.cmd
Parameters: 
```

#### Compare A > B

```
Menu Caption: Compare A > B
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\CompareAB.cmd
Parameters: 
```

#### Compare B > A

```
Menu Caption: Compare B > A
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\CompareBA.cmd
Parameters: 
```

#### Set Compare A

```
Menu Caption: Set Compare A
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\SetCompareA.cmd
Parameters:
```

#### Set Compare B

```
Menu Caption: Set Compare B
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\SetCompareB.cmd
Parameters:
```

#### Download RPD

```
Menu Caption: Download RPD
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\Download.cmd
Parameters:
```

#### Open RPD

```
Menu Caption: Open RPD
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\OpenRPD.cmd
Parameters:
```

#### Release Notes

```
Menu Caption: Release Notes
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\ReleaseNotes.cmd
Parameters:
```

#### Release Notes (All)

```
Menu Caption: Release Notes (All)
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\ReleaseNotesAll.cmd
Parameters:
```

#### Release Notes (All details)

```
Menu Caption: Release Notes (All Details)
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\ReleaseNotesAllDetails.cmd
Parameters:
```

#### Release Notes (Last TAG)

```
Menu Caption: Release Notes (Last TAG)
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\ReleaseNotesLastestTag.cmd
Parameters:
```

#### Upload RPD

```
Menu Caption: Upload RPD
	[ ]	Open in a separate window
	[ ]	Show Full Output
	[x]	Run command silently
Script to run: C:\Git-Repos\OBIEE_Scripts\Scripts\Upload.cmd
Parameters:
```

### Basic folder structure of an OBIEE project

The following folder structure is necessary in each OBIEE project in order for the scripts to work correctly:

```
C:\Git-Repos\PROJECT_NAME\Scripts
C:\Git-Repos\PROJECT_NAME\RPD_NAME.rpd
```

The ```Scripts``` folder must contains the following files:

| File                    | Description                             | Content               |
|-------------------------|-----------------------------------------|-----------------------|
| AdminToolMerge.txt      | Commands for the complete merge process | Same for all projects |
| AdminToolMergeDEC.txt   | Commands for the initial merge process  | Same for all projects |
| repository_filename.txt | RPD filename                            | Project specific      |
| repository_name.txt     | PROJECT_NAME                            | Project specific      |
| xcopy.txt               | Custom parameter for xcopy command      | Same for all projects |

Note: for the files ```AdminToolMerge.txt``` and ```AdminToolMergeDEC.txt``` check the commands list you can use to administer a repository. See the folder ```Scripts``` to get an example file for a project called "BankInsights".


## RPD workflow with SourceTree and GitFlow

Note: If you don't know the GitFlow wotkflow, read the following resource from [Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

### Initial setup of a new project BankInsight

#### 1. Create new repository from SourceTree

- Destination path: C:\Users\btey\Documents\Git-Repos\BankInsight
- Name: BankInsight
- Type: Git

#### 2. Setup ```Scripts``` folder

- Copy the example folder ```Scripts```
- Edit the file ```Scripts\repository_filename.txt``` with the text "BankInsight.rpd".
- Edit the file ```Scripts\repository_name.txt``` with the text "BankInsight".

#### 3. Create an empty RPD

- Open Admintool
- File > New repository
- Select "Binary"
- Name: BankInsight.rpd
- Location: C:\Users\btey\Documents\Git-Repos\BankInsight\
- Import Metadata: No
- Repository Password: Admin123
- Retype Password: Admin123
- Save the RPD
- Close Admintool

#### 4. Add RPD and specific project scripts to git control

- Go to SourceTree and select the new repository "BankInsight"
- Select "Stage All" to add all the files and folders to "Staged files"
- Set a comment, for example, "Init setup"
- Commit the changes

#### 5. Enable GitFlow for this repository

- The initial setup and commit create the default "master" branch.
- Go to the SourceTree toolbar, and clic the button "Git-flow".
- In the new window "Initialise repository for Git-flow", use the default options.
- Clic OK.
- The new "develop" branch is created.

#### 6. Setup the scripts to resolve conflicts (by project or repository)

- Go to SourceTree and select the new repository "BankInsight"
- Go to the toolbar and clic the button "Terminal"
- In the terminal put the following commands:

```
$ git config merge.tool AdminTool
$ git config mergetool.AdminTool.cmd C:/Users/btey/Documents/Git-Repos/OBIEE_Scripts/Scripts/MergeDEC.cmd
$ git config mergetool.AdminTool.trustExitCode false
$ git config mergetool.Auto.cmd C:/Users/btey/Documents/Git-Repos/OBIEE_Scripts/Scripts/Merge.cmd
$ git config mergetool.Auto.trustExitCode false
$ git config mergetool.keepBackup false
```


[This readme currently is on "work in progress"]
