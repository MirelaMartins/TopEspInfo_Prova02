import { mocked } from 'ts-jest/utils';
import request from 'supertest';

import NotCreated from '@/errors/NotCreated';
import { IUser } from '@/models/User';
import { createUser } from '@/repositories/User';
import app from '@/app';

const createUserMock = mocked(createUser, true);

jest.mock('@/repositories/User');

describe('userPost Route', () => {
  describe('Should return 201 when ', () => {
    it('a user was created ', async () => {
      createUserMock.mockResolvedValueOnce('ok' as unknown as IUser);
      const { status } = await request(app)
        .post('/api/user/create')
        .send({ data: 'ok' });

      expect(status).toBe(200);
    });
  });

  describe('Should return 424 when ', () => {
    it('a user was not created ', async () => {
      createUserMock.mockResolvedValueOnce(null);
      try {
        await request(app)
          .post('/api/user')
          .send({ data: 'ok' });
      } catch (error) {
        expect(error).toBeInstanceOf(NotCreated);
      }
    });
  });
});
