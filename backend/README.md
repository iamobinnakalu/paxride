# PaxRide Backend (Auth Service)

This is the backend authentication module for the **PaxRide** project, built with **NestJS** and PostgreSQL. It supports user registration, OTP email verification, login with JWT, and secure password hashing.

---

## 🚀 Getting Started

### 1. Clone the repository and switch to the correct branch

```bash
git clone https://github.com/iamobinnakalu/paxride.git
cd paxride
git checkout feature/auth  # this is my branch name
```

### 2. Navigate to the backend folder and install dependencies

```bash
cd backend
npm install
```

### 3. Set up the environment variables

Create a `.env` file inside the `backend/` folder:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USERNAME=your_postgres_username
DB_PASSWORD=your_postgres_password
DB_NAME=paxride

JWT_SECRET=your_jwt_secret

SMTP_HOST=smtp.mailtrap.io
SMTP_PORT=2525
SMTP_USER=your_mailtrap_user
SMTP_PASS=your_mailtrap_pass
FROM_EMAIL=noreply@paxride.com
```

### 4. Start the development server

```bash
npm run start:dev
```

---

## 📮 API Endpoints

### ✅ Register

**POST** `/auth/register`

```json
{
  "email": "user@example.com",
  "password": "yourPassword"
}
```

### ✅ Verify OTP

**POST** `/auth/verify-otp`

```json
{
  "email": "user@example.com",
  "otp": "1234"
}
```

### ✅ Resend OTP

**POST** `/auth/resend-otp`

```json
{
  "email": "user@example.com"
}
```

### ✅ Login

**POST** `/auth/login`

```json
{
  "email": "user@example.com",
  "password": "yourPassword"
}
```

On success, you will receive a JWT token:

```json
{
  "token": "<jwt_token>",
  "user": {
    "id": "uuid",
    "email": "user@example.com"
  }
}
```

Use the token in the `Authorization` header:

```
Authorization: Bearer <jwt_token>
```

---

## 🧠 Notes for Frontend Team

* OTP is simulated using **Mailtrap** — you can view sent emails in the Mailtrap inbox.
* Login requires verified email.
* Add `Authorization: Bearer <token>` to access protected endpoints.

---

## 🙌 Need help?

Message me on Whatsapp
