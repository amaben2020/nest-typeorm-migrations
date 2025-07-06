import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import databaseConfig from 'db/config/dbConfig';
import appConfig from 'appConfig';
import environmentValidation from 'environmentValidation';

// DB_HOST = localhost;
// DB_PORT = 3306;
// DB_USERNAME = root;
// DB_PASSWORD = algomachine;
// DB_DATABASE = blue_dev;

const ENV = process.env.NODE_ENV ?? 'development';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: ENV ? `.env.${ENV}` : '.env',
      load: [appConfig, databaseConfig],
      validationSchema: ENV === 'test' ? undefined : environmentValidation,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        type: 'mysql',
        // host: 'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
        // host: 'localhost',
        // port: 3307,
        // username: 'root',
        // password: 'algomachine',
        // database: 'blue_dev',
        entities: ['dist/src/entities/*.js'],
        // disable in staging and production
        // synchronize: true,
        // migrationsRun: true,
        host: configService.get('database.host')!,
        port: configService.get('database.port')!,
        username: configService.get('database.username')!,
        password: configService.get('database.password')!,
        database: configService.get('database.name')!,
        logging: ['error'],
      }),
    }),
  ],
  controllers: [AppController],
  // disable in staging and production
  providers: [AppService],
})
export class AppModule {}
