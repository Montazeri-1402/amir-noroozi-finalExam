const { Prisma } = require('@prisma/client');
var express = require('express');
var router = express.Router();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

router.get('/get/bmi', async function (req, res, next) {
    let {
        infullname,
        inage,
        ingender,
        inheight,
        inweight
    } = req.body;

    let meterHeight = inheight / 100;
    let inip = req.ip;
    let inbmi = Math.round(inweight / Math.pow(meterHeight, 2));

    res.send(await prisma.users.create({
        data : {
            fullname: infullname,
            age : inage,
            gender : ingender,
            height : inheight,
            weight : inweight,
            ip : inip,
            bmi : inbmi,
        }
    }));

});

router.get('/delete' , async function(req, res, next) {
    res.send(await prisma.users.deleteMany());
});

router.get('/history', async function(req, res,index) {
    let { page } = req.body;
    res.send(await prisma.users.findMany(
        {
            skip : page * 2,
            take : 2,
            orderBy : {
                time : "desc"
            }
        }
    ));
});

module.exports = router;