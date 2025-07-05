import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("tv_packages", { schema: "wz12oseoex68yd4p" })
export class TvPackages extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "provider", length: 10 })
  provider: string;

  @Column("varchar", { name: "code", length: 20 })
  code: string;

  @Column("varchar", { name: "name", length: 100 })
  name: string;

  @Column("decimal", {
    name: "amount",
    unsigned: true,
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  amount: string;

  @Column("datetime", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;
}
