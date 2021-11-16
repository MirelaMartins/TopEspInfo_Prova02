import { Router } from 'express';

import User from '@/routes/User';

const routes = Router();

routes.use('/user', User);

export default routes;
