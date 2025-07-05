import { BaseEntity, Column, Entity, Index } from "typeorm";

@Index("UQ_d10a707dfd0ca189233999204e5", ["id"], { unique: true })
@Entity("business_categories", { schema: "wz12oseoex68yd4p" })
export class BusinessCategories extends BaseEntity {
  @Column("int", { primary: true, name: "id" })
  id: number;

  @Column("varchar", { name: "title", length: 200 })
  title: string;
}
