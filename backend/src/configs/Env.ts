const decimalBase = 10;
const env = {
  port: parseInt(process.env.PORT, decimalBase) || 5000,
  mongoUri: process.env.MONGO_URI,
  jwtSecret: process.env.JWT_SECRET,
  jwtExpirationTime: process.env.JWT_EXPIRATION_TIME,
  salt: parseInt(process.env.SALT, decimalBase),
};

Object.freeze(env);

export default env;
