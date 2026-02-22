import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy } from 'passport-kakao';
import { AuthService } from '../auth.service';

@Injectable()
export class KakaoStrategy extends PassportStrategy(Strategy, 'kakao') {
    constructor(private authService: AuthService) {
        super({
            clientID: process.env.KAKAO_CLIENT_ID || 'placeholder',
            clientSecret: '',
            callbackURL: process.env.KAKAO_CALLBACK_URL || 'http://localhost:3000/v1/auth/kakao/callback',
        });
    }

    async validate(accessToken: string, refreshToken: string, profile: any, done: any) {
        const user = await this.authService.validateKakaoUser(profile);
        return done(null, user);
    }
}
