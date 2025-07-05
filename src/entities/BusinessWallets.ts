import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Index('business_id', ['businessId'], {})
@Index('IDX_ff06839ff828223b3e3d33c2', ['walletId'], { unique: true })
@Entity('business_wallets', { schema: 'wz12oseoex68yd4p' })
export class BusinessWallets extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('bigint', { name: 'business_id', unsigned: true })
  businessId: string;

  @Column('decimal', {
    name: 'balance',
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  balance: string;

  @Column('varchar', { name: 'wallet_id', unique: true, length: 20 })
  walletId: string;

  // @Column('timestamp', {
  //   name: 'created_at',
  //   default: () => "'CURRENT_TIMESTAMP(6)'",
  // })
  // createdAt: Date;
  @Column('timestamp', {
    name: 'created_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date;

  @UpdateDateColumn({
    name: 'updated_at',
    type: 'datetime',
  })
  updatedAt: Date;

  @Column('varchar', { name: 'wallet_code', length: 20 })
  walletCode: string;
}
