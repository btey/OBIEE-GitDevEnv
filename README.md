# OBIEE-GitDevEnv
OBIEE Development Environment to work with GIT and GitFlow

## Introduction

In different sites they talk about the advantage of working with Git in the development of projects with OBIEE. Some give some details about how they implement their development flow, but none ends up giving specific details on how to implement it. I hope that this will help those who work in the singular world of Oracle, and even more in Oracle Business Intelligence. The following method is the one I have used (and still use) in my years as an OBIEE developer.

## Work tools

OBIEE only has one development client for Windows platform. I hope that one day, as a Linux user, Oracle will come to deliver a version for Linux. Although some time ago, speaking with an Oracle representative, he commented that they were working on a version of RPD based on the Oracle database. We will see if one day it becomes a reality, and if it works. For this reason, all the tools mentioned are for Windows.

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


