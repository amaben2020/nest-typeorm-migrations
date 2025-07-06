import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration31751836279244 implements MigrationInterface {
    name = 'NewMigration31751836279244'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_brand_news\``);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_brand_news\` int NULL`);
    }

}
