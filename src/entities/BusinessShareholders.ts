import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("business_id", ["businessId"], {})
@Entity("business_shareholders", { schema: "wz12oseoex68yd4p" })
export class BusinessShareholders extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "business_id", unsigned: true })
  businessId: string;

  @Column("varchar", { name: "name", length: 255 })
  name: string;

  @Column("varchar", { name: "address", nullable: true, length: 255 })
  address: string | null;

  @Column("varchar", { name: "phone", nullable: true, length: 255 })
  phone: string | null;

  @Column("varchar", { name: "date_of_birth", nullable: true, length: 255 })
  dateOfBirth: string | null;

  @Column("varchar", { name: "bvn", nullable: true, length: 25 })
  bvn: string | null;

  @Column("tinyint", {
    name: "verified",
    nullable: true,
    unsigned: true,
    default: () => "'0'",
  })
  verified: number | null;

  @Column("varchar", { name: "designation", nullable: true, length: 100 })
  designation: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
