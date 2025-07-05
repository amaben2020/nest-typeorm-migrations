import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("bank_id", ["bankId"], {})
@Index("idx_user_id", ["userId"], { unique: true })
@Entity("user_accounts", { schema: "wz12oseoex68yd4p" })
export class UserAccounts extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unique: true, unsigned: true })
  userId: string;

  @Column("bigint", { name: "bank_id", unsigned: true })
  bankId: string;

  @Column("varchar", { name: "account_number", nullable: true, length: 255 })
  accountNumber: string | null;

  @Column("varchar", { name: "account_name", nullable: true, length: 255 })
  accountName: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "bank_name", length: 50 })
  bankName: string;
}
