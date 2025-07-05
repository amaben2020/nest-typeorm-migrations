import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_transaction_reference", ["transactionReference"], {})
@Index(
  "unique_user_transaction_type",
  ["userId", "type", "transactionReference"],
  { unique: true }
)
@Index("wallet_id", ["walletId"], {})
@Index("ws_idx_created_at", ["createdAt"], {})
@Index("ws_idx_type", ["type"], {})
@Index("ws_idx_user_id", ["userId"], {})
@Entity("wallet_snapshots", { schema: "wz12oseoex68yd4p" })
export class WalletSnapshots extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("bigint", { name: "wallet_id", unsigned: true })
  walletId: string;

  @Column("decimal", { name: "amount", precision: 15, scale: 2 })
  amount: string;

  @Column("decimal", { name: "balance_before", precision: 15, scale: 2 })
  balanceBefore: string;

  @Column("decimal", { name: "balance_after", precision: 15, scale: 2 })
  balanceAfter: string;

  @Column("enum", { name: "type", enum: ["credit", "debit"] })
  type: "credit" | "debit";

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", {
    name: "transaction_reference",
    nullable: true,
    length: 20,
  })
  transactionReference: string | null;

  @Column("tinyint", {
    name: "is_new",
    nullable: true,
    width: 1,
    default: () => "'1'",
  })
  isNew: boolean | null;
}
