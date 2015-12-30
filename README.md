# sinatra-sidekiq-example

A simple API application with [sinatra](http://www.sinatrarb.com/) and [sidekiq](http://sidekiq.org/).

## Usage

Run docker.

```
$ docker-machine start dev
$ docker-machine env dev
```

Run web and redis containers.

```
$ docker-compose build
$ docker-compose run -d
```

Use API

```
$ curl -X POST -H "Accept: application/json" http://`docker-machine ip dev`:5000/things -d '{"id": 1, "thing": "foo"}'
$ curl -X GET http://`docker-machine ip dev`:5000/things
```

