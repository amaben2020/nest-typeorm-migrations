import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("document_type_id", ["documentTypeId"], {})
@Index("idx_user_id", ["userId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("kycs", { schema: "wz12oseoex68yd4p" })
export class Kycs extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("bigint", {
    name: "user_id",
    nullable: true,
    unique: true,
    unsigned: true,
  })
  userId: string | null;

  @Column("bigint", {
    name: "document_type_id",
    nullable: true,
    unsigned: true,
  })
  documentTypeId: string | null;

  @Column("varchar", { name: "bvn", length: 50 })
  bvn: string;

  @Column("date", { name: "date_of_birth" })
  dateOfBirth: string;

  @Column("varchar", { name: "country", nullable: true, length: 50 })
  country: string | null;

  @Column("varchar", { name: "front_cover", nullable: true, length: 300 })
  frontCover: string | null;

  @Column("varchar", { name: "back_cover", nullable: true, length: 300 })
  backCover: string | null;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;

  @Column("datetime", {
    name: "updated_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date | null;

  @Column("varchar", { name: "documents", nullable: true, length: 3000 })
  documents: string | null;
}
