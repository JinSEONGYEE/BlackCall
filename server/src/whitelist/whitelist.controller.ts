import { Controller, Get, Post, Body, UseGuards, Req } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { WhitelistService } from './whitelist.service';

@Controller('v1/whitelist')
@UseGuards(AuthGuard('jwt'))
export class WhitelistController {
    constructor(private readonly whitelistService: WhitelistService) { }

    @Get()
    async getWhitelist(@Req() req) {
        return this.whitelistService.getWhitelist(req.user.userId);
    }

    @Post('sync')
    async sync(@Req() req, @Body() body: { items: { phoneHash: string; contactName?: string }[] }) {
        return this.whitelistService.syncWhitelist(req.user.userId, body.items);
    }
}
