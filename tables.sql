CREATE TABLE `storage_units` (
	`id` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`data` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`given_access` LONGTEXT NULL DEFAULT '{}' COLLATE 'utf8mb4_bin'
)
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;
