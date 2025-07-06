/* eslint-disable @typescript-eslint/no-unsafe-call */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import { registerAs } from '@nestjs/config';

console.log(process.env.DB_DATABASE, 'db_host');
const databaseConfig = registerAs('database', () => ({
  host: process.env.DB_HOST!,
  username: process.env.DB_USERNAME!,
  password: process.env.DB_PASSWORD!,
  name: process.env.DB_DATABASE!,
  // database: process.env.DB_DATABASE,
  port: parseInt(process.env.DB_PORT!),
}));

export default databaseConfig;
