import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class FraudService {
    constructor(private prisma: PrismaService) { }

    async getAllPatterns() {
        return this.prisma.fraudPattern.findMany({
            where: { isActive: true },
        });
    }

    // Admin: Create/Update methods can be added here
    async createPattern(data: any) {
        return this.prisma.fraudPattern.create({
            data,
        });
    }
}
