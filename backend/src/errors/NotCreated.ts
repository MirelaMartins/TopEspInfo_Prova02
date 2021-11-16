import GeneralApiError from './GeneralApiError';

export default class NotCreated extends GeneralApiError {
  constructor() {
    super({ message: 'Resource not created' }, 424);
  }
}
