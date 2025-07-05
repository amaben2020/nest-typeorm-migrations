import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_created_at", ["createdAt"], {})
@Index("idx_payment_mode", ["paymentMode"], {})
@Index("idx_transaction_reference", ["transactionReference"], {})
@Index("user_id", ["userId"], {})
@Entity("transaction_histories", { schema: "wz12oseoex68yd4p" })
export class TransactionHistories extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("bigint", { name: "transaction_id", nullable: true, unsigned: true })
  transactionId: string | null;

  @Column("varchar", { name: "receiver_name", nullable: true, length: 250 })
  receiverName: string | null;

  @Column("decimal", {
    name: "amount",
    unsigned: true,
    precision: 15,
    scale: 2,
  })
  amount: string;

  @Column("enum", {
    name: "status",
    enum: ["successful", "pending", "failed", "in-progress", "refunded"],
  })
  status: "successful" | "pending" | "failed" | "in-progress" | "refunded";

  @Column("enum", {
    name: "payment_mode",
    enum: [
      "blue-user",
      "phone",
      "wallet_topup",
      "offline",
      "withdrawal",
      "card",
      "bank-transfer",
      "airtime",
      "data",
      "power",
      "cable-tv",
    ],
  })
  paymentMode:
    | "blue-user"
    | "phone"
    | "wallet_topup"
    | "offline"
    | "withdrawal"
    | "card"
    | "bank-transfer"
    | "airtime"
    | "data"
    | "power"
    | "cable-tv";

  @Column("enum", { name: "type", enum: ["credit", "debit"] })
  type: "credit" | "debit";

  @Column("varchar", { name: "sender_name", nullable: true, length: 100 })
  senderName: string | null;

  @Column("enum", {
    name: "client_used",
    enum: ["desktop", "mobile"],
    default: () => "'mobile'",
  })
  clientUsed: "desktop" | "mobile";

  @Column("varchar", {
    name: "transaction_reference",
    nullable: true,
    length: 20,
  })
  transactionReference: string | null;

  @Column("decimal", {
    name: "service_charge",
    precision: 10,
    scale: 2,
    default: () => "'0.00'",
  })
  serviceCharge: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("bigint", { name: "employee_id", nullable: true })
  employeeId: string | null;

  @Column("decimal", {
    name: "balance_before",
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  balanceBefore: string;

  @Column("decimal", {
    name: "balance_after",
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  balanceAfter: string;

  @Column("varchar", { name: "app", nullable: true, length: 100 })
  app: string | null;

  @Column("varchar", { name: "narration", nullable: true, length: 300 })
  narration: string | null;
}
