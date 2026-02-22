import { Controller, Get } from '@nestjs/common';
import { ModelsService } from './models.service';

@Controller('v1/models/tflite')
export class ModelsController {
    constructor(private readonly modelsService: ModelsService) { }

    @Get('latest')
    async getLatest() {
        const model = await this.modelsService.getLatestTfliteModel();
        if (!model) {
            return { message: 'No active model found' };
        }
        return model;
    }
}
