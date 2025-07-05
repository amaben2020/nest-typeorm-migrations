import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("payments", { schema: "wz12oseoex68yd4p" })
export class Payments extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "transaction_id", length: 20 })
  transactionId: string;

  @Column("decimal", { name: "amount", precision: 15, scale: 2 })
  amount: string;

  @Column("varchar", { name: "response_body", length: 1000 })
  responseBody: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("varchar", { name: "account_number", length: 12 })
  accountNumber: string;
}
