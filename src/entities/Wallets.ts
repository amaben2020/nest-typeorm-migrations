import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('idx_user_id', ['userId'], { unique: true })
@Index('idx_wallet_code', ['walletId'], { unique: true })
@Index('user_id', ['userId'], {})
@Index('wallet_code', ['walletId'], { unique: true })
@Entity('wallets', { schema: 'wz12oseoex68yd4p' })
export class Wallets extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', {
    name: 'user_id',
    nullable: true,
    unique: true,
    unsigned: true,
  })
  userId: string | null;

  @Column('decimal', {
    name: 'balance',
    nullable: true,
    unsigned: true,
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  balance: string | null;

  @Column('varchar', { name: 'wallet_id', unique: true, length: 20 })
  walletId: string;

  @Column('datetime', { name: 'created_at' })
  createdAt: Date;

  @Column('datetime', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;

  @Column('varchar', { name: 'wallet_code', length: 20 })
  walletCode: string;
}
