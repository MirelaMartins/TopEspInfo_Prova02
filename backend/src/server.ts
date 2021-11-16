import 'module-alias/register';
import 'dotenv/config';
import mongoose from 'mongoose';

import app from '@/app';
import env from '@/configs/Env';

/* eslint-disable no-console */
const main = async () => {
  try {
    await mongoose.connect(env.mongoUri);
    app.listen(env.port, () => {
      console.info(`Server running at: http://localhost:${env.port}`);
    });
  } catch (error) {
    const message = (error === typeof Object) ? JSON.stringify(error) : error as string;

    console.info(`Oops, the server did not start.\nReason -> ${message}`);
  }
};

// eslint-disable-next-line no-void
void main();
