// src/common/email/email.controller.ts
import { Controller, Post, Body } from '@nestjs/common';
import { EmailService } from './email.service';

@Controller('email')
export class EmailController {
  constructor(private readonly emailService: EmailService) {}

  @Post('send-test')
  async sendTestEmail(
    @Body() body: { to: string; subject: string; text: string },
  ) {
    await this.emailService.sendEmail(body.to, body.subject, body.text);
    return { message: 'Email sent!' };
  }
}
