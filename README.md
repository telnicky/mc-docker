# Minecraft Hunger Games

## Usage
```
docker build -t minecraft .
docker run -d -p 25565:25565 --name minecraft minecraft
```

Monitor server with
```
docker logs -f minecraft
```
