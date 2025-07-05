import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('idx_receiver', ['receiver'], {})
@Index('idx_user_id', ['userId'], {})
@Index('unq_airtime_txn', ['userId', 'transactionId'], { unique: true })
@Entity('airtime_transactions', { schema: 'wz12oseoex68yd4p' })
export class AirtimeTransactions extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', { name: 'user_id', unsigned: true })
  userId: string;

  @Column('varchar', { name: 'provider', length: 80 })
  provider: string;

  @Column('varchar', { name: 'receiver', length: 25 })
  receiver: string;

  @Column('decimal', {
    name: 'amount',
    nullable: true,
    unsigned: true,
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

  @Column('decimal', {
    name: 'balance_before',
    precision: 15,
    scale: 2,
    default: '0.00',
  })
  balanceBefore: string;

  @Column('decimal', {
    name: 'balance_after',
    precision: 15,
    scale: 2,
    default: '0.00',
  })
  balanceAfter: string;
}
