import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_user_id", ["userId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("notifications", { schema: "wz12oseoex68yd4p" })
export class Notifications extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", {
    name: "user_id",
    nullable: true,
    unique: true,
    unsigned: true,
  })
  userId: string | null;

  @Column("tinyint", {
    name: "status",
    nullable: true,
    unsigned: true,
    default: () => "'0'",
  })
  status: number | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
