import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors(); // Enable CORS
  const port = process.env.PORT || 3000;

  await app.listen(port, '0.0.0.0');
  console.log(`🚀 Server is running on: http://0.0.0.0:${port}`);
  console.log(`Environment: ${process.env.NODE_ENV}`);
}
bootstrap();
