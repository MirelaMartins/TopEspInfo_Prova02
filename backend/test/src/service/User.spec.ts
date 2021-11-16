import { mocked } from 'ts-jest/utils';

import NotCreated from '@/errors/NotCreated';
import { IUser } from '@/models/User';
import { createUser } from '@/repositories/User';
import { createUserService } from '@/services/User';
import generateAuthToken from '@/utils/Auth';

const createUserMock = mocked(createUser, true);

jest.mock('@/repositories/User');
Date.now = jest.fn(() => 1487076708000);

describe('createUserService', () => {
  describe('Should return a valid jwt string when', () => {
    it('a user was created ', async () => {
      createUserMock.mockResolvedValueOnce({ _id: 'ok' } as unknown as IUser);
      const data = await createUserService({ _id: 'ok' } as unknown as IUser);
      const jwt = generateAuthToken('ok');

      expect(data).toMatch(jwt);
    });
  });

  describe('Should throw NotCreated when ', () => {
    it('a user was not created ', async () => {
      createUserMock.mockResolvedValueOnce(null);
      try {
        await createUserService('ok' as unknown as IUser);
      } catch (error) {
        expect(error).toBeInstanceOf(NotCreated);
      }
    });
  });
});
