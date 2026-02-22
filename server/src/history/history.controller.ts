import { Controller, Get, Post, Body, UseGuards, Req } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { HistoryService } from './history.service';

@Controller('v1/detection-history')
@UseGuards(AuthGuard('jwt'))
export class HistoryController {
    constructor(private readonly historyService: HistoryService) { }

    @Get()
    async getHistory(@Req() req) {
        return this.historyService.getHistory(req.user.userId);
    }

    @Post()
    async add(@Req() req, @Body() body: { phoneNumberHash?: string; type: string; confidence?: number; details?: string }) {
        return this.historyService.addHistory(req.user.userId, {
            phoneNumberHash: body.phoneNumberHash,
            detectionType: body.type,
            confidence: body.confidence,
            details: body.details,
        });
    }
}
