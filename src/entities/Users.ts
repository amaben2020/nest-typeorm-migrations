import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('idx_id', ['id'], {})
@Index('phone', ['phone'], { unique: true })
@Entity('users', { schema: 'wz12oseoex68yd4p' })
export class Users extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', unsigned: true })
  id: string;

  @Column('varchar', { name: 'first_name', nullable: true, length: 255 })
  firstName: string | null;

  @Column('varchar', { name: 'middle_name', nullable: true, length: 255 })
  middleName: string | null;

  @Column('varchar', { name: 'bvn', nullable: true, length: 255 })
  bvn: string | null;

  @Column('varchar', { name: 'date_of_birth', nullable: true, length: 255 })
  dateOfBirth: string | null;

  @Column('varchar', { name: 'last_name', nullable: true, length: 255 })
  lastName: string | null;

  @Column('varchar', { name: 'phone', unique: true, length: 50 })
  phone: string;

  @Column('enum', {
    name: 'role',
    nullable: true,
    enum: ['owner', 'employee'],
    default: 'owner',
  })
  role: 'owner' | 'employee' | null;

  @Column('enum', {
    name: 'type',
    nullable: true,
    enum: ['personal', 'business', 'business_personal'],
    default: 'personal',
  })
  type: 'personal' | 'business' | 'business_personal' | null;

  @Column('varchar', { name: 'display_pic', nullable: true, length: 1000 })
  displayPic: string | null;

  @Column('int', { name: 'level', nullable: true, default: '1' })
  level: number | null;

  @Column('varchar', { name: 'password', nullable: true, length: 255 })
  password: string | null;

  @Column('varchar', { name: 'passwordChangedAt', nullable: true, length: 255 })
  passwordChangedAt: string | null;

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

  @Column('tinyint', {
    name: 'reset_credential_status',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  resetCredentialStatus: number | null;

  @Column('tinyint', { name: 'notification_status', default: '1' })
  notificationStatus: number;

  @Column('tinyint', {
    name: 'kyc_status',
    nullable: true,
    unsigned: true,
    default: '0',
  })
  kycStatus: number | null;

  @Column('enum', {
    name: 'kyc',
    enum: ['basic', 'intermediate', 'pro'],
    default: 'basic',
  })
  kyc: 'basic' | 'intermediate' | 'pro';

  @Column('datetime', { name: 'created_at' })
  createdAt: Date;

  @Column('datetime', {
    name: 'updated_at',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date | null;
}
