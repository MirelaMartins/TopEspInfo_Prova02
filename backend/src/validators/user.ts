import { celebrate, Segments, Joi } from 'celebrate';

const validateUserData = celebrate({
  [Segments.BODY]: Joi.object().keys({
    _id: Joi.string(),
    name: Joi.string(),
    password: Joi.string().required(),
  }),
});

export default validateUserData;
