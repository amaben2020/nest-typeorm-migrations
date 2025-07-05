import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("ussd_withdrawals", { schema: "wz12oseoex68yd4p" })
export class UssdWithdrawals extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "bank_code", nullable: true, length: 20 })
  bankCode: string | null;

  @Column("varchar", { name: "phone_number", nullable: true, length: 20 })
  phoneNumber: string | null;

  @Column("varchar", { name: "account_number", nullable: true, length: 20 })
  accountNumber: string | null;

  @Column("varchar", { name: "session_id", nullable: true, length: 150 })
  sessionId: string | null;

  @Column("decimal", { name: "amount", precision: 8, scale: 2 })
  amount: string;

  @Column("varchar", { name: "account_info", nullable: true, length: 200 })
  accountInfo: string | null;

  @Column("varchar", { name: "transaction_id", nullable: true, length: 40 })
  transactionId: string | null;

  @Column("varchar", { name: "reference", nullable: true, length: 50 })
  reference: string | null;

  @Column("enum", {
    name: "status",
    enum: ["in-progress", "pending", "successful", "failed"],
    default: () => "'pending'",
  })
  status: "in-progress" | "pending" | "successful" | "failed";

  @Column("varchar", {
    name: "verification_request_body",
    nullable: true,
    length: 500,
  })
  verificationRequestBody: string | null;

  @Column("varchar", {
    name: "verification_response_body",
    nullable: true,
    length: 1000,
  })
  verificationResponseBody: string | null;

  @Column("varchar", {
    name: "transfer_request_body",
    nullable: true,
    length: 500,
  })
  transferRequestBody: string | null;

  @Column("varchar", {
    name: "transfer_response_body",
    nullable: true,
    length: 1000,
  })
  transferResponseBody: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
