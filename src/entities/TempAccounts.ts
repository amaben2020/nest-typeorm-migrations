import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("temp_accounts", { schema: "wz12oseoex68yd4p" })
export class TempAccounts extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "reference", length: 50 })
  reference: string;

  @Column("varchar", { name: "account_name", length: 100 })
  accountName: string;

  @Column("varchar", { name: "account_number", length: 50 })
  accountNumber: string;

  @Column("varchar", { name: "bank_id", length: 50 })
  bankId: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("varchar", { name: "bank_name", length: 200 })
  bankName: string;
}
