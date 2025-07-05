import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("sms_logs", { schema: "wz12oseoex68yd4p" })
export class SmsLogs extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "request_body", nullable: true, length: 1000 })
  requestBody: string | null;

  @Column("varchar", { name: "response_body", nullable: true, length: 1000 })
  responseBody: string | null;

  @Column("datetime", {
    name: "created_at",
    nullable: true,
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date | null;
}
