import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("business_id", ["businessId"], {})
@Index("wallet_id", ["walletId"], {})
@Entity("business_wallet_accounts", { schema: "wz12oseoex68yd4p" })
export class BusinessWalletAccounts extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", unsigned: true })
  businessId: string;

  @Column("bigint", { name: "wallet_id", unsigned: true })
  walletId: string;

  @Column("tinyint", { name: "status", unsigned: true, default: () => "'0'" })
  status: number;

  @Column("varchar", { name: "account_number", nullable: true, length: 50 })
  accountNumber: string | null;

  @Column("varchar", { name: "account_name", nullable: true, length: 50 })
  accountName: string | null;

  @Column("varchar", { name: "bank_name", nullable: true, length: 250 })
  bankName: string | null;

  @Column("varchar", { name: "reference_number", length: 100 })
  referenceNumber: string;

  @Column("varchar", { name: "request_body", nullable: true, length: 1000 })
  requestBody: string | null;

  @Column("varchar", { name: "response_body", nullable: true, length: 1000 })
  responseBody: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
