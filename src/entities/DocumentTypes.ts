import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("document_types", { schema: "wz12oseoex68yd4p" })
export class DocumentTypes extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "name", length: 50 })
  name: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;
}
