import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("paystack_banks", { schema: "wz12oseoex68yd4p" })
export class PaystackBanks extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "code", length: 20 })
  code: string;

  @Column("varchar", { name: "bank_code", nullable: true, length: 20 })
  bankCode: string | null;

  @Column("varchar", { name: "name", length: 150 })
  name: string;

  @Column("varchar", { name: "logo_url", nullable: true, length: 100 })
  logoUrl: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
