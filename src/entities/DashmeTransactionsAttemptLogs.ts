import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("user_id", ["userId", "action", "createdAt"], {})
@Entity("dashme_transactions_attempt_logs", { schema: "wz12oseoex68yd4p" })
export class DashmeTransactionsAttemptLogs extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", { name: "user_id" })
  userId: number;

  @Column("varchar", { name: "transaction_id", length: 255 })
  transactionId: string;

  @Column("enum", {
    name: "action",
    enum: ["accept", "decline", "initiate", "confirm"],
  })
  action: "accept" | "decline" | "initiate" | "confirm";

  @Column("varchar", { name: "ip_address", length: 45 })
  ipAddress: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;
}
