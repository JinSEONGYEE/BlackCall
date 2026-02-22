import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class SettingsService {
    constructor(private prisma: PrismaService) { }

    async getSettings(userId: number) {
        let settings = await this.prisma.appSettings.findUnique({
            where: { userId },
        });

        if (!settings) {
            // Create default settings if not exists
            settings = await this.prisma.appSettings.create({
                data: {
                    userId,
                },
            });
        }

        return settings;
    }

    async updateSettings(userId: number, data: { isDetectionEnabled?: boolean; sensitivityLevel?: string; isReportingEnabled?: boolean }) {
        return this.prisma.appSettings.upsert({
            where: { userId },
            update: data,
            create: {
                userId,
                ...data,
            },
        });
    }
}
