import { DataSource, DataSourceOptions } from 'typeorm';
// export const dataSourceOptions: DataSourceOptions = {
//   type: 'mysql',
//   // entities: ['dist/**/*.entity.js'],
//   entities: ['dist/src/entities/entities/*.js'],

//   host:
//     process.env.DB_HOST ||
//     'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
//   port: parseInt(process.env.DB_PORT as any) || 3306,
//   username: process.env.DB_USER || 'oyd3i2rs2yb26lic',
//   password: process.env.DB_PASSWORD || 'mpnfrleo095gheeb',
//   database: process.env.DB_NAME || 'wz12oseoex68yd4p',
//   logging: false,
//   migrations: ['dist/db/migrations/*.js'],
// };

export const dataSourceOptions: DataSourceOptions = {
  type: 'mysql',
  host:
    process.env.DB_HOST ||
    'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
  port: parseInt(process.env.DB_PORT as any) || 3306,
  username: process.env.DB_USER || 'oyd3i2rs2yb26lic',
  password: process.env.DB_PASSWORD || 'mpnfrleo095gheeb',
  database: process.env.DB_NAME || 'wz12oseoex68yd4p',
  entities: ['dist/src/entities/*.js'], // ✅ match AppModule
  migrations: ['dist/db/migrations/*.js'],
  logging: false,
};

const dataSource = new DataSource(dataSourceOptions);
export default dataSource;
