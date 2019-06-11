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
Sample **docker-compose.yml**  
```
GO-EGEM:
  image: buzzkillb/goegem:arm
  volumes:
    - ~/.ethergem:/data
  command: --syncmode=full --gcmode=archive --rpc --rpcapi=web3,eth,net,db,personal,txpool --rpccorsdomain=* --rpcaddr=0.0.0.0 --rpcvhosts=*
  ports:
    - 8895:8895
    - 30666:30666
```
