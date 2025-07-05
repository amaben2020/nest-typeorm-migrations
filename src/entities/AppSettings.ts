import {
  BaseEntity,
  Column,
  Entity,
  Index,
  PrimaryGeneratedColumn,
} from "typeorm";

@Index("UQ_4800b266ba790931744b3e53a74", ["id"], { unique: true })
@Entity("app_settings", { schema: "wz12oseoex68yd4p" })
export class AppSettings extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("enum", { name: "sms_platform", enum: ["termii", "sendchamp"] })
  smsPlatform: "termii" | "sendchamp";

  @Column("enum", {
    name: "verification_platform",
    enum: ["dojah", "mono"],
    default: () => "'dojah'",
  })
  verificationPlatform: "dojah" | "mono";

  @Column("enum", {
    name: "payment_platform",
    enum: ["flutterwave", "paystack", "irecharge"],
  })
  paymentPlatform: "flutterwave" | "paystack" | "irecharge";

  @Column("decimal", {
    name: "minimum_amount",
    nullable: true,
    precision: 8,
    scale: 0,
  })
  minimumAmount: string | null;

  @Column("datetime", { name: "irchg_token_ttl", nullable: true })
  irchgTokenTtl: Date | null;

  @Column("decimal", {
    name: "irchg_charge_rate",
    precision: 5,
    scale: 0,
    default: () => "'50'",
  })
  irchgChargeRate: string;

  @Column("varchar", { name: "irchg_token_login", nullable: true, length: 60 })
  irchgTokenLogin: string | null;

  @Column("decimal", {
    name: "minimum_amount_to_phone",
    precision: 8,
    scale: 2,
    default: () => "'200.00'",
  })
  minimumAmountToPhone: string;

  @Column("decimal", {
    name: "withdrawal_charge_rate",
    precision: 8,
    scale: 0,
    default: () => "'20'",
  })
  withdrawalChargeRate: string;

  @Column("datetime", { name: "createdAt", default: () => "CURRENT_TIMESTAMP" })
  createdAt: Date;

  @Column("decimal", {
    name: "no_kyc_max_amount",
    precision: 8,
    scale: 2,
    default: () => "'20000.00'",
  })
  noKycMaxAmount: string;

  @Column("decimal", {
    name: "basic_transfer_amount",
    precision: 10,
    scale: 2,
    default: () => "'20000.00'",
  })
  basicTransferAmount: string;

  @Column("decimal", {
    name: "intermediate_transfer_amount",
    precision: 10,
    scale: 0,
    default: () => "'5000000'",
  })
  intermediateTransferAmount: string;

  @Column("decimal", {
    name: "min_amount_to_phone",
    precision: 10,
    scale: 2,
    default: () => "'200.00'",
  })
  minAmountToPhone: string;

  @Column("decimal", {
    name: "min_amount_to_wallet",
    precision: 10,
    scale: 2,
    default: () => "'100.00'",
  })
  minAmountToWallet: string;

  @Column("decimal", {
    name: "non_blue_charge_rate",
    precision: 10,
    scale: 2,
    default: () => "'50.00'",
  })
  nonBlueChargeRate: string;

  @Column("decimal", {
    name: "blue_charge_rate",
    precision: 10,
    scale: 2,
    default: () => "'0.00'",
  })
  blueChargeRate: string;

  @Column("varchar", {
    name: "min_withdrawal_amount",
    nullable: true,
    length: 255,
  })
  minWithdrawalAmount: string | null;

  @Column("varchar", { name: "adept_token", nullable: true, length: 1000 })
  adeptToken: string | null;

  @Column("datetime", { name: "adept_token_ttl", nullable: true })
  adeptTokenTtl: Date | null;

  @Column("enum", {
    name: "power_platform",
    enum: ["irecharge", "vtpass", "buypower"],
  })
  powerPlatform: "irecharge" | "vtpass" | "buypower";

  @Column("enum", {
    name: "airtime_platform",
    enum: ["irecharge", "vtpass", "buypower"],
  })
  airtimePlatform: "irecharge" | "vtpass" | "buypower";

  @Column("enum", {
    name: "data_platform",
    enum: ["irecharge", "vtpass", "buypower"],
  })
  dataPlatform: "irecharge" | "vtpass" | "buypower";

  @Column("enum", {
    name: "tv_platform",
    enum: ["irecharge", "vtpass", "buypower"],
  })
  tvPlatform: "irecharge" | "vtpass" | "buypower";

  @Column("enum", { name: "wallet_provider", enum: ["wema", "pecan"] })
  walletProvider: "wema" | "pecan";
}
