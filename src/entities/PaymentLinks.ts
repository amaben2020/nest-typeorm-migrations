import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('payment_links', { schema: 'wz12oseoex68yd4p' })
export class PaymentLinks extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', { name: 'user_id', nullable: true, unsigned: true })
  userId: string | null;

  @Column('varchar', { name: 'transaction_id', length: 20 })
  transactionId: string;

  @Column('varchar', { name: 'url_code', length: 20 })
  urlCode: string;

  @Column('varchar', { name: 'original_url', length: 255 })
  originalUrl: string;

  @Column('decimal', {
    name: 'amount',
    nullable: true,
    precision: 15,
    scale: 2,
  })
  amount: string | null;

  @Column('varchar', { name: 'phone', nullable: true, length: 20 })
  phone: string | null;

  @Column('varchar', { name: 'sender_name', nullable: true, length: 300 })
  senderName: string | null;

  @Column('tinyint', {
    name: 'verified_account',
    nullable: true,
    default: '0',
  })
  verifiedAccount: number | null;

  @Column('tinyint', {
    name: 'clicked',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  clicked: number | null;

  @Column('enum', {
    name: 'status',
    nullable: true,
    enum: [
      'failed',
      'sent',
      'processing',
      'fulfilled',
      'cancelled',
      'withdrawn',
      'reversed',
    ],
    default: 'sent',
  })
  status:
    | 'failed'
    | 'sent'
    | 'processing'
    | 'fulfilled'
    | 'cancelled'
    | 'withdrawn'
    | 'reversed'
    | null;

  @Column('varchar', { name: 'platform_used', nullable: true, length: 20 })
  platformUsed: string | null;

  @Column('varchar', { name: 'receiver_name', nullable: true, length: 255 })
  receiverName: string | null;

  @Column('varchar', { name: 'batch', nullable: true, length: 120 })
  batch: string | null;

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

  @Column('varchar', { name: 'api_response', nullable: true, length: 1500 })
  apiResponse: string | null;

  @Column('varchar', { name: 'account_number', nullable: true, length: 15 })
  accountNumber: string | null;

  @Column('varchar', { name: 'bank', nullable: true, length: 60 })
  bank: string | null;

  @Column('varchar', { name: 'reference', nullable: true, length: 20 })
  reference: string | null;

  @Column('varchar', { name: 'recipient_code', nullable: true, length: 20 })
  recipientCode: string | null;

  @Column('bigint', { name: 'business_id', nullable: true, unsigned: true })
  businessId: string | null;

  @Column('varchar', { name: 'narration', nullable: true, length: 255 })
  narration: string | null;

  @Column('enum', {
    name: 'type',
    enum: ['personal', 'business'],
    default: 'personal',
  })
  type: 'personal' | 'business';

  @Column('varchar', { name: 'request_body', nullable: true, length: 10000 })
  requestBody: string | null;

  @Column('varchar', { name: 'response_body', nullable: true, length: 10000 })
  responseBody: string | null;

  @Column('varchar', { name: 'idempotency_key', nullable: true, length: 100 })
  idempotencyKey: string | null;
}
