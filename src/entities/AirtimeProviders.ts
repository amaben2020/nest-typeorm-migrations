import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("airtime_providers", { schema: "wz12oseoex68yd4p" })
export class AirtimeProviders extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "name", length: 20 })
  name: string;

  @Column("varchar", { name: "slug", length: 20 })
  slug: string;

  @Column("varchar", { name: "image", length: 200 })
  image: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
