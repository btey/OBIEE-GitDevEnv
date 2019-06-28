# How To Run the Administration Tool and Administer Repositories in Automated Command Line

## 1. APPLIES TO

Business Intelligence Server/Suite Enterprise Edition - Version 11.1.1.6.0 and later
Information in this document applies to any platform.

## 2. PURPOSE

This note describes how to run the Administration Tool in automated mode from the command line and lists the commands you can use to administer a repository.

## 3. DETAILS

The basic command is:

```
AdminTool /Command commandFile
```

where commandFile is full path to the text file containing batch of commands.

## 4. COMMANDS LIST

#### 4.1 BusinessModelConsistencyCheck businessModelName [outputFileName]

Consistency check for one business model.

#### 4.2 CheckinSubset ModifiedSubsetRepositoryName dummy password [decisionFile [{Yes|No}]]

Note: This command is obsolete and supported for backwards compatibility only. Use the RefreshSubset command instead.

Checks in the repository, defined in the ModifiedSubsetRepository parameter, into the master repository, leaving the master repository open. No repository need be open at the time of this call.

* The merge log is created in the TEMP directory.
* If ModifiedSubsetRepositoryName does not include an extension, ".rpd" is assumed as the extension.
* ModifiedSubsetRepositoryName must be the file in the repository directory, so you do not have to include the full path to it.
* The dummy parameter is obsolete and is required only for backwards compatibility.
* The last parameter specifies whether "Equalize during merge" check box should be turned on. The default value is No.

#### 4.3 ClearUserAndComputer

Ends the simulation forced by a previous call of the automated function SetUserAndComputer.

#### 4.4 Close

Closes an open repository.

#### 4.5 Compare FileName [password] [outputFile]

Compares the current repository with another repository.

* The password parameter is mandatory, except when the parameter FileName refers to a directory (assumed to be MDS XML), in which case, it should not be used.
* If the file is in the directory of commandFile or the repository directory, FileName does not have to include the full path.
* If FileName does not include an extension, ".rpd" is assumed.
* If outputFile is not specified, the execution stops and the user is prompted for it.

#### 4.6 ConsistencyCheck [outputFileName]

Global consistency check.

#### 4.7 CreatePatch FileName [dummy] password outputFile

Create a diff-patch file by comparing the current repository with another repository.

* If FileName is a repository file which is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* If FileName is a repository file, but without the extension, ".rpd" is assumed as the extension.
* The dummy parameter is obsolete and allowed only for backwards compatibility.

Example of usage:

```
open new_northwind.rpd
createPatch original_northwind.rpd secret_password "C:\testdata\input\Modifications\Settings\Projects_users\patchfile.xml"
```

#### 4.8 CreateSubset NewRepositoryName MasterRepositoryName numberOfProjects project1 [project2 [project3 [...] [dummy] repositoryPassword

Creates and opens a multi-user subset repository.

* A new repository will be created in the repository directory, so you do not need to include a full path in NewRepositoryName.
* The master repository must be in a multi-user development directory. So you do not need to include a full path in MasterRepositoryName.
* The parameter numberOfProjects should be set to a number greater than or equal to 1.
* The dummy parameter is obsolete and allowed only for backwards compatibility.

#### 4.9 DeleteObject ObjectType FullyQualifiedObjectName

Deletes the specified object.

Note: ObjectType can be either type name (as shown in Query Repository dialog) or type id (number) as defined in analytics\server\include\objectmodel\SOTypeID.h

#### 4.10 DescribeRepository FullyQualifiedOutputFile Encoding

Writes to the file containing the description of a repository.

* The extension of FullyQualifiedOutputFile determines the output type:
  * .csv (comma-separated values)
  * .txt (tab-separated values)
  * .xml
* Encoding has three options:
  * ANSI
  * Unicode
  * UTF-8

#### 4.11 Drag ObjectType FullyQualifiedObjectName

Adds the object specified in the parameter FullyQualifiedObjectName to any objects selected for the drag and drop action.

Note: ObjectType can be either type name (as shown in Query Repository dialog) or type id (number) as defined in analytics\server\include\objectmodel\SOTypeID.h

