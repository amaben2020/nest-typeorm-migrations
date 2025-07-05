import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("withdraw_credentials", { schema: "wz12oseoex68yd4p" })
export class WithdrawCredentials extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "token", length: 50 })
  token: string;

  @Column("datetime", { name: "token_ttl" })
  tokenTtl: Date;

  @Column("varchar", { name: "phone", nullable: true, length: 50 })
  phone: string | null;

  @Column("varchar", { name: "username", nullable: true, length: 50 })
  username: string | null;

  @Column("varchar", { name: "secret_pwd", nullable: true, length: 50 })
  secretPwd: string | null;

  @Column("varchar", { name: "secret_pin", nullable: true, length: 50 })
  secretPin: string | null;

  @Column("decimal", {
    name: "charge_rate",
    nullable: true,
    precision: 5,
    scale: 0,
  })
  chargeRate: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
