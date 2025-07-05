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
@Index("receiver_id", ["receiverId"], {})
@Index("unique_transaction", ["userId", "transactionId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("dashme_transactions", { schema: "wz12oseoex68yd4p" })
export class DashmeTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("decimal", { name: "amount", precision: 15, scale: 2 })
  amount: string;

  @Column("varchar", { name: "order_reference", nullable: true, length: 50 })
  orderReference: string | null;

  @Column("varchar", {
    name: "transaction_id",
    nullable: true,
    unique: true,
    length: 20,
  })
  transactionId: string | null;

  @Column("bigint", { name: "receiver_id", nullable: true, unsigned: true })
  receiverId: string | null;

  @Column("varchar", { name: "receiver_name", nullable: true, length: 250 })
  receiverName: string | null;

  @Column("varchar", { name: "receiver_wallet", nullable: true, length: 20 })
  receiverWallet: string | null;

  @Column("varchar", { name: "sender_wallet", nullable: true, length: 300 })
  senderWallet: string | null;

  @Column("varchar", { name: "sender_name", nullable: true, length: 250 })
  senderName: string | null;

  @Column("enum", { name: "payment_mode", enum: ["blue-user", "phone"] })
  paymentMode: "blue-user" | "phone";

  @Column("datetime", { name: "due_date", nullable: true })
  dueDate: Date | null;

  @Column("enum", {
    name: "status",
    enum: ["pending", "sent", "successful", "failed", "reversed"],
    default: () => "'pending'",
  })
  status: "pending" | "sent" | "successful" | "failed" | "reversed";

  @Column("decimal", {
    name: "service_charge",
    precision: 10,
    scale: 2,
    default: () => "'0.00'",
  })
  serviceCharge: string;

  @Column("varchar", { name: "narration", nullable: true, length: 255 })
  narration: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("datetime", { name: "due_at" })
  dueAt: Date;
}
