import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("data_packages", { schema: "wz12oseoex68yd4p" })
export class DataPackages extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "code", length: 20 })
  code: string;

  @Column("varchar", { name: "name", length: 100 })
  name: string;

  @Column("decimal", {
    name: "amount",
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  amount: string;

  @Column("varchar", { name: "validity", nullable: true, length: 100 })
  validity: string | null;

  @Column("varchar", { name: "provider", length: 10 })
  provider: string;

  @Column("datetime", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("varchar", { name: "provider_slug", length: 10 })
  providerSlug: string;
}
