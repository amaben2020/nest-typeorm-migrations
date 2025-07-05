import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("unique_business_id", ["businessId"], { unique: true })
@Entity("business_settlement_accounts", { schema: "wz12oseoex68yd4p" })
export class BusinessSettlementAccounts extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("bigint", {
    name: "business_id",
    nullable: true,
    unique: true,
    unsigned: true,
  })
  businessId: string | null;

  @Column("bigint", { name: "bank_id", nullable: true })
  bankId: string | null;

  @Column("varchar", { name: "account_number", nullable: true, length: 20 })
  accountNumber: string | null;

  @Column("varchar", { name: "account_name", nullable: true, length: 255 })
  accountName: string | null;

  @Column("varchar", { name: "bank_name", length: 200 })
  bankName: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
