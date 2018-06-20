'use strict'

//启动服务
const http = require('http')
const fs = require('fs')
const path = require('path')
const express = require('express')

//启动路由及端口处理
const app = express()
//http转发
const httpServer = http.createServer(app)
const httpPORT = process.env.HTTPPORT || 80
app.use('/', express.static(path.resolve(__dirname, '../')))
app.get('*', (req, res) => {
	res.send(fs.readFileSync(path.resolve('../404/404.html'), 'utf-8'))
})

//启动监听
console.log('--------------------------------------')
console.log(new Date())
httpServer.listen(httpPORT, () => {
	console.log(`TechNode http is on port${httpPORT} !`)
})
