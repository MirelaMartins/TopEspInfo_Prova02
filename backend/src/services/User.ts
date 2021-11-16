import NotCreated from '@/errors/NotCreated';
import NotFound from '@/errors/NotFound';
import Unauthorized from '@/errors/Unauthorized';
import { IUser } from '@/models/User';
import { UserDb } from '@/repositories/User';
import generateAuthToken from '@/utils/Auth';
import { compareHashedInfo, hashSensitiveInfo } from '@/utils/HashSensitiveInfo';

const createUserService = async (userData: IUser): Promise<string> => {
  const password = await hashSensitiveInfo(userData.password);
  const user = await UserDb.createUser({ _id: userData._id, name: userData.name, password });

  if (!user) throw new NotCreated();

  return generateAuthToken(user._id);
};


const loginUserService = async (id: string, password: string): Promise<string> => {
  const user = await UserDb.retrieveUser(id);

  if (!user) throw new NotFound();

  if (await compareHashedInfo(password, user.password)) {
    // return generateAuthToken(user._id);
    return user.name
  }

  throw new Unauthorized();
};

export {
  createUserService, loginUserService,
};
