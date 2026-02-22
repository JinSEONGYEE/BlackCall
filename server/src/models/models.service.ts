import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class ModelsService {
    constructor(private prisma: PrismaService) { }

    async getLatestTfliteModel() {
        return this.prisma.tfliteModel.findFirst({
            where: { isActive: true },
            orderBy: { createdAt: 'desc' },
        });
    }

    // Admin: Create/Update methods
    async createModel(data: any) {
        return this.prisma.tfliteModel.create({
            data,
        });
    }
}
