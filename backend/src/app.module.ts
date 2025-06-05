import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './users/user.entity';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { ConfigModule } from '@nestjs/config';
import { EmailService } from './common/email/email.service';
import { EmailModule } from './common/email/email.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // makes config available everywhere
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      url: process.env.DATABASE_URL,
      entities: [User],
      synchronize: true, // Turn off in production
    }),
    EmailModule, // Import EmailModule to use EmailService
    AuthModule,
    UsersModule,
  ],
  controllers: [AppController],
  providers: [AppService, EmailService],
  exports: [EmailService], // Export EmailService if needed in other modules
})
export class AppModule {}
