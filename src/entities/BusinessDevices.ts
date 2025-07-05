import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("business_devices", { schema: "wz12oseoex68yd4p" })
export class BusinessDevices extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("varchar", { name: "fcm_token", nullable: true, length: 255 })
  fcmToken: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
