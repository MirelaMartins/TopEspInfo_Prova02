import GeneralApiError from './GeneralApiError';

export default class Unauthorized extends GeneralApiError {
  constructor() {
    super({ message: 'Unauthorized access' }, 401);
  }
}
