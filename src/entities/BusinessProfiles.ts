import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("fk_b_user_id", ["bUserId"], {})
@Index("UQ_29525485b1db8e87caf6a5ef042", ["id"], { unique: true })
@Entity("business_profiles", { schema: "wz12oseoex68yd4p" })
export class BusinessProfiles extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id" })
  userId: string;

  @Column("varchar", { name: "name", nullable: true, length: 255 })
  name: string | null;

  @Column("varchar", { name: "description", nullable: true, length: 255 })
  description: string | null;

  @Column("int", { name: "staff_size_min", nullable: true })
  staffSizeMin: number | null;

  @Column("int", { name: "staff_size_max", nullable: true })
  staffSizeMax: number | null;

  @Column("varchar", { name: "logo", nullable: true, length: 255 })
  logo: string | null;

  @Column("varchar", { name: "state", nullable: true, length: 50 })
  state: string | null;

  @Column("varchar", { name: "address", nullable: true, length: 255 })
  address: string | null;

  @Column("varchar", { name: "city", nullable: true, length: 50 })
  city: string | null;

  @Column("varchar", { name: "lga", nullable: true, length: 80 })
  lga: string | null;

  @Column("int", { name: "level", default: () => "'0'" })
  level: number;

  @Column("datetime", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date;

  @Column("varchar", { name: "cac_number", nullable: true, length: 50 })
  cacNumber: string | null;

  @Column("varchar", { name: "staff_size", nullable: true, length: 100 })
  staffSize: string | null;

  @Column("bigint", { name: "b_user_id", nullable: true, unsigned: true })
  bUserId: string | null;

  @Column("varchar", { name: "bvn", nullable: true, length: 20 })
  bvn: string | null;

  @Column("varchar", { name: "category", length: 100 })
  category: string;
}
