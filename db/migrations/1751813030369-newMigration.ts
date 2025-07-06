import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration1751813030369 implements MigrationInterface {
    name = 'NewMigration1751813030369'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_brand_new\``);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_f2c2fb415138d89ce45146e5fe\` ON \`security_questions\` (\`user_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_a51f6f210c69af4e31800be5b1\` ON \`recovery_infos\` (\`user_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_b64043825b647234e0ae931644\` ON \`pins\` (\`user_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_e6343c7edaad580e600ba5ec75\` ON \`pilot_testers\` (\`email\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_c74be53456bd51c31ce9f06276\` ON \`pilot_testers\` (\`phone\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_9a8a82462cab47c73d25f49261\` ON \`notifications\` (\`user_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_bbfe1fa864841e82cff1be09e8\` ON \`kycs\` (\`user_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_95ba1f0f7266d2c6f945adb0c1\` ON \`dashme_transactions\` (\`transaction_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_199d242ff5da3a2c4e69bd8bd4\` ON \`business_wallets\` (\`wallet_id\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_b6efb89dc9d9a33223c221e98e\` ON \`business_users\` (\`phone\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_4aca6fb35fd3ce0f57cc6cdf89\` ON \`business_settlement_accounts\` (\`business_id\`)`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP INDEX \`IDX_4aca6fb35fd3ce0f57cc6cdf89\` ON \`business_settlement_accounts\``);
        await queryRunner.query(`DROP INDEX \`IDX_b6efb89dc9d9a33223c221e98e\` ON \`business_users\``);
        await queryRunner.query(`DROP INDEX \`IDX_199d242ff5da3a2c4e69bd8bd4\` ON \`business_wallets\``);
        await queryRunner.query(`DROP INDEX \`IDX_95ba1f0f7266d2c6f945adb0c1\` ON \`dashme_transactions\``);
        await queryRunner.query(`DROP INDEX \`IDX_bbfe1fa864841e82cff1be09e8\` ON \`kycs\``);
        await queryRunner.query(`DROP INDEX \`IDX_9a8a82462cab47c73d25f49261\` ON \`notifications\``);
        await queryRunner.query(`DROP INDEX \`IDX_c74be53456bd51c31ce9f06276\` ON \`pilot_testers\``);
        await queryRunner.query(`DROP INDEX \`IDX_e6343c7edaad580e600ba5ec75\` ON \`pilot_testers\``);
        await queryRunner.query(`DROP INDEX \`IDX_b64043825b647234e0ae931644\` ON \`pins\``);
        await queryRunner.query(`DROP INDEX \`IDX_a51f6f210c69af4e31800be5b1\` ON \`recovery_infos\``);
        await queryRunner.query(`DROP INDEX \`IDX_f2c2fb415138d89ce45146e5fe\` ON \`security_questions\``);
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_brand_new\` int NULL`);
    }

}
