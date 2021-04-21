const Joi = require("joi");
const validateRequest = require("./validate-request");

function createAppoinmentSchema(req, res, next) {
  const schema = Joi.object({
    dateTimeStamp: Joi.string().required(),
    doctorId: Joi.string().required
  });
  validateRequest(req, next, schema);
}

function acceptAppointmentSchema(req, res, next) {
  const schema = Joi.object({
    id: Joi.number().required
  });
  validateRequest(req, next, schema);
}

module.exports = {
  createAppoinmentSchema,
  acceptAppointmentSchema,
};
