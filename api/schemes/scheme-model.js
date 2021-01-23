// scheme-model
const db = require('../../data/db-config');

const find = () => {
    return db('schemes')
}

const findById = id => {
    return db('schemes')
        .where({id})
        .first()
}

const findSteps = id => {
    return db('steps as st')
        .join('schemes as sc', 'sc.id', 'st.scheme_id')
        .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
        .where('st.scheme_id', '=', id)
        .orderBy("step_number")
}

const add = scheme => {
    return db('schemes')
        .insert(scheme)
        .then(ids => {
            return findById(ids[0])
        });
}

const update = (changes, id) => {
    return db('schemes')
        .where('id', id)
        .update(changes)
        .then(ids => {
            return findById(id)
        })
}

const remove = async id => {
    const deletedScheme = await findById(id);
    return db('schemes')
        .where('id', id)
        .del()
        .then(scheme => {
            if (scheme === 0) {
                return null
            } else {
                return deletedScheme
            }
        })
}


module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}