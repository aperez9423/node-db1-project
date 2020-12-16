const express = require("express")
const db = require("./data/dbConfig")

const router = express.Router()

//GET account
router.get("/", async (req, res, next) => {
    try {
        const accounts = await db.select("*").from("accounts")

        res.json(accounts)
    } catch(err) {
        next(err)
    }
})
//GET account by ID
router.get("/:id", async (req, res, next) => {
    try {
        const accounts = await db
            .select("*")
            .from("accounts")
            .where("id", req.params.id)
            .limit(1)

        res.json(accounts[0])
    } catch(err) {
        next(err)
    }
})
//POST add account
router.post("/", async (req, res, next) => {
    try {
        const payload = {
            name: req.body.name,
            budget: req.body.budget
        }

        const [id] = await db.insert(payload).into("accounts")
        
        const account = await db("accounts").first().where("id", id)

        res.status(201).json(account)
    } catch(err) {
        next(err)
    }
})
//PUT update account
router.put("/:id", async (req, res, next) => {
    try {
        const payload = {
            name: req.body.name,
            budget: req.body.budget
        }

        await db("accounts").where("id", req.params.id).update(payload)

        const account = await db("accounts").where("id", req.params.id).first()
        res.json(account)
    } catch(err) {
        next(err)
    }
})
//DELETE account
router.delete("/:id", async (req, res, next) => {
    try {
        await db("accounts").where("id", req.params.id).del()

        res.status(204).end()
    } catch(err) {
        next(err)
    }
})

module.exports = router;