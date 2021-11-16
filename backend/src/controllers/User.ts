import { Request, Response } from 'express';

import { IUser } from '@/models/User';
import { createUserService, loginUserService } from '@/services/User';

const createUser = async (req: Request, res: Response): Promise<void> => {
  const userData: IUser = req.body;

  const auth = await createUserService(userData);

  res.send(auth);
};

const userLogin = async (req: Request, res: Response): Promise<void> => {
  const { _id, password } = req.body;

  const token = await loginUserService(_id, password);

  res.send(token);
};

export {
  createUser, userLogin,
};
