import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('usersTest', { schema: 'wz12oseoex68yd4p' })
export class UsersTest extends BaseEntity {
  @PrimaryGeneratedColumn({ type: 'int', name: 'id' })
  id: number;

  @Column('varchar', { name: 'email', nullable: true, length: 255 })
  email: string | null;

  @Column('varchar', { name: 'name', nullable: true, length: 255 })
  name: string | null;

  @Column('varchar', { name: 'nickname', nullable: true, length: 255 })
  nickname: string | null;

  @Column('varchar', { name: 'best_pal', nullable: true, length: 255 })
  bestPal: string | null;

  @Column('varchar', { name: 'is_online', nullable: true, length: 255 })
  isOnline: string | null;

  @Column('tinyint', {
    name: 'is_best_friend',
    nullable: true,
    default: () => "'0'",
  })
  isBestFriend: number | null;

  @Column('int', { name: 'is_new', nullable: true })
  isNew: number | null;

  @Column('int', { name: 'is_old', nullable: true })
  isOld: number | null;

  @Column('int', { name: 'is_brand_new', nullable: true })
  isBrandNew: number | null;

  @Column('int', { name: 'is_brand_new_test', nullable: true })
  isNewTest: number | null;
}
