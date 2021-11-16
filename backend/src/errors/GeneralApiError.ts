export default class GeneralApiError {
  public readonly message: Record<string, any>;

  public readonly status: number;

  constructor(message: Record<string, any> | any, status: number) {
    this.status = status;
    this.message = message;
  }
}
