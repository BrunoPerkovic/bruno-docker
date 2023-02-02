import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    const hello = 'hello';
    return 'hello sss!';
  }
}
