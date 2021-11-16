import mongoose, { Schema, Document } from 'mongoose';

export interface IUser extends Document {
  _id: string
  name: string
  password: string
}

const UserSchema = new Schema({
  _id: { type: String, required: true },
  name: { type: String, required: true },
  password: { type: String, required: true },
}, { _id: false });

const User = mongoose.model<IUser>('users', UserSchema);

export default User;
