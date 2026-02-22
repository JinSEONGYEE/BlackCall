import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class WhitelistService {
    constructor(private prisma: PrismaService) { }

    async syncWhitelist(userId: number, items: { phoneHash: string; contactName?: string }[]) {
        // Standard approach: Use transaction to clear and re-insert or upsert
        // For simplicity and speed in this Sprint: Delete existing and batch insert

        return this.prisma.$transaction(async (tx) => {
            // 1. Delete existing entries for this user
            await tx.whitelistEntry.deleteMany({
                where: { userId },
            });

            // 2. Batch insert new entries
            const data = items.map((item) => ({
                userId,
                phoneNumberHash: item.phoneHash,
                contactName: item.contactName,
            }));

            await tx.whitelistEntry.createMany({
                data,
            });

            return { count: data.length };
        });
    }

    async getWhitelist(userId: number) {
        return this.prisma.whitelistEntry.findMany({
            where: { userId },
            orderBy: { contactName: 'asc' },
        });
    }
}
