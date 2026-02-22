import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class HistoryService {
    constructor(private prisma: PrismaService) { }

    async addHistory(userId: number, data: { phoneNumberHash?: string; detectionType: string; confidence?: number; details?: string }) {
        return this.prisma.detectionHistory.create({
            data: {
                userId,
                phoneNumberHash: data.phoneNumberHash,
                detectionType: data.detectionType,
                confidence: data.confidence,
                details: data.details,
            },
        });
    }

    async getHistory(userId: number) {
        return this.prisma.detectionHistory.findMany({
            where: { userId },
            orderBy: { detectedAt: 'desc' },
        });
    }
}
