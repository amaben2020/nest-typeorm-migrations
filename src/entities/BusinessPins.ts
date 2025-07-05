import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Index('business_id', ['businessId'], {})
@Entity('business_pins', { schema: 'wz12oseoex68yd4p' })
export class BusinessPins extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'int', name: 'id' })
  id: number;

  @Column('bigint', { name: 'business_id', unsigned: true })
  businessId: string;

  @Column('varchar', { name: 'passcode', nullable: true, length: 255 })
  passcode: string | null;

  @Column('datetime', {
    name: 'created_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date;

  @Column('datetime', {
    name: 'updated_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  updatedAt: Date;

  @Column('tinyint', {
    name: 'reset_pin_status',
    nullable: true,
    default: '0',
  })
  resetPinStatus: number | null;
}
