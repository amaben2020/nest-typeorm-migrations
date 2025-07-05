import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("blue_admins", { schema: "wz12oseoex68yd4p" })
export class BlueAdmins extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "first_name", length: 100 })
  firstName: string;

  @Column("varchar", { name: "last_name", length: 100 })
  lastName: string;

  @Column("varchar", { name: "email", length: 255 })
  email: string;

  @Column("varchar", { name: "password", length: 255 })
  password: string;

  @Column("varchar", { name: "display_picture", nullable: true, length: 255 })
  displayPicture: string | null;

  @Column("varchar", {
    name: "password_changed_at",
    nullable: true,
    length: 30,
  })
  passwordChangedAt: string | null;

  @Column("varchar", { name: "role", length: 20 })
  role: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date;
}
