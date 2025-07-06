import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';

// DB_HOST = localhost;
// DB_PORT = 3306;
// DB_USERNAME = root;
// DB_PASSWORD = algomachine;
// DB_DATABASE = blue_dev;

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      // host: 'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
      host: 'localhost',
      port: 3307,
      username: 'root',
      password: 'algomachine',
      database: 'blue_dev',
      entities: ['dist/src/entities/*.js'],
      // disable in staging and production
      // synchronize: true,
      // migrationsRun: true,
      logging: ['error'],
    }),
  ],
  controllers: [AppController],
  // disable in staging and production
  providers: [AppService],
})
export class AppModule {}
