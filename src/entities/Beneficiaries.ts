import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("beneficiary_id", ["beneficiaryId"], {})
@Index("idx_business_id", ["businessId"], {})
@Index("user_id", ["userId"], {})
@Entity("beneficiaries", { schema: "wz12oseoex68yd4p" })
export class Beneficiaries extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("bigint", { name: "beneficiary_id", nullable: true, unsigned: true })
  beneficiaryId: string | null;

  @Column("varchar", { name: "identifier", length: 50 })
  identifier: string;

  @Column("enum", { name: "type", enum: ["phone", "blue-user"] })
  type: "phone" | "blue-user";

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("bigint", { name: "business_beneficiary", nullable: true })
  businessBeneficiary: string | null;

  @Column("varchar", { name: "name", nullable: true, length: 255 })
  name: string | null;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;
}
