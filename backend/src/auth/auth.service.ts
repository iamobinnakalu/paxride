import { Injectable, ConflictException } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { UnauthorizedException, BadRequestException } from '@nestjs/common';
import { EmailService } from '../common/email/email.service'; // Ensure EmailService is imported if used

const OTP_EXPIRY_DURATION_MS = 5 * 60 * 1000;

@Injectable()
export class AuthService {
  constructor(
    private readonly usersService: UsersService,
    private readonly jwtService: JwtService,
    private readonly emailService: EmailService, // Ensure EmailService is injected if used
  ) {}

  async register(email: string, password: string) {
    const existing = await this.usersService.findByEmail(email);
    if (existing) {
      throw new ConflictException('Email is already registered');
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const otp = Math.floor(1000 + Math.random() * 9000).toString();
    const otpExpiresAt = new Date(Date.now() + OTP_EXPIRY_DURATION_MS);

    const newUser = await this.usersService.create({
      email,
      password: hashedPassword,
      otp,
      otpExpiresAt,
      isVerified: false,
    });

    await this.emailService.sendEmail(
      email,
      'Your PaxRide OTP Code',
      `Your OTP code is: ${otp}. It will expire in 5 minutes.`,
    );

    return {
      message: 'Registration successful. Please verify your email.',
      userId: newUser.id,
    };
  }

  generateToken(user: { id: string; email: string }) {
    return this.jwtService.sign({
      sub: user.id,
      email: user.email,
    });
  }

  async verifyOtp(email: string, otp: string) {
    const user = await this.usersService.findByEmail(email);
    if (!user) {
      throw new BadRequestException('User not found');
    }

    if (user.isVerified) {
      throw new BadRequestException('User already verified');
    }

    if (!user.otp || !user.otpExpiresAt) {
      throw new BadRequestException('No OTP found for this user');
    }

    const isExpired = user.otpExpiresAt.getTime() < Date.now();
    if (isExpired) {
      throw new BadRequestException('OTP has expired');
    }

    if (user.otp !== otp) {
      throw new BadRequestException('Invalid OTP');
    }

    user.isVerified = true;
    user.otp = null;
    user.otpExpiresAt = null;
    await this.usersService.save(user);

    return { message: 'Email verified successfully' };
  }

  async resendOtp(email: string): Promise<{ message: string }> {
    const user = await this.usersService.findByEmail(email);
    if (!user) {
      throw new BadRequestException('User not found');
    }

    // Optionally check if recently sent to prevent spam (you can skip this for now)
    const now = new Date();
    if (
      user.otpExpiresAt &&
      user.otpExpiresAt > new Date(now.getTime() - 60 * 1000)
    ) {
      throw new BadRequestException(
        'OTP already sent. Please wait before requesting again.',
      );
    }

    const otp = Math.floor(1000 + Math.random() * 9000).toString();

    user.otp = otp;
    user.otpExpiresAt = new Date(Date.now() + OTP_EXPIRY_DURATION_MS); // expires in 5 min

    await this.usersService.update(user.id, user);

    await this.emailService.sendEmail(
      email,
      'Your PaxRide OTP Code',
      `Your OTP code is: ${otp}. It will expire in 5 minutes.`,
    );
    return { message: 'OTP resent successfully' };
  }

  async login(email: string, password: string) {
    const user = await this.usersService.findByEmail(email);

    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }

    if (!user.isVerified) {
      throw new BadRequestException(
        'Please verify your email before logging in',
      );
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const token = this.generateToken({ id: user.id, email: user.email });

    return {
      message: 'Login successful',
      token,
      user: {
        id: user.id,
        email: user.email,
      },
    };
  }
}
