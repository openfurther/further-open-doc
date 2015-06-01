/*
Peter Mo 20150410
MDR System Seed Data DML
We can switch the first 3 records around and do AssetType first, Namespace Second, System third, or any order… think about it!
The first 3 rows are interdependent, so be sure to Disable FKs before running the Insert Statements!
The following insert statements are created by the MDR_System_Asset.xls file.
*/


/* Disable FKs First! */
ALTER TABLE ASSET 
    DISABLE CONSTRAINT ASSET_NAMESPACE_ASSET_ID_FK;
ALTER TABLE ASSET 
    DISABLE CONSTRAINT ASSET_TYPE_ASSET_ID_FK;

/* Empty System Namespace if Necessary *
/*
DELETE FROM FMDR.ASSET
 WHERE ASSET_NAMESPACE_ASSET_ID = 10000;

COMMIT;
*/

/* Insert System Seed Data - May need REFRESH From Excel Spreadsheet */
insert into fmdr.asset values (10000,10000,10001,'System',sysdate,null,'This is the System Shared Namespace.');
insert into fmdr.asset values (10001,10000,10002,'MDR Namespace',sysdate,null,'This will be the Asset Type for MDR Namespace Assets.');
insert into fmdr.asset values (10002,10000,10002,'Asset Type',sysdate,null,'Asset Type as an Asset');
insert into fmdr.asset values (10003,10000,10002,'Physical Class',sysdate,null,'Physical Java Class Name');
insert into fmdr.asset values (10004,10000,10002,'Class Attribute',sysdate,null,'Java Class Attribute');
insert into fmdr.asset values (10005,10000,10002,'Association',sysdate,null,'Asset Associations');
insert into fmdr.asset values (10006,10000,10005,'hasAttribute',sysdate,null,'Java Classes has Attributes Association Relationship');
insert into fmdr.asset values (10007,10000,10005,'translatesTo',sysdate,null,'Asset Translates To another Asset, usually in another namespace or data model.');
insert into fmdr.asset values (10008,10000,10002,'XQuery Resources',sysdate,null,'XQuery Files');
insert into fmdr.asset values (10009,10000,10002,'Terminology Namespace',sysdate,null,'Terminology Namespace such as Apelon DTS Namespace IDs');
insert into fmdr.asset values (10010,10000,10002,'Data Source',sysdate,null,'This will be the Asset Type for Data Source Assets such as Enterprise Data Warehouse.');
insert into fmdr.asset values (10011,10000,10002,'Java Data Type',sysdate,null,'Java Class Field Data Type');
insert into fmdr.asset values (99999,10000,10002,'devNull',sysdate,null,'Support Assets that translatesTo Nothing');

commit;


/* Re-Enable FKs */
ALTER TABLE ASSET 
     ENABLE CONSTRAINT ASSET_NAMESPACE_ASSET_ID_FK;
ALTER TABLE ASSET
     ENABLE CONSTRAINT ASSET_TYPE_ASSET_ID_FK;

/* Verify Data is there */
SELECT *
  FROM ASSET
 WHERE ASSET_NAMESPACE_ASSET_ID = 10000
 ORDER BY ASSET_ID;

/* Active Assets Only View */
SELECT *
  FROM ASSET_V
 WHERE ASSET_NAMESPACE_ASSET_ID = 10000
 ORDER BY ASSET_ID;
