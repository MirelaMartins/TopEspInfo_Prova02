import GeneralApiError from './GeneralApiError';

export default class Unexpected extends GeneralApiError {
  constructor() {
    super({ message: 'Unexpected internal error' }, 500);
  }
}
