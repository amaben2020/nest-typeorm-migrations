import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration1751813102382 implements MigrationInterface {
    name = 'NewMigration1751813102382'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_brand_new\` int NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_brand_new\``);
    }

}
