import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration1751816247626 implements MigrationInterface {
    name = 'NewMigration1751816247626'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_new\``);
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_old\``);
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_brand_new\` int NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_brand_new\``);
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_old\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_new\` int NULL`);
    }

}
