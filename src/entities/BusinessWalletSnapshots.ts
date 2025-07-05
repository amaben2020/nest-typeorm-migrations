import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("fk_walletsnapshot_history_business_id", ["businessId"], {})
@Index("unique_bus_snapshot", ["businessId", "transactionId"], { unique: true })
@Entity("business_wallet_snapshots", { schema: "wz12oseoex68yd4p" })
export class BusinessWalletSnapshots extends BaseEntity {
  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;

  @Column("enum", { name: "type", enum: ["credit", "debit"] })
  type: "credit" | "debit";

  @Column("datetime", {
    name: "created_at",
    default: () => "'CURRENT_TIMESTAMP(6)'",
  })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    default: () => "'CURRENT_TIMESTAMP(6)'",
  })
  updatedAt: Date;

  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("varchar", { name: "transaction_id", length: 20 })
  transactionId: string;

  @Column("int", { name: "wallet_id" })
  walletId: number;

  @Column("decimal", {
    name: "amount",
    nullable: true,
    precision: 12,
    scale: 2,
  })
  amount: string | null;

  @Column("decimal", {
    name: "balance_before",
    nullable: true,
    precision: 12,
    scale: 2,
  })
  balanceBefore: string | null;

  @Column("decimal", {
    name: "balance_after",
    nullable: true,
    precision: 12,
    scale: 2,
  })
  balanceAfter: string | null;
}