#### 4.12 Drop {Yes|No} ObjectType FullyQualifiedObjectName

Drops the object(s) specified in previous Drag command(s) on the object specified.

* One or more Drag commands must precede a Drop command.

Note: ObjectType can be either type name (as shown in Query Repository dialog) or type id (number) as defined in analytics\server\include\objectmodel\SOTypeID.h

#### 4.13 Drop {Yes|No} {Presentation|"Business Model and Mapping"|Physical}

Drops the object(s) specified in previous Drag command(s) on the empty space of the view specified by second parameter.

* One or more Drag commands must precede a Drop command.
* The {Yes|No} parameter specifies whether objects should be copied or moved:
  * Yes = copy
  * No = move

#### 4.14 ExecuteQuery queryFile queryResultDirectory

Executes the queries defined in the file in the parameter queryFile. The query result(s) will be stored in the directory defined in the parameter queryResultDirectory. Each query has its own result file.

Example usage:

The contents of the query file. Lines that start with '#' are treated as comments. Test3 uses the name of a saved query object (its name in this example is Q1).

```
#test case 1

test1: (Name = "*") AND (Type = Logical Column) AND (((Related to = ((Type = Business Model) AND ((Has special icon = true) AND ((Name contains "abcd"))))) AND (Is aggregate = true)) AND (Logical Level = Logical Level "Paint"."MarketDim"."Region"))

# test case 2
test2: (Name = "*") AND (Type = Logical Column) AND (Is aggregate = true)

# test case 3
test3: Q1
```

The result file name is the text before the ":" with ".txt" as file type. In the above example, "test1.txt" and "test2.txt" are the result file names for the corresponding test cases.

#### 4.15 Exit

Closes the Administration Tool.

#### 4.16 ExternalizeStrings FullyQualifiedOutputFile Encoding [SubjectAreaName_1 [SubjectAreaName_2 [TargetLevelName_1]

Writes to the file defined the parameter FullyQualifiedOutput File the description of the objects for externalization.

* The extension of the filed defined in FullyQualifiedOutputFile determines the type of output:
  * .xml (XML format)
  * .csv (comma-separated values)
  * .txt (tab-separated values)
* Encoding - 3 options are available:
  * ANSI
  * Unicode
  * UTF-8

#### 4.17 GenerateMetadataDictionary DictRootDirectory

Generates the meta data dictionary.

* The parameter DictRootDirectory holds the directory in which to save the dictionary files.

#### 4.18 GenerateQueryTestCases outputFile [random_seed]

Generates some basic test cases for the query repository feature.

#### 4.19 Hide

Hides the Administration Tool.

#### 4.20 ImportDB {Yes|No} {"OracleWS"|"Siebel OM"|"OracleADF_HTTP"|"OCI 10g/11g"|"ODBC 2.0"|"ODBC 3.5"|"DB2 CLI (Unicode)"|XML|XMLA|AW} other_params

Initiates an import from the database.

