import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("blue_admin_roles", { schema: "wz12oseoex68yd4p" })
export class BlueAdminRoles extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "name", length: 50 })
  name: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
