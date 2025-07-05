import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("fk_power_branch_id", ["branchId"], {})
@Index("fk_power_business_id", ["businessId"], {})
@Index("fk_power_staff_id", ["staffId"], {})
@Entity("business_power_transactions", { schema: "wz12oseoex68yd4p" })
export class BusinessPowerTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;

  @Column("bigint", { name: "branch_id", nullable: true, unsigned: true })
  branchId: string | null;

  @Column("bigint", { name: "staff_id", nullable: true, unsigned: true })
  staffId: string | null;

  @Column("enum", { name: "meter_type", enum: ["prepaid", "postpaid"] })
  meterType: "prepaid" | "postpaid";

  @Column("varchar", { name: "receiver", length: 15 })
  receiver: string;

  @Column("varchar", { name: "provider", length: 80 })
  provider: string;

  @Column("decimal", {
    name: "amount",
    nullable: true,
    precision: 12,
    scale: 2,
  })
  amount: string | null;

  @Column("varchar", { name: "units", nullable: true, length: 20 })
  units: string | null;

  @Column("varchar", { name: "token", nullable: true, length: 30 })
  token: string | null;

  @Column("varchar", { name: "payment_reference", nullable: true, length: 40 })
  paymentReference: string | null;

  @Column("varchar", { name: "customer_info", nullable: true, length: 100 })
  customerInfo: string | null;

  @Column("varchar", { name: "customer_name", nullable: true, length: 100 })
  customerName: string | null;

  @Column("enum", {
    name: "meter_category",
    nullable: true,
    enum: ["MD", "NON-MD"],
  })
  meterCategory: "MD" | "NON-MD" | null;

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

  @Column("varchar", { name: "access_token", nullable: true, length: 40 })
  accessToken: string | null;

  @Column("varchar", {
    name: "vend_request_body",
    nullable: true,
    length: 1000,
  })
  vendRequestBody: string | null;

  @Column("varchar", { name: "transaction_id", length: 30 })
  transactionId: string;

  @Column("varchar", { name: "phone", nullable: true, length: 15 })
  phone: string | null;

  @Column("varchar", { name: "slug", nullable: true, length: 30 })
  slug: string | null;

  @Column("varchar", { name: "minimum_amount", nullable: true, length: 20 })
  minimumAmount: string | null;

  @Column("decimal", {
    name: "service_charge",
    nullable: true,
    precision: 10,
    scale: 2,
    default: () => "'100.00'",
  })
  serviceCharge: string | null;

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

  @Column("varchar", { name: "kct_1", nullable: true, length: 100 })
  kct_1: string | null;

  @Column("varchar", { name: "kct_2", nullable: true, length: 100 })
  kct_2: string | null;

  @Column("varchar", {
    name: "vend_response_body",
    nullable: true,
    length: 1500,
  })
  vendResponseBody: string | null;
}
