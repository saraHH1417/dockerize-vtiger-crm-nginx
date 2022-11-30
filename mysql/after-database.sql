update vtiger_users set user_password = '${mysqlPWD}', crypt_type = '' where id = '1';
UPDATE vtiger_users SET accesskey = UPPER(SUBSTRING(MD5(RAND()) FROM 1 FOR 16)) WHERE id = 1;
TRUNCATE vtiger_crmsetup;
TRUNCATE vtiger_loginhistory;