import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("accessibilities", { schema: "wz12oseoex68yd4p" })
export class Accessibilities extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "access_daemon", nullable: true, length: 1000 })
  accessDaemon: string | null;

  @Column("varchar", { name: "ref_daemon", length: 1000 })
  refDaemon: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
