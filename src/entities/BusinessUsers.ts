import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('idx_phone_191uuwqwmc12', ['phone'], { unique: true })
@Index('phone', ['phone'], { unique: true })
@Entity('business_users', { schema: 'wz12oseoex68yd4p' })
export class BusinessUsers extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('varchar', { name: 'phone', unique: true, length: 50 })
  phone: string;

  @Column('varchar', { name: 'display_picture', nullable: true, length: 1000 })
  displayPicture: string | null;

  @Column('tinyint', {
    name: 'is_deleted',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  isDeleted: number | null;

  @Column('tinyint', { name: 'flagged', width: 1, default: '0' })
  flagged: boolean;

  @Column('tinyint', {
    name: 'verified',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  verified: number | null;

  @Column('int', { name: 'level', nullable: true, default: '1' })
  level: number | null;

  @Column('tinyint', {
    name: 'notification_status',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  notificationStatus: number | null;

  @Column('tinyint', {
    name: 'reset_credential_status',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  resetCredentialStatus: number | null;

  @Column('varchar', { name: 'password', nullable: true, length: 255 })
  password: string | null;

  @Column('varchar', {
    name: 'password_changed_at',
    nullable: true,
    length: 255,
  })
  passwordChangedAt: string | null;

  @Column('enum', {
    name: 'kyc',
    enum: ['basic', 'intermediate', 'pro'],
    default: 'basic',
  })
  kyc: 'basic' | 'intermediate' | 'pro';

  @Column('tinyint', {
    name: 'business_profile_completed',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  businessProfileCompleted: number | null;

  @Column('tinyint', {
    name: 'business_details_completed',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  businessDetailsCompleted: number | null;

  @Column('tinyint', {
    name: 'business_kyc_completed',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  businessKycCompleted: number | null;

  @Column('tinyint', {
    name: 'proof_of_address_verified',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  proofOfAddressVerified: number | null;

  @Column('tinyint', {
    name: 'auto_withdrawal_enabled',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  autoWithdrawalEnabled: number | null;

  @Column('datetime', { name: 'created_at' })
  createdAt: Date;

  @Column('datetime', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;
}
