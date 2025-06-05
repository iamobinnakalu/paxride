// src/auth/types/user-request.interface.ts
import { Request } from 'express';

export interface UserRequest extends Request {
  user: {
    userId: string;
    email: string;
  };
}
