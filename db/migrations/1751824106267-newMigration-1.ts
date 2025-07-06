import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration11751824106267 implements MigrationInterface {
    name = 'NewMigration11751824106267'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_Nice\` int NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_Nice\``);
    }

}
