import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("adept_access", { schema: "wz12oseoex68yd4p" })
export class AdeptAccess extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "access_token", nullable: true, length: 1000 })
  accessToken: string | null;

  @Column("datetime", { name: "ttl" })
  ttl: Date;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
