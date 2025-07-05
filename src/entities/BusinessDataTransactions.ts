import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("fk_data_branch_id", ["branchId"], {})
@Index("fk_data_business_id", ["businessId"], {})
@Index("fk_data_staff_id", ["staffId"], {})
@Entity("business_data_transactions", { schema: "wz12oseoex68yd4p" })
export class BusinessDataTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;

  @Column("bigint", { name: "branch_id", nullable: true, unsigned: true })
  branchId: string | null;

  @Column("bigint", { name: "staff_id", nullable: true, unsigned: true })
  staffId: string | null;

  @Column("varchar", { name: "receiver", length: 20 })
  receiver: string;

  @Column("varchar", { name: "provider", length: 15 })
  provider: string;

  @Column("varchar", { name: "package", length: 100 })
  package: string;

  @Column("decimal", {
    name: "amount",
    nullable: true,
    precision: 12,
    scale: 2,
  })
  amount: string | null;

  @Column("varchar", { name: "payment_reference", nullable: true, length: 40 })
  paymentReference: string | null;

  @Column("varchar", { name: "customer_info", nullable: true, length: 100 })
  customerInfo: string | null;

  @Column("varchar", { name: "customer_name", nullable: true, length: 100 })
  customerName: string | null;

  @Column("enum", {
    name: "payment_mode",
    nullable: true,
    enum: ["wallet", "card"],
  })
  paymentMode: "wallet" | "card" | null;

  @Column("enum", {
    name: "status",
    enum: ["pending", "successful", "failed"],
    default: () => "'pending'",
  })
  status: "pending" | "successful" | "failed";

  @Column("varchar", { name: "transaction_id", length: 30 })
  transactionId: string;

  @Column("varchar", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @Column("varchar", { name: "provider_slug", nullable: true, length: 30 })
  providerSlug: string | null;

  @Column("varchar", { name: "access_token", nullable: true, length: 40 })
  accessToken: string | null;

  @Column("varchar", {
    name: "vend_request_body",
    nullable: true,
    length: 1000,
  })
  vendRequestBody: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "code", nullable: true, length: 10 })
  code: string | null;

  @Column("varchar", {
    name: "vend_response_body",
    nullable: true,
    length: 1500,
  })
  vendResponseBody: string | null;
}
