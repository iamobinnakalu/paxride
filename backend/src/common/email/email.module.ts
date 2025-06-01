import { Module } from '@nestjs/common';
import { EmailService } from './email.service';
import { EmailController } from './email.controller'; // 👈 Import the controller

@Module({
  controllers: [EmailController], // 👈 Register it here
  providers: [EmailService],
  exports: [EmailService], // 👈 Optional, if you want to use EmailService elsewhere
})
export class EmailModule {}
