// ignore_for_file: constant_identifier_names

class DBQueries {
  static const INITIALIZE_TABLES = '''
    CREATE TABLE `monthlyPlans`(
    `id` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
    );
    CREATE TABLE `categories`(
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `name` VARCHAR(255) NOT NULL,
        `color` VARCHAR(255) NOT NULL,
        `type` INT NOT NULL
    );
    CREATE TABLE `typeOfOccurrence`(
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `description` VARCHAR(255) NOT NULL
    );
    CREATE TABLE `transactions`(
        `id` INT NOT NULL,
        `description` VARCHAR(255) NOT NULL,
        `value` DECIMAL(8, 2) NOT NULL,
        `startDate` DATETIME NOT NULL,
        `occurence` INT NOT NULL,
        `finishDate` DATETIME NULL,
        `parcel` INT NULL,
        `firstParcelId` INT NULL,
        `monthlyPlanId` VARCHAR(255) NOT NULL,
        `expirationDate` DATETIME NOT NULL,
        PRIMARY KEY(`id`)
    );
    CREATE TABLE `associatedCategories`(
        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `categoryId` INT NOT NULL,
        `cashFlowId` INT NOT NULL
    );
    ALTER TABLE
        `cashFlow` ADD CONSTRAINT `cashflow_occurence_foreign` FOREIGN KEY(`occurence`) REFERENCES `typeOfOccurrence`(`id`);
    ALTER TABLE
        `associatedCategories` ADD CONSTRAINT `associatedcategories_cashflowid_foreign` FOREIGN KEY(`cashFlowId`) REFERENCES `cashFlow`(`id`);
    ALTER TABLE
        `cashFlow` ADD CONSTRAINT `cashflow_monthlyplanid_foreign` FOREIGN KEY(`monthlyPlanId`) REFERENCES `MonthlyPlans`(`id`);
    ALTER TABLE
        `associatedCategories` ADD CONSTRAINT `associatedcategories_categoryid_foreign` FOREIGN KEY(`categoryId`) REFERENCES `categories`(`id`);
    ALTER TABLE
        `cashFlow` ADD CONSTRAINT `cashflow_firstparcelid_foreign` FOREIGN KEY(`firstParcelId`) REFERENCES `cashFlow`(`id`);
  ''';
}
