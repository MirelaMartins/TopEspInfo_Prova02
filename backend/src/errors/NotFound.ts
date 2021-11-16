import GeneralApiError from './GeneralApiError';

export default class NotFound extends GeneralApiError {
  constructor() {
    super({ message: 'Resource not found' }, 404);
  }
}
