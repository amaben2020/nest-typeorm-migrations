import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("id", ["id"], { unique: true })
@Entity("__drizzle_migrations", { schema: "wz12oseoex68yd4p" })
export class DrizzleMigrations extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("text", { name: "hash" })
  hash: string;

  @Column("bigint", { name: "created_at", nullable: true })
  createdAt: string | null;
}
