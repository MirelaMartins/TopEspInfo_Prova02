import { sign } from 'jsonwebtoken';
import env from '@/configs/Env';

const generateAuthToken = (_id: string): string => sign({
  _id,
}, env.jwtSecret, { expiresIn: env.jwtExpirationTime });

export default generateAuthToken;
