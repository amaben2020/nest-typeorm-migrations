import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("reasons", { schema: "wz12oseoex68yd4p" })
export class Reasons extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "content", length: 50 })
  content: string;
}
