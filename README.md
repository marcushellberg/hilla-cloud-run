# Example app for Hilla on Cloud Run

## Developing locally

Run with the default Maven command: 

```
mvn
```

## Building a container

Create a production build of the app first
```
mvn -Pproduction clean package
```

Then build the container
```
docker build . -t hilla-on-cloud-run
```