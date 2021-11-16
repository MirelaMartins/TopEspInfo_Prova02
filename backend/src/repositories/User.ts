import { LeanDocument } from 'mongoose';
import User, { IUser } from '@/models/User';

class UserDb {
static retrieveUser = async (id: string): Promise<LeanDocument<IUser>> => User.findById(id).lean().exec();
static createUser = async (data: LeanDocument<IUser>): Promise<IUser> => User.create(data);
}

export { UserDb };
