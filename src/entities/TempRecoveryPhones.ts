import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("temp_recovery_phones", { schema: "wz12oseoex68yd4p" })
export class TempRecoveryPhones extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "reference", length: 30 })
  reference: string;

  @Column("varchar", { name: "old_phone", length: 15 })
  oldPhone: string;

  @Column("varchar", { name: "new_phone", length: 15 })
  newPhone: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
