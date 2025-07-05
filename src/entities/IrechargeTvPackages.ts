import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("irecharge_tv_packages", { schema: "wz12oseoex68yd4p" })
export class IrechargeTvPackages extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "title", length: 100 })
  title: string;

  @Column("varchar", { name: "network", length: 15 })
  network: string;

  @Column("decimal", {
    name: "price",
    nullable: true,
    unsigned: true,
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  price: string | null;

  @Column("varchar", { name: "code", length: 100 })
  code: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
