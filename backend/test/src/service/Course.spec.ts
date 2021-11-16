import { mocked } from 'ts-jest/utils';

import { ICourse } from '@/models/Course';
import { getAllCourses } from '@/repositories/Course';
import { getAllCoursesService } from '@/services/Course';

const getAllCoursesMock = mocked(getAllCourses, true);

jest.mock('@/repositories/Course');

describe('getAllCoursesService', () => {
  describe('Should return an array when', () => {
    it('get all courses ', async () => {
      getAllCoursesMock.mockResolvedValueOnce([{ _id: 'ok' }] as unknown as ICourse[]);
      const data = await getAllCoursesService();
      
      expect(data).toStrictEqual([{_id: 'ok'}]);
    });
  });
});
