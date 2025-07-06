import { MigrationInterface, QueryRunner } from "typeorm";

export class NewMigration1751817258179 implements MigrationInterface {
    name = 'NewMigration1751817258179'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` CHANGE \`is_brand_new\` \`is_brand_news\` int NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`usersTest\` CHANGE \`is_brand_news\` \`is_brand_new\` int NULL`);
    }

}
