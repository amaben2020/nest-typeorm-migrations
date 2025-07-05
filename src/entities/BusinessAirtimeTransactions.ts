import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('fk_airtime_branch_id', ['branchId'], {})
@Index('fk_airtime_business_id', ['businessId'], {})
@Index('fk_airtime_staff_id', ['staffId'], {})
@Entity('business_airtime_transactions', { schema: 'wz12oseoex68yd4p' })
export class BusinessAirtimeTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', { name: 'business_id', nullable: true, unsigned: true })
  businessId: string | null;

  @Column('bigint', { name: 'branch_id', nullable: true, unsigned: true })
  branchId: string | null;

  @Column('bigint', { name: 'staff_id', nullable: true, unsigned: true })
  staffId: string | null;

  @Column('varchar', { name: 'provider', length: 15 })
  provider: string;

  @Column('varchar', { name: 'receiver', length: 15 })
  receiver: string;

  @Column('decimal', {
    name: 'amount',
    nullable: true,
    precision: 12,
    scale: 2,
  })
  amount: string | null;

  @Column('varchar', { name: 'payment_reference', nullable: true, length: 40 })
  paymentReference: string | null;

  @Column('enum', {
    name: 'payment_mode',
    nullable: true,
    enum: ['wallet', 'card'],
  })
  paymentMode: 'wallet' | 'card' | null;

  @Column('varchar', { name: 'phone', nullable: true, length: 15 })
  phone: string | null;

  @Column('varchar', { name: 'transaction_id', length: 30 })
  transactionId: string;

  @Column('enum', {
    name: 'status',
    enum: ['pending', 'successful', 'failed'],
    default: 'pending',
  })
  status: 'pending' | 'successful' | 'failed';

  @Column('varchar', {
    name: 'vend_request_body',
    nullable: true,
    length: 1000,
  })
  vendRequestBody: string | null;

  @Column('datetime', {
    name: 'created_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date | null;

  @Column('datetime', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;

  @Column('varchar', {
    name: 'vend_response_body',
    nullable: true,
    length: 1500,
  })
  vendResponseBody: string | null;
}
