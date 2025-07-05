import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("id", ["id"], { unique: true })
@Entity("business_onboarding_forms", { schema: "wz12oseoex68yd4p" })
export class BusinessOnboardingForms extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id", unsigned: true })
  id: string;

  @Column("varchar", { name: "business_name", length: 255 })
  businessName: string;

  @Column("varchar", { name: "business_type", length: 255 })
  businessType: string;

  @Column("varchar", { name: "business_category", length: 255 })
  businessCategory: string;

  @Column("text", { name: "business_address" })
  businessAddress: string;

  @Column("varchar", { name: "state", length: 100 })
  state: string;

  @Column("varchar", { name: "branch_count", length: 50 })
  branchCount: string;

  @Column("varchar", { name: "business_website", nullable: true, length: 255 })
  businessWebsite: string | null;

  @Column("varchar", { name: "contact_name", length: 255 })
  contactName: string;

  @Column("varchar", { name: "contact_role", length: 100 })
  contactRole: string;

  @Column("varchar", { name: "contact_phone", length: 20 })
  contactPhone: string;

  @Column("varchar", { name: "contact_email", nullable: true, length: 255 })
  contactEmail: string | null;

  @Column("tinyint", {
    name: "accepts_digital_payments",
    width: 1,
    default: () => "'0'",
  })
  acceptsDigitalPayments: boolean;

  @Column("text", { name: "payment_tools" })
  paymentTools: string;

  @Column("varchar", { name: "monthly_transactions", length: 100 })
  monthlyTransactions: string;

  @Column("varchar", { name: "employee_count", nullable: true, length: 50 })
  employeeCount: string | null;

  @Column("text", { name: "setup_needs" })
  setupNeeds: string;

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("timestamp", {
    name: "updated_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedAt: Date;
}
