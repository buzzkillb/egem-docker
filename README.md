# egem-docker
go-egem docker - egem.io  
To run
```
docker run --name=go-egem --rm -t -v ~/egem:/data -P buzzkillb/goegem:arm
```
Using https://gitlab.com/ethergem/egem-configs/blob/master/config.toml  
To run **Archive Node**  
```
docker run --name=go-egem --rm -t -v ~/egem:/data -P buzzkillb/goegem:arm --syncmode full --gcmode archive
```
