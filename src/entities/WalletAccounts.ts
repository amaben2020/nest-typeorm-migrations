import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_bank_name", ["bankName"], {})
@Index("user_id", ["userId"], {})
@Index("wallet_id", ["walletId"], {})
@Entity("wallet_accounts", { schema: "wz12oseoex68yd4p" })
export class WalletAccounts extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

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

  @Column("varchar", { name: "response_body", nullable: true, length: 3000 })
  responseBody: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "bank_logo", nullable: true, length: 255 })
  bankLogo: string | null;

  @Column("varchar", { name: "provider_tag", nullable: true, length: 250 })
  providerTag: string | null;
}
