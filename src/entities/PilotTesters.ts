import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("email", ["email"], { unique: true })
@Index("phone", ["phone"], { unique: true })
@Entity("pilot_testers", { schema: "wz12oseoex68yd4p" })
export class PilotTesters extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "first_name", length: 50 })
  firstName: string;

  @Column("varchar", { name: "last_name", length: 50 })
  lastName: string;

  @Column("varchar", { name: "email", unique: true, length: 150 })
  email: string;

  @Column("varchar", { name: "phone", unique: true, length: 20 })
  phone: string;

  @Column("text", { name: "platform" })
  platform: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
