import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('fk_txnhistory_branch_id', ['branchId'], {})
@Index('fk_txnhistory_staff_id', ['staffId'], {})
@Index('idx_business_id', ['businessId'], {})
@Index('idx_created_at', ['createdAt'], {})
@Index('idx_payment_mode', ['paymentMode'], {})
@Index('idx_status', ['status'], {})
@Index('idx_transaction_reference', ['transactionId'], {})
@Entity('business_transaction_histories', { schema: 'wz12oseoex68yd4p' })
export class BusinessTransactionHistories extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', { name: 'business_id', nullable: true, unsigned: true })
  businessId: string | null;

  @Column('bigint', { name: 'branch_id', nullable: true, unsigned: true })
  branchId: string | null;

  @Column('bigint', { name: 'staff_id', nullable: true, unsigned: true })
  staffId: string | null;

  @Column('varchar', { name: 'transaction_id', length: 30 })
  transactionId: string;

  @Column('varchar', { name: 'receiver_name', nullable: true, length: 100 })
  receiverName: string | null;

  @Column('varchar', { name: 'sender_name', nullable: true, length: 100 })
  senderName: string | null;

  @Column('decimal', { name: 'amount', precision: 15, scale: 2 })
  amount: string;

  @Column('enum', {
    name: 'status',
    enum: ['successful', 'pending', 'failed', 'in-progress'],
  })
  status: 'successful' | 'pending' | 'failed' | 'in-progress';

  @Column('enum', {
    name: 'payment_mode',
    enum: [
      'blue-user',
      'phone',
      'offline',
      'withdrawal',
      'card',
      'bank_transfer',
      'airtime',
      'data',
      'power',
      'cable-tv',
    ],
  })
  paymentMode:
    | 'blue-user'
    | 'phone'
    | 'offline'
    | 'withdrawal'
    | 'card'
    | 'bank_transfer'
    | 'airtime'
    | 'data'
    | 'power'
    | 'cable-tv';

  @Column('enum', { name: 'type', enum: ['credit', 'debit'] })
  type: 'credit' | 'debit';

  @Column('enum', {
    name: 'client_used',
    enum: ['desktop', 'mobile'],
    default: 'mobile',
  })
  clientUsed: 'desktop' | 'mobile';

  @Column('decimal', {
    name: 'service_charge',
    precision: 10,
    scale: 2,
    default: '0.00',
  })
  serviceCharge: string;

  @Column('datetime', {
    name: 'created_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date;

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
