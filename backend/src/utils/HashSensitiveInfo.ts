import { hash, genSalt, compare } from 'bcrypt';

import env from '@/configs/Env';

export const hashSensitiveInfo = async (info: string): Promise<string> => {
  const salt = await genSalt(env.salt);
  const hashedString = await hash(info, salt);

  return hashedString;
};

export const compareHashedInfo = async (info: string, hashedInfo: string): Promise<boolean> => compare(info, hashedInfo);
