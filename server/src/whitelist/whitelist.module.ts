import { Module } from '@nestjs/common';
import { WhitelistService } from './whitelist.service';
import { WhitelistController } from './whitelist.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  providers: [WhitelistService],
  controllers: [WhitelistController],
})
export class WhitelistModule { }
