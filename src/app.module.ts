import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'd1kb8x1fu8rhcnej.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
      port: 3306,
      username: 'oyd3i2rs2yb26lic',
      password: 'mpnfrleo095gheeb',
      database: 'wz12oseoex68yd4p',
      entities: ['dist/src/entities/*.js'],
      synchronize: true,
      logging: ['error'],
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
