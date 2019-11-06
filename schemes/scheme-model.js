const db = require("../data/schemes-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id: id });
}

function findSteps(id) {
  return db("schemes")
    .join("steps", "schemes.id", "steps.scheme_id")
    .select("steps.id", "steps.step_number", "steps.instructions")
    .where({ "schemes.id": id });
}

function add(scheme) {
  return db("schemes").insert(scheme);
}

function addStep(stepData, id) {
  return db("steps").insert({ ...stepData, scheme_id: id });
}

function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id: id });
}

function remove(id) {
  return db("schemes")
    .where({ id: id })
    .del();
}
