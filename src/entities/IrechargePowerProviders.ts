import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("irecharge_power_providers", { schema: "wz12oseoex68yd4p" })
export class IrechargePowerProviders extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "description", length: 100 })
  description: string;

  @Column("varchar", { name: "slug", length: 15 })
  slug: string;

  @Column("varchar", { name: "code", length: 100 })
  code: string;

  @Column("decimal", {
    name: "minimum_value",
    nullable: true,
    unsigned: true,
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  minimumValue: string | null;

  @Column("decimal", {
    name: "maximum_value",
    nullable: true,
    unsigned: true,
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  maximumValue: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
