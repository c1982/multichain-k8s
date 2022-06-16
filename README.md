# MultiChain on Kubernetes with EKS

This repository contains the [MultiChain](https://www.multichain.com/) cluster configuration on AWS EKS. 

Note: This configuration works only on AWS EKS. If you want to use another cloud provider, you need to chage kubernetes.io/aws-ebs in StorageClass.

For more information, please visit [https://github.com/MultiChain/multichain](https://github.com/MultiChain/multichain)

### Config

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: multichain-config
  labels:
    app: multichain
data:
  MC_CHAINNAME: mchain # Chain name, used as first argument for multichaind and multichain-cli.
  MC_NETWORK_PORT: "8571" # Default TCP/IP port for incoming JSON-RPC API requests.
  MC_RPC_PORT: "8570" #Default TCP/IP port for incoming JSON-RPC API requests.
  MC_RPC_USER: multichainrpc # Default username for JSON-RPC API requests.
  MC_RPC_PASSWORD: p@55W0rd # Don't forget to move to secret for Prod!
  MC_MASTER_NODE: multichain-0.multichain.default.svc.cluster.local # Default master node for nodes.
```

### Run

This command will run the MultiChain cluster on AWS EKS with StatefulSet.

```bash
kubectl apply -f multichain.yaml
```

### Docker Image (linux/amd64)

URL:
https://hub.docker.com/r/c1982/multichain

> docker pull c1982/multichain