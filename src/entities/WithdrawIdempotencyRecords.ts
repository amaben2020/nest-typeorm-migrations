import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("created_at", ["createdAt"], {})
@Index("transaction_id", ["transactionId", "userId", "operationType"], {})
@Entity("withdraw_idempotency_records", { schema: "wz12oseoex68yd4p" })
export class WithdrawIdempotencyRecords extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("varchar", { name: "transaction_id", length: 255 })
  transactionId: string;

  @Column("int", { name: "user_id" })
  userId: number;

  @Column("varchar", { name: "operation_type", length: 50 })
  operationType: string;

  @Column("text", { name: "response_data" })
  responseData: string;

  @Column("datetime", { name: "created_at" })
  createdAt: Date;
}
