import { mocked } from 'ts-jest/utils';
import request from 'supertest';

import { ICourse } from '@/models/Course';
import { getAllCourses } from '@/repositories/Course';
import app from '@/app';

const getAllCoursesMock = mocked(getAllCourses, true);

jest.mock('@/repositories/Course');

describe('getAllCourses Route', () => {
    describe('Should return 200 when ', () => {
      it('get all courses ', async () => {
        getAllCoursesMock.mockResolvedValueOnce('ok' as unknown as ICourse[]);
        const { status } = await request(app)
          .get('/api/course/')
  
        expect(status).toBe(200);
      });

      it('Should return 500 when ', async () => {
        getAllCoursesMock.mockRejectedValueOnce(new Error('erro'));
        const { status } = await request(app)
          .get('/api/course/')
  
        expect(status).toBe(500);
      });
    });
});