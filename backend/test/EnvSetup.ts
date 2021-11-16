import dotenv from 'dotenv';

// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types
export default () => {
  dotenv.config({ path: './test/.test.env' });
};
