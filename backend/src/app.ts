import express from 'express';
import cors from 'cors';
import 'express-async-errors';

import ExceptionHandler from '@/middlewares/ExceptionHandler';
import AuthHandler from '@/middlewares/Auth';

import AppRoutes from './routes';

const app = express();

app.use(express.json());
app.use(cors());

app.use(AuthHandler);

app.use('/api/', AppRoutes);

app.use(ExceptionHandler);

export default app;
