import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("tv_providers", { schema: "wz12oseoex68yd4p" })
export class TvProviders extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "name", length: 80 })
  name: string;

  @Column("varchar", { name: "slug", length: 10 })
  slug: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("varchar", { name: "image", length: 200 })
  image: string;
}
