import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("business_fees", { schema: "wz12oseoex68yd4p" })
export class BusinessFees extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;

  @Column("decimal", { name: "withdrawal", precision: 10, scale: 2 })
  withdrawal: string;

  @Column("decimal", { name: "bill_payment", precision: 10, scale: 2 })
  billPayment: string;

  @Column("decimal", { name: "transfers", precision: 10, scale: 2 })
  transfers: string;

  @Column("decimal", { name: "blue_to_blue", precision: 10, scale: 2 })
  blueToBlue: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", { name: "updated_at", nullable: true })
  updatedAt: Date | null;
}
