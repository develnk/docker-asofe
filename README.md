#### Basic usage
For starting container need create a local folder for keep wallet file and blockchain.
For example command to start:

*docker run --name asofe --restart=always --volume=/home/docker/asofe/data:/root/.asofe:rw -d develnk/docker-asofe*


The wallet and blockchain will be keeped in the folder */home/docker/asofe/data*
The folder shall be have absolute path.
To this folder need copy config file asofe.conf for example from [asofe.conf](https://github.com/TheLightSide/asofe/blob/master/contrib/debian/examples/asofe.conf)

**For execute wallet commands:**
* docker exec -it asofe asofe-cli getinfo
* docker exec -it asofe asofe-cli getnewaddress ""
* docker exec -it asofe asofe-cli getaccountaddress ""
* docker exec -it asofe asofe-cli getbalance ""
