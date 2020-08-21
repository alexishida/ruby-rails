# ruby-rails: A Ruby environment configured to run Rails projects

A Ruby environment configured to run Rails projects based on [Official Ruby Images](https://hub.docker.com/_/ruby).

### Versions

| Ruby Version | Rails Version | Tags |
|--------------|---------|------------------|
| 2.7.1 | 6.0.1 | 2.7.0, latest, 2.6.5 |


# Example usage
The following command will expose the current working directory on port 3000:
```bash
docker run -d \
--restart=always \
--name=app \
-p 3000:3000 \
-v /etc/localtime:/etc/localtime:ro \
-v /storage/sistema/app:/app \
-v /storage/sistema/bundle:/usr/local/bundle \
-v /storage/sistema/app/start.sh:/start.sh \
alexishida/ruby-rails:2.7.1
```

# Features

* Ruby 2.7.1
* Node v13.1.0
* Yarn 1.19.1
* Database drivers (Mariadb, Mysql, Sqlite and Postgres)
* Locale PT-BR

# Directories

Default directories:
* `/app`
* `/usr/local/bundle`
* `/start.sh`

# Contributing
I'll love for you to contribute to this container. You can request new features by creating an issue, or submit a pull request with your contribution.

By Alex Ishida