import { Controller, Get } from '@nestjs/common';
import { FraudService } from './fraud.service';

@Controller('v1/fraud-patterns')
export class FraudController {
    constructor(private readonly fraudService: FraudService) { }

    @Get()
    async getPatterns() {
        return this.fraudService.getAllPatterns();
    }
}
