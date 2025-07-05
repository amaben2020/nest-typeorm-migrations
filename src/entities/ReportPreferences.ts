import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("FK_report_preferences_business_id", ["businessId"], {})
@Index("UQ_8bd9422c2c9e0ca8ab0df102c5e", ["id"], { unique: true })
@Entity("report_preferences", { schema: "wz12oseoex68yd4p" })
export class ReportPreferences extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("bigint", { name: "business_id", unsigned: true })
  businessId: string;

  @Column("varchar", { name: "email", length: 255 })
  email: string;

  @Column("tinyint", { name: "is_active", width: 1, default: () => "'1'" })
  isActive: boolean;

  @Column("varchar", {
    name: "schedule_time",
    length: 10,
    default: () => "'23:00'",
  })
  scheduleTime: string;

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("timestamp", {
    name: "updated_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date;
}
