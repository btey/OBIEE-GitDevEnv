C:\Oracle\OBIEE12c-Client\bi\bifoundation\server\bin\biserverxmlexec -D %1\MDSXML -O %1\..\Temp-Merge\original.rpd

comparerpd -P Admin123 -C %1\..\Temp-Merge\external.rpd -W Admin123 -G %1\..\Temp-Merge\original.rpd -D %1\..\Temp-Merge\patchrpd.xml

patchrpd -P Admin123 -C %1\..\Temp-Merge\external.rpd -Q Admin123 -G %1\..\Temp-Merge\original.rpd -I %1\..\Temp-Merge\patchrpd.xml -O %1\..\Temp-Merge\new_current.rpd

move %1\MDSXML %1\MDSXML_OLD

C:\Oracle\OBIEE12c-Client\bi\bifoundation\server\bin\biserverxmlgen -M -R %1\..\Temp-Merge\new_current.rpd -P Admin123 -D %1\MDSXML