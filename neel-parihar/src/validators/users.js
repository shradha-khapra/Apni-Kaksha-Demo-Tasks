const Joi = require("joi");
const validateRequest = require("./validate-request");
const { roles } = require("../../config");

function authenticateSchema(req, res, next) {
  const schema = Joi.object({
    email: Joi.string().required(),
    password: Joi.string().required(),
  });
  validateRequest(req, next, schema);
}

function registerSchema(req, res, next) {
  const schema = Joi.object({
    firstName: Joi.string().required(),
    lastName: Joi.string().required(),
    role: Joi.string().required().valid(roles.doctor, roles.patient),
    email: Joi.string().required(),
    password: Joi.string().min(8).required(),
    contactNo: Joi.number().required(),
    qualification: Joi.alternatives().conditional("role", {
      is: roles.doctor,
      then: Joi.string().required(),
    }),
    specialization: Joi.alternatives().conditional("role", {
      is: roles.doctor,
      then: Joi.string().required(),
    }),
  });
  validateRequest(req, next, schema);
}

module.exports = {
  authenticateSchema,
  registerSchema
};
