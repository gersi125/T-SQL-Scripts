--We use the buffer pool extension to increase the efficiency of our database in collaboration with the ram.

ALTER SERVER CONFIGURATION 
SET BUFFER POOL EXTENSION ON
(FILENAME ='C:\TEMP\GVCache.bpe', SIZE = 12 GB);

SELECT * FROM sys.dm_os_buffer_pool_extension_configuration;

SELECT * FROM sys.dm_os_buffer_descriptors;

ALTER SERVER CONFIGURATION
SET BUFFER POOL EXTENSION OFF;
