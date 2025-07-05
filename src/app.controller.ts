import { Controller, Get, Query } from '@nestjs/common';
import { AppService } from './app.service';
import { AirtimeTransactions } from './entities/AirtimeTransactions';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  // @Get()
  // getHello(): string {
  //   return this.appService.getHello();
  // }

  @Get()
  async findAll(
    @Query('userId') userId?: string,
    @Query('transactionId') transactionId?: string,
  ) {
    const query = AirtimeTransactions.createQueryBuilder('txn');

    if (userId) {
      query.andWhere('txn.userId = :userId', { userId });
    }

    if (transactionId) {
      query.andWhere('txn.transactionId = :transactionId', { transactionId });
    }

    const transactions = await query.orderBy('txn.createdAt', 'DESC').getMany();

    return { data: transactions };
  }
}
