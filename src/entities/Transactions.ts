import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_created_at", ["createdAt"], {})
@Index("idx_payment_mode", ["paymentMode"], {})
@Index("idx_status", ["status"], {})
@Index("idx_transaction_id", ["transactionId"], { unique: true })
@Index("unique_transaction", ["userId", "transactionId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("transactions", { schema: "wz12oseoex68yd4p" })
export class Transactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("decimal", { name: "amount", precision: 15, scale: 2 })
  amount: string;

  @Column("varchar", { name: "order_reference", nullable: true, length: 50 })
  orderReference: string | null;

  @Column("varchar", { name: "receiver_name", nullable: true, length: 250 })
  receiverName: string | null;

  @Column("varchar", { name: "receiver_wallet", nullable: true, length: 20 })
  receiverWallet: string | null;

  @Column("varchar", { name: "sender_name", nullable: true, length: 300 })
  senderName: string | null;

  @Column("enum", {
    name: "payment_mode",
    enum: [
      "blue-user",
      "phone",
      "offline",
      "withdrawal",
      "wallet_topup",
      "card",
      "bank_transfer",
    ],
  })
  paymentMode:
    | "blue-user"
    | "phone"
    | "offline"
    | "withdrawal"
    | "wallet_topup"
    | "card"
    | "bank_transfer";

  @Column("enum", {
    name: "client_used",
    nullable: true,
    enum: ["desktop", "mobile"],
    default: () => "'mobile'",
  })
  clientUsed: "desktop" | "mobile" | null;

  @Column("datetime", { name: "due_date", nullable: true })
  dueDate: Date | null;

  @Column("enum", {
    name: "status",
    enum: ["in-progress", "pending", "successful", "failed", "reversed"],
    default: () => "'pending'",
  })
  status: "in-progress" | "pending" | "successful" | "failed" | "reversed";

  @Column("varchar", {
    name: "transaction_id",
    nullable: true,
    unique: true,
    length: 20,
  })
  transactionId: string | null;

  @Column("decimal", {
    name: "service_charge",
    precision: 10,
    scale: 2,
    default: () => "'0.00'",
  })
  serviceCharge: string;

  @Column("varchar", { name: "email", nullable: true, length: 255 })
  email: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("bigint", { name: "employee_id", nullable: true })
  employeeId: string | null;

  @Column("varchar", { name: "narration", nullable: true, length: 255 })
  narration: string | null;

  @Column("varchar", { name: "request_body", nullable: true, length: 1000 })
  requestBody: string | null;

  @Column("varchar", { name: "response_body", nullable: true, length: 10000 })
  responseBody: string | null;

  @Column("varchar", {
    name: "verification_request",
    nullable: true,
    length: 1000,
  })
  verificationRequest: string | null;

  @Column("varchar", {
    name: "verification_response",
    nullable: true,
    length: 1000,
  })
  verificationResponse: string | null;

  @Column("varchar", { name: "ip", nullable: true, length: 20 })
  ip: string | null;

  @Column("enum", {
    name: "receiver_type",
    nullable: true,
    enum: ["personal", "business", "business-personal"],
  })
  receiverType: "personal" | "business" | "business-personal" | null;

  @Column("varchar", { name: "sent_by", nullable: true, length: 20 })
  sentBy: string | null;

  @Column("bigint", { name: "branch_id", nullable: true })
  branchId: string | null;
}
