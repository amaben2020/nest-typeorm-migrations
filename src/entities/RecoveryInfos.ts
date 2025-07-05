import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_user_id", ["userId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("recovery_infos", { schema: "wz12oseoex68yd4p" })
export class RecoveryInfos extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", {
    name: "user_id",
    nullable: true,
    unique: true,
    unsigned: true,
  })
  userId: string | null;

  @Column("varchar", { name: "recovery_code", nullable: true, length: 255 })
  recoveryCode: string | null;

  @Column("varchar", { name: "recovery_phone", nullable: true, length: 255 })
  recoveryPhone: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
