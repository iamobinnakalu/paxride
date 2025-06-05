import { Controller, Get, Request, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { UserRequest } from '../auth/types/user-request.interface';

@Controller('users')
export class UsersController {
  @UseGuards(AuthGuard('jwt')) // 🔒 Protect with JWT
  @Get('profile')
  getProfile(@Request() req: UserRequest) {
    return req.user; // this comes from jwt.strategy.ts validate() return
  }
}
