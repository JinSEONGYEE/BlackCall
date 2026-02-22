import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class AuthService {
    constructor(
        private prisma: PrismaService,
        private jwtService: JwtService,
    ) { }

    async validateKakaoUser(profile: any) {
        const { id, properties, kakao_account } = profile;
        const kakaoId = id.toString();
        const email = kakao_account?.email;
        const nickname = properties?.nickname;

        let user = await this.prisma.user.findUnique({
            where: { kakaoId },
        });

        if (!user) {
            user = await this.prisma.user.create({
                data: {
                    kakaoId,
                    email,
                    nickname,
                },
            });
        } else {
            // Update nickname/email if changed
            user = await this.prisma.user.update({
                where: { id: user.id },
                data: { email, nickname },
            });
        }

        return user;
    }

    async loginWithKakaoToken(accessToken: string) {
        try {
            const response = await fetch('https://kapi.kakao.com/v2/user/me', {
                headers: {
                    Authorization: `Bearer ${accessToken}`,
                },
            });

            if (!response.ok) {
                throw new Error('Failed to verify Kakao token');
            }

            const profile = await response.json();
            const user = await this.validateKakaoUser(profile);
            return this.login(user);
        } catch (e) {
            throw new Error('Kakao authentication failed');
        }
    }

    async login(user: any) {
        const payload = { userId: user.id, kakaoId: user.kakaoId };
        return {
            access_token: this.jwtService.sign(payload),
            user: {
                id: user.id,
                nickname: user.nickname,
                email: user.email,
            },
        };
    }
}
