import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("irecharge_data_packages", { schema: "wz12oseoex68yd4p" })
export class IrechargeDataPackages extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "code", length: 20 })
  code: string;

  @Column("varchar", { name: "title", length: 100 })
  title: string;

  @Column("varchar", { name: "validity", nullable: true, length: 100 })
  validity: string | null;

  @Column("decimal", {
    name: "price",
    unsigned: true,
    precision: 12,
    scale: 2,
    default: () => "'0.00'",
  })
  price: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
