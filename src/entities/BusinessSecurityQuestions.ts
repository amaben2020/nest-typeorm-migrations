import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("business_security_questions", { schema: "wz12oseoex68yd4p" })
export class BusinessSecurityQuestions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", { name: "user_id", nullable: true, unsigned: true })
  userId: string | null;

  @Column("datetime", { name: "created_at", nullable: true })
  createdAt: Date | null;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "question", length: 200 })
  question: string;

  @Column("varchar", { name: "answer", length: 200 })
  answer: string;
}
