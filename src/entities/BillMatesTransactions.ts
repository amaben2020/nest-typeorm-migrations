import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_created_at", ["createdAt"], {})
@Index("idx_status", ["status"], {})
@Index("idx_transaction_reference", ["transactionReference"], {})
@Index("idx_type", ["type"], {})
@Index("idx_user_id", ["userId"], {})
@Entity("bill_mates_transactions", { schema: "wz12oseoex68yd4p" })
export class BillMatesTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("decimal", {
    name: "amount",
    unsigned: true,
    precision: 15,
    scale: 2,
  })
  amount: string;

  @Column("enum", {
    name: "status",
    enum: ["successful", "pending", "failed", "in-progress", "processing"],
  })
  status: "successful" | "pending" | "failed" | "in-progress" | "processing";

  @Column("enum", {
    name: "type",
    enum: ["airtime", "data", "cable-tv", "power"],
  })
  type: "airtime" | "data" | "cable-tv" | "power";

  @Column("varchar", { name: "provider", nullable: true, length: 255 })
  provider: string | null;

  @Column("varchar", { name: "package", nullable: true, length: 255 })
  package: string | null;

  @Column("varchar", {
    name: "transaction_reference",
    nullable: true,
    length: 20,
  })
  transactionReference: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("varchar", { name: "receiver", nullable: true, length: 25 })
  receiver: string | null;
}
