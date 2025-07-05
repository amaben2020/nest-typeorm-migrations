import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("business_id", ["businessId"], {})
@Entity("business_branches", { schema: "wz12oseoex68yd4p" })
export class BusinessBranches extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;

  @Column("varchar", { name: "name", nullable: true, length: 150 })
  name: string | null;

  @Column("varchar", { name: "staff_size", nullable: true, length: 20 })
  staffSize: string | null;

  @Column("varchar", { name: "location", nullable: true, length: 255 })
  location: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("tinyint", { name: "is_active", width: 1, default: () => "'1'" })
  isActive: boolean;
}
