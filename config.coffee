module.exports =
  server:
    port: process.env.SERVER_PORT || 3000
  db:
    name: process.env.DB_NAME || 'angular-blog'
    host: process.env.DB_HOST || 'localhost'
    port: process.env.DB_PORT || 27017
