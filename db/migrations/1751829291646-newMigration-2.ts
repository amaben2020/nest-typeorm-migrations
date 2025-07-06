import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration21751829291646 implements MigrationInterface {
    name = 'NewMigration21751829291646'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` DROP COLUMN \`is_Nice\``);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` ADD \`is_Nice\` int NULL`);
    }

}
