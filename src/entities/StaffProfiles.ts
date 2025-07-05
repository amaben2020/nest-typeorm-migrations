import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("staff_profiles_branch_fk", ["branchId"], {})
@Index("staff_profiles_business_id_fk", ["businessId"], {})
@Index("UQ_6d4c6c0b447e39147b4a6dcbede", ["id"], { unique: true })
@Entity("staff_profiles", { schema: "wz12oseoex68yd4p" })
export class StaffProfiles extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true })
  userId: string | null;

  @Column("varchar", { name: "name", length: 255 })
  name: string;

  @Column("varchar", { name: "phone", length: 150 })
  phone: string;

  @Column("varchar", { name: "password", length: 200 })
  password: string;

  @Column("varchar", {
    name: "password_changed_at",
    nullable: true,
    length: 50,
  })
  passwordChangedAt: string | null;

  @Column("tinyint", { name: "is_active", width: 1, default: () => "'1'" })
  isActive: boolean;

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

  @Column("bigint", { name: "owner_id", nullable: true })
  ownerId: string | null;

  @Column("enum", { name: "role", enum: ["admin", "cashier"] })
  role: "admin" | "cashier";

  @Column("bigint", { name: "branch_id", nullable: true, unsigned: true })
  branchId: string | null;

  @Column("varchar", { name: "display_picture", nullable: true, length: 255 })
  displayPicture: string | null;

  @Column("varchar", { name: "branch_name", nullable: true, length: 255 })
  branchName: string | null;

  @Column("bigint", { name: "business_id", nullable: true, unsigned: true })
  businessId: string | null;
}
