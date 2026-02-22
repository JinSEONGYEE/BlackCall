import { Controller, Get, Post, Body, UseGuards, Req, UnauthorizedException } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';

@Controller('v1/auth')
export class AuthController {
    constructor(private authService: AuthService) { }

    @Get('kakao')
    @UseGuards(AuthGuard('kakao'))
    async kakaoLogin() {
        // Redirects to Kakao login page
    }

    @Get('kakao/callback')
    @UseGuards(AuthGuard('kakao'))
    async kakaoLoginCallback(@Req() req) {
        // This part is called after successful Kakao login
        return this.authService.login(req.user);
    }

    @Post('kakao/login')
    async loginWithKakaoToken(@Body('kakaoAccessToken') accessToken: string) {
        return this.authService.loginWithKakaoToken(accessToken);
    }

    @Get('profile')
    @UseGuards(AuthGuard('jwt'))
    getProfile(@Req() req) {
        return req.user;
    }
}
