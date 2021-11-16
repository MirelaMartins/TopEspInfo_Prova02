/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable no-console */
import { NextFunction, Request, Response } from 'express';
import { isCelebrate } from 'celebrate';
import GeneralApiError from '@/errors/GeneralApiError';

const ExceptionHandler = (error: Error | GeneralApiError, req: Request, res: Response, _: NextFunction): Response => {
  if (error instanceof GeneralApiError) {
    return res.status(error.status).send(error.message);
  }

  if (isCelebrate(error)) {
    return res.status(400).send(error.message);
  }

  console.info(`Error name: ${error.name}\nerror message: ${error.message}\nstack: ${error.stack}`);
  return res.status(500).send('Unexpected error.');
};

export default ExceptionHandler;
