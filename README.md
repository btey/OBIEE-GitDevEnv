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




