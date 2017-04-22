'use strict'

//启动服务
let http = require('http')
let fs = require('fs')
let path = require('path')

let express = require('express')
let bodyParser = require('body-parser')

//启动路由及端口处理
let app = express()
//http
let httpServer = http.createServer(app)
const httpPORT = process.env.HTTPPORT || 80
app.use('/', express.static(path.resolve(__dirname, '../')))
//使用post&json
app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json())

//启动监听
console.log('--------------------------------------')
console.log(new Date())
httpServer.listen(httpPORT, ()=>{
	console.log('TechNode http is on port ' + httpPORT + '!') 
})