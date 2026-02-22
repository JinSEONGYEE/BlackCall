import { Controller, Get, Patch, Body, UseGuards, Req } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { SettingsService } from './settings.service';

@Controller('v1/settings')
@UseGuards(AuthGuard('jwt'))
export class SettingsController {
    constructor(private readonly settingsService: SettingsService) { }

    @Get()
    async getSettings(@Req() req) {
        return this.settingsService.getSettings(req.user.userId);
    }

    @Patch()
    async update(@Req() req, @Body() body: { isDetectionEnabled?: boolean; sensitivityLevel?: string; isReportingEnabled?: boolean }) {
        return this.settingsService.updateSettings(req.user.userId, body);
    }
}
