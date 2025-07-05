import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("migrations", { schema: "wz12oseoex68yd4p" })
export class Migrations extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("bigint", { name: "timestamp" })
  timestamp: string;

  @Column("varchar", { name: "name", length: 255 })
  name: string;
}
