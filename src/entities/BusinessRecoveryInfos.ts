import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("user_id", ["userId"], {})
@Entity("business_recovery_infos", { schema: "wz12oseoex68yd4p" })
export class BusinessRecoveryInfos extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("varchar", { name: "recovery_code", nullable: true, length: 40 })
  recoveryCode: string | null;

  @Column("varchar", { name: "recovery_phone", nullable: true, length: 20 })
  recoveryPhone: string | null;

  @Column("datetime", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("bigint", { name: "business_id" })
  businessId: string;
}
