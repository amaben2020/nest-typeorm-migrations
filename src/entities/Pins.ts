import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_user_id", ["userId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("pins", { schema: "wz12oseoex68yd4p" })
export class Pins extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", {
    name: "user_id",
    nullable: true,
    unique: true,
    unsigned: true,
  })
  userId: string | null;

  @Column("varchar", { name: "passcode", nullable: true, length: 255 })
  passcode: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;
}
