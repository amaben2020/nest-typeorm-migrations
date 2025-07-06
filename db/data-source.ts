// import { DataSource, DataSourceOptions } from 'typeorm';
// import * as fs from 'fs';
// import * as dotenv from 'dotenv';
// import * as path from 'path';

// const ENV = process.env.NODE_ENV ?? 'development';

// console.log(ENV);

// const envFile = path.resolve(process.cwd(), `.env.${ENV}`);
// if (fs.existsSync(envFile)) {
//   dotenv.config({ path: envFile });
//   console.log(`✅ Loaded ${envFile}`);
//   console.log(ENV);
// } else {
//   dotenv.config(); // fallback to default .env
//   console.log(`⚠️  ${envFile} not found. Loaded fallback .env`);

//   if (!process.env.DB_DATABASE) {
//     throw new Error('DB_DATABASE is not set!');
//   }
// }

// export const dataSourceOptions: DataSourceOptions = {
//   type: 'mysql',
//   host: process.env.DB_HOST || 'localhost',
//   port: parseInt(process.env.DB_PORT as any),
//   username: process.env.DB_USERNAME,
//   password: process.env.DB_PASSWORD,
//   database: process.env.DB_DATABASE,
//   entities: ['dist/src/entities/*.js'], // ✅ match AppModule
//   migrations: ['dist/db/migrations/*.js'],
// };

// const dataSource = new DataSource(dataSourceOptions);
// export default dataSource;

import { DataSource, DataSourceOptions } from 'typeorm';
import * as fs from 'fs';
import * as dotenv from 'dotenv';
import * as path from 'path';

// Debug environment variables
console.log('Current environment variables:', {
  NODE_ENV: process.env.NODE_ENV,
  DB_HOST: process.env.DB_HOST,
  DB_PORT: process.env.DB_PORT,
  DB_USERNAME: process.env.DB_USERNAME,
  DB_DATABASE: process.env.DB_DATABASE,
});

const ENV = process.env.NODE_ENV ?? 'development';

// Try loading .env file first
const envFile = path.resolve(process.cwd(), `.env.${ENV}`);
if (fs.existsSync(envFile)) {
  dotenv.config({ path: envFile });
  console.log(`✅ Loaded ${envFile}`);
} else {
  dotenv.config(); // fallback to default .env
  console.log(`⚠️ ${envFile} not found. Loaded fallback .env`);
}

// Throw error if required variables are missing
if (!process.env.DB_DATABASE) {
  throw new Error('DB_DATABASE is not set in environment variables!');
}

export const dataSourceOptions: DataSourceOptions = {
  type: 'mysql',
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT || '3306', 10),
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE, // Make sure this matches your env var name
  entities: ['dist/src/entities/*.js'],
  migrations: ['dist/db/migrations/*.js'],
  logging: true, // Enable for debugging
};

const dataSource = new DataSource(dataSourceOptions);
export default dataSource;
