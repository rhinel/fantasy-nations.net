'use strict'

//启动服务
const http = require('http')
const fs = require('fs')
const path = require('path')
const express = require('express')
const compress = require('compression')

//启动路由及端口处理
const app = express()
const httpServer = http.createServer(app)
const httpPORT = process.env.HTTPPORT || 80

// 使用gzip
app.use(compress())

// route
app.use('/', express.static(path.resolve(__dirname, '../html/')))
app.use('/404/assets/', express.static(path.resolve(__dirname, '../404/assets/')))
app.get('*', (req, res) => {
	res.send(fs.readFileSync(path.resolve(__dirname, '../404/404.html'), 'utf-8'))
})

//启动监听
console.log('--------------------------------------')
console.log(new Date())
httpServer.listen(httpPORT, () => {
	console.log(`TechNode http is on port${httpPORT} !`)
})
