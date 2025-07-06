import { DataSource, DataSourceOptions } from 'typeorm';
import * as fs from 'fs';
import * as dotenv from 'dotenv';
import * as path from 'path';

const ENV = process.env.NODE_ENV ?? 'development';

const envFile = path.resolve(process.cwd(), `.env.${ENV}`);
if (fs.existsSync(envFile)) {
  dotenv.config({ path: envFile });
  console.log(`✅ Loaded ${envFile}`);
  console.log(ENV);
} else {
  dotenv.config(); // fallback to default .env
  console.log(`⚠️  ${envFile} not found. Loaded fallback .env`);
}

export const dataSourceOptions: DataSourceOptions = {
  type: 'mysql',
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT as any) || 3307,
  username: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || 'algomachine',
  database: process.env.DB_DATABASE || 'blue_dev',
  entities: ['dist/src/entities/*.js'], // ✅ match AppModule
  migrations: ['dist/db/migrations/*.js'],
};

const dataSource = new DataSource(dataSourceOptions);
export default dataSource;
