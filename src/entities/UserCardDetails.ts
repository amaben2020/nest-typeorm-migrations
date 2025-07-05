import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("idx_user_id", ["userId"], {})
@Entity("user_card_details", { schema: "wz12oseoex68yd4p" })
export class UserCardDetails extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", unsigned: true })
  userId: string;

  @Column("varchar", { name: "email", length: 255 })
  email: string;

  @Column("varchar", { name: "authorization_code", length: 80 })
  authorizationCode: string;

  @Column("varchar", { name: "bin", length: 20 })
  bin: string;

  @Column("varchar", { name: "last4", length: 20 })
  last4: string;

  @Column("varchar", { name: "exp_month", length: 20 })
  expMonth: string;

  @Column("varchar", { name: "exp_year", length: 20 })
  expYear: string;

  @Column("varchar", { name: "card_type", length: 20 })
  cardType: string;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "first_name", nullable: true, length: 60 })
  firstName: string | null;

  @Column("varchar", { name: "last_name", nullable: true, length: 60 })
  lastName: string | null;

  @Column("varchar", { name: "bank", nullable: true, length: 60 })
  bank: string | null;
}
