import { Router } from 'express';

import { createUser, userLogin } from '@/controllers/User';
import validateUserData from '@/validators/user';

const routes = Router();

routes.post('/create', validateUserData, createUser);

routes.post('/login', userLogin);

export default routes;
