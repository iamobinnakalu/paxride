import { Injectable } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { Transporter, SentMessageInfo } from 'nodemailer';

@Injectable()
export class EmailService {
  private transporter: Transporter<SentMessageInfo>;

  constructor() {
    this.transporter = nodemailer.createTransport({
      host: process.env.SMTP_HOST,
      port: parseInt(process.env.SMTP_PORT || '2525', 10),
      secure: false, // true for 465, false for other ports
      auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS,
      },
    }) as Transporter<SentMessageInfo>;
  }

  async sendEmail(to: string, subject: string, text: string): Promise<void> {
    const mailOptions = {
      from: process.env.FROM_EMAIL,
      to,
      subject,
      text,
    };

    // Now info is correctly typed and safe
    await this.transporter.sendMail(mailOptions);
    return;
  }
}
