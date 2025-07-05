import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_user_id", ["userId"], {})
@Entity("flagged_users", { schema: "wz12oseoex68yd4p" })
export class FlaggedUsers extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("enum", { name: "type", enum: ["personal", "business"] })
  type: "personal" | "business";

  @Column("text", { name: "reason" })
  reason: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("bigint", { name: "admin_id", unsigned: true })
  adminId: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
