The **main** branch will always contain the production code.

There should be a branch named **Release%** for each release that is intented to go live.
Code changes should be made in a branch named **Build%**, and this branch should be created from the corresponding release branch.

**Folder structure**

📁 log
This folder will contains all the logs related with the release application or even the rollback

📁 release
This folder will contains all the logs related with the release application or even the rollback
  
  📁📁 ddl
  All the database objects (packages, procedures, tables, etc) will be versioned here.

  📁📁 dml
  Scripts

  📁📁 rollback
  Rollback objects for the release

📁 releaseb0
This folder will contains the objects related to edition creation

📁 zipfiles
This folder will contain all the zip files generated for the releases
