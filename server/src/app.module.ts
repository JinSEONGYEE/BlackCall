import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { PrismaModule } from './prisma/prisma.module';
import { FraudModule } from './fraud/fraud.module';
import { ModelsModule } from './models/models.module';
import { WhitelistModule } from './whitelist/whitelist.module';
import { HistoryModule } from './history/history.module';
import { SettingsModule } from './settings/settings.module';

@Module({
  imports: [AuthModule, PrismaModule, FraudModule, ModelsModule, WhitelistModule, HistoryModule, SettingsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
