import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("user_id", ["userId"], {})
@Entity("bill_mates_favourites", { schema: "wz12oseoex68yd4p" })
export class BillMatesFavourites extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("bigint", { name: "provider_id", nullable: true, unsigned: true })
  providerId: string | null;

  @Column("enum", {
    name: "provider_type",
    enum: [
      "power_providers",
      "data_providers",
      "tv_providers",
      "airtime_providers",
    ],
  })
  providerType:
    | "power_providers"
    | "data_providers"
    | "tv_providers"
    | "airtime_providers";

  @Column("varchar", { name: "receiver", length: 150 })
  receiver: string;

  @Column("varchar", { name: "name", length: 255 })
  name: string;

  @Column("varchar", { name: "slug", nullable: true, length: 255 })
  slug: string | null;

  @Column("varchar", { name: "state", nullable: true, length: 255 })
  state: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "meter_category", nullable: true, length: 100 })
  meterCategory: string | null;
}