* The first parameter determines whether it is an import from server (Yes) or local (No). At the moment, only local mode is supported.
* The other_params are according to connection type specified: 
  * "OracleWS" DSN UserName Password {Yes|No} Host(Gateway URL) WSDL(WSDL URL)
  * "OracleADF" DSN UserName Password {Yes|No} ApplicationID ServiceBean Host Port
  * "OracleADF_HTTP" DSN UserName Password {Yes|No} ApplicationName ApplicationConfig UR
  * "Siebel OM" DSN UserName Password {ODBC|OCI}
  * "OCI 10g/11g" DSN UserName Password {Yes|No}
  * "ODBC 2.0" DSN UserName Password {Yes|No}
  * "ODBC 3.5" DSN UserName Password {Yes|No}
  * "DB2 CLI (Unicode)" DSN UserName Password {Yes|No}
  * XML URL XSLT XPathExpression UserName Password
  * Essbase DSN ProviderType UserName Password [-NoUDAs ] [-ToFlatMeasures [-ToSingleHierarchyView ] [-CreateUDAColumns] [-CreateAliasColumns < alias table name> ]
  * AW DSN ProviderType UserName Password
  * XMLA URL ProviderType UserName PassWord
* The parameter {Yes|No} (last parameter inside other_params) is for Siebel Tables flag
* If the file is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* The default user is empty.
* The default password is empty.
* The default XSLT and XPathExpression are empty.
* The default Siebel Tables flag is No.

##### EssBase DB options:

* NoUDAs Do not import UDAs, default is to import UDAs.
* ToFlatMeasures Convert measure dimension to flat measures.
* ToSingleHierarchyView Convert to single hierarchy view.
* CreateUDAColumns Create columns for UDA.
* CreateAliasColumns  Create columns for Alias table.

Note: DB2 CLI Import is case-sensitive and so may be other import types

#### 4.21 ImportDBExecute {Yes|No} {Yes|No}

Executes the repository import defined by previous calls to ImportDB and ImportDBObject.

* For ADF only:
  * The first parameter determines whether it will import joined objects (Yes) or not (No). The default value is Yes.
  * The second parameter determines whether to go to the map to logical page for ADF extender (Yes) or not (No). The default value is No.

#### 4.22 ImportDBObject {Database|"Physical Catalog"|"Physical Schema"|"Physical Table"|"Physical Column"|"Physical Cube Table"|"Analytic Workspace"} list_of_names

Imports an object from the database (including all its children).

* The list_of_names parameter can be 0 to n names listed, from the name of a catalog down to the name of a column.
* When importing the whole database (i.e. everything), no name is needed.
* Do not list the root item in the import tree (left side of wizard window).

Examples of usage:

* SQLDB_Test:

  ```
  ImportDBObject "Physical Table" Test  dbo test
  ```

* XMLA:

  ```
  ImportDBObject "Physical Cube Table" "XXXXXXX"  Budget
  ```

#### 4.23 ImportDBSetTableType number

Sets the table type for import from the database.

* The table type is determined by the number, which is an OR combination of following values:

  Tables: 1
  Views: 2
  System tables: 4
  Aliases: 32
  Synonyms: 64

* If you do not call this function, the table type is set to 1 by default.
* This is not used for an XMLA import.

#### 4.24 ImportDBSetKeyImportType number

Set the key type for import from the database.

* The key type is determined by the number parameter, which is an OR combination of following values:

  Keys: 1
  Foreign keys: 2

* If you do not call this function, the table type is set to 3 by default.
* This is not used for an XMLA import.

#### 4.25 ImportRepository {Online|Offline} {FileName|DSNname} [user [password]]

Initiates an import from another repository.

* If the file is in the directory of commandFile or the repository directory, you do not have to include the path to it in the FileName parameter.
* The default value of user is 'Administrator'.
* The default value of password is null.

#### 4.26 ImportRepositoryExecute

Executes the repository import defined by preceding calls to ImportRepository and ImportRepositoryObject.

#### 4.27 ImportRepositoryObject {Project|"Presentation Catalog"|User|"Security Group"|Variable} {Name|*} [True|False [True|False]]

Imports object(s) from another repository.

* If * is used for the value of the name parameter, all objects of that type are imported.
* The boolean (true/false) parameters are: parent, children.
* The default value for both is False.

#### 4.28 LinkToSourceControl path/to/MDS-XML-Repo path/to/SCM-config.xml

This command makes the Administration tool associate the repository objects in memory with the MDS XML repository specified. It also puts this repository under source control using the provided SCM configuration file.  It is as if the memory objects always belonged to the MDS XML repository and are just waiting to be saved. In other words, using the Save command after a LinkToSourceControl command has the effect of delivering the memory objects to source control using the SCM commands defined in the configuration file.

For example an initial import to source control can be done with the following commands:

```
OpenOffline demo.rpd "Admin123"
LinkToSourceControl C:\DEMO C:\config\ade-conf.xml
Save
```

Repository objects defined in "demo.rpd" will be delivered to the MDS XML repository "C:\DEMO" using source control commands defined in "ade-conf.xml".

#### 4.29 Merge FileName1 FileName2 [DecisionFile] [dummy] password1 [dummy] password2 [{Yes|No}] [resultingFileName]

Merges three repositories into one.

* FileName1 represents the original repository.
* If FileName1 is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* FileName2 represents the modified repository
* If FileName2 is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* If either FileName1 or FileName2 are without an extension, ".rpd" is assumed as the extension.
* DecisionFile represents an existing .csv or .txt file; it has to be in the directory of commandFile or it has to have the full path.
* Password1 is the repository password for the repository in FileName1.
* Password2 is the repository password for the repository in FileName2.
* The Yes/No parameter specifies whether the "Equalize during merge" check box should be turned on. The default is No.
* The merge log is created in the TEMP directory.
* The dummy parameters are not used and allowed only for backwards compatibility.
* If the dummy parameters are specified, DecisionFile must be specified as well.

#### 4.30 MessageBox [message]

Displays the message box with the text given in the message parameter.

* The default values of message is "Siebel Analytics Administration Tool".

#### 4.31 MudCheckoutWholeRpd NewRepositoryName MasterRepositoryName repositoryPassword

Creates a whole repository multi-user checkout.

* The new repository will be created in the repository directory, so you do not have to include the full path to it.
* The master repository must be in the multi-user development directory, so the MasterRepositoryName parameter does not have to include the full path.

#### 4.32 New FileName [repositoryPassword]

Creates a new repository in offline mode.

* If the repository file is created in the repository directory, then the FileName parameter does not need to include the full path.
* If FileName does not include the file extension, ".rpd" is appended.

#### 4.33 OpenOffline Name [repositoryPassword]

Opens the repository in offline mode.

* If Name is an existing directory (i.e. MDS XML directory), the repositoryPassword paramater is skipped, otherwise it has to be specified.
* If Name is a repository file which is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* If Name is a repository file, but without the extension, ".rpd" is assumed as the extension.

#### 4.34 OpenOnline DSN user password repositoryPassword

It opens the repository in online mode.

#### 4.35 Open FileName dummyParameter repositoryPassword

Note: this command is obsolete and supported only for backwards compatibility. Use the OpenOffline command instead.

It opens the repository in offline mode.

* If Name is a repository file which is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* If Name is a repository file, but without the extension, ".rpd" is assumed as the extension.
* dummyParameter is not used, except it has to be specified if you want to use repositoryPassword parameter.
* The default repositoryPassword is null.

#### 4.36 Patch FileName1 FileName2 [DecisionFile] [dummy] password1 [password2 equalize [dummy dummy] [dummy dummy dummy]] 

Apply the patch and merge the repositories into one.

* FileName1 represents the patch xml file.
* If FileName1 is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* FileName2 represents the original repository.
* If FileName2 is in the repository directory or the directory of the commandFile, you do not have to include the full path to it.
* DecisionFile represents the existing .csv or .txt file, it must be in the directory of commandFile or include the full path to it.
* the merge log is created in the TEMP directory.
* The first dummy parameter is obsolete and allowed only for backwards compatibility.
* If the first dummy parameter is specified, DecisionFile must be specified as well.
* password2 represents the patchfile password.
* If password2 is specified, two dummy parameters should be specified to distinguish the patch file password case from other parameter combinations.
* The equalize parameter can be 'Yes' or 'No'. This parameter is specified if repositories equalization has to be done. If the parameter is not specified, equalization is not run.
* If equalize is specified, three dummy parameters should be specified to distinguish the equalize case from other parameter combinations.

Example usage:

```
open customer_test.rpd
patch "C:\testdata\input\Modifications\Settings\Projects_users\patchfile.xml" original_test.rpd decision_modified.csv secret Yes "" "" ""
```

#### 4.37 Publish [LockUserFullName]

MUD publish functionality.

* LockUserFullName is the full name of the user locking the Master repository.

#### 4.38 RefreshSubset password [decisionFile [{Yes|No}]]

Refreshes an already open subset repository with the latest changes from Master repository.

* The last parameter specifies whether "Equalize during merge" check box should be turned on.  The default value is No.

#### 4.39 Save

Saves an open repository.

#### 4.40 SaveAs FileName

Saves an oped repository under a new name.

* If FileName does not include a path,the directory of commandFile is used.

#### 4.41 SaveAsMdsXml DirectoryName

* Saves an open repository as MDS XML documents in the directory specified by DirectoryName.

#### 4.42 SetAutoConnectionPool fqName

Sets the connection pool to be used automatically with the following calls: UpdatePhysical, UpdateRowCount, SyncUsingConnectionPool and ViewData.

* The fqName parameter is the fully qualified name of the connection pool.

#### 4.43 SetIcon ObjectType FullyQualifiedObjectName IconNumber

Sets the icon of the specified object. Use 0 to remove the icon.

Note: ObjectType can be either type name (as shown in Query Repository dialog) or type id (number) as defined in analytics\server\include\objectmodel\SOTypeID.h

#### 4.44 SetMUDPath [dir]

Sets the Multiuser Development Directory (as specified in the user interface under the Tools/Options/Multiuser menu item).

* If the dir parameter is omitted, an empty path is set (i.e. no multi-user development).
* If the dir parameter contains a space, it has to be enclosed in double quotes.

#### 4.45 SetProperty ObjectType FullyQualifiedObjectName PropertyName PropertyValue

Sets the property of object to the specified value.

* It currently works only for connection pool (properties "DSN", "User", "Password" or "CallInterface"), variable (property "Initializer"), database (property "Database"), project (properties "AddPresentationObject" and "RemovePresentationObject") and initialization block (property "Disabled").
* For a connection pool's CallInterface property, use Default for the Default CLI interface. Do not use anything in the brackets. The AdministrationTool will automatically recalculate what is the default value.
* The PropertyValue for properties "AddPresentationObject" and "RemovePresentationObject" is VoidID of the object to be added to, or removed from, the presentation objects. PropertyValue for the property Disabled is either Yes or No.

Note: ObjectType can be either type name (as shown in Query Repository dialog) or type id (number) as defined in analytics\server\include\objectmodel\SOTypeID.h

#### 4.46 SetRowCountFile outputFileName

* Sets the file to which the log for calls of UpdateRowCount is written.
* The repository must be open when you call this command.

#### 4.47 SetUserAndComputer userName computerName

Simulates the situation as if the MUD function was performed on a different computer with a different user log in.

#### 4.48 SyncUsingConnectionPool {Yes|No} {Yes|No}

This command works for ADF databases only.

* The first parameter determines whether to import joined objects (Yes) or not (No). The default value is No.
* The second parameter determines whether to go to the map to logical 
  page for ADF extender (Yes) or not (No). The default value is No.

#### 4.49 TestExtender {ADF|Essbase} DBXUDMLFileName

This automation command is used to simulate the ADF or Essbase import by executing the database XUDML. It then tests the Extender functionality of mapping the Physical objects to Logical layer and then to 
Presentation Layer.

* The first parameter specifies if the database is of type"ADF" or "Essbase"  in the XUDML file.
* The second parameter specifies the path to the XUDML file which 
  needs to executed to simulate the import of the physical objects.

#### 4.50 TestInitBlock initBlockName FullyQualifiedOutputFile Encoding

Tests the connection to the specified init block.

* The results are written to the file specified in the FullyQualifiedOutputFile parameter.
* Encoding has three options:

  ​	ANSI
  ​	Unicode
  ​	UTF-8

#### 4.51 TestLdapServer ldapServerName outputFileName

Tests the connection to the LDAP server and writes the result to the file specified in outputFileName.

#### 4.52 UpdatePhysical [Database [ConnectionPool]]

Updates the physical layer.

* If SetAutoConnectionPool is called before this, and the Database and ConnectionPool parameters are empty, the previously set connection pool is used.
* The ConnectionPool parameter is necessary only if the specified Database contains more than one connection pool.
* The database parameter is necessary only if the repository contains more than one database.

#### 4.53 UpdateRowCount ["Physical Column"|"Physical Table"] fqName

Updates the row count for the specified item.

* The parameter, fqName, is the fully qualified name of the object.

#### 4.54 ViewData fqTableName [columnName_1 [columnName_2 ...[columnName_n]]]

View the data in the database.

* The parameter, fqTableName, must be the fully qualified table name.
* The column names are not fully qualified.
* If you want to view the data of the whole table (all columns) do not include any column names.
* If you want to see only a subset of the columns, add those column names after the fully qualified table name.
