## Set up a Samba Server on a Kubernetes cluster
This page will show you how to set up a Samba Server deployment on a Kubernetes cluster.

 - Use `kubectl create secret` to create `smbcreds` secret storing Samba Server username, password
```console
kubectl create secret generic smbcreds --from-literal username=USERNAME --from-literal password="PASSWORD"
```

#### Option#1. Create a Samba Server deployment on local disk
> Note: This example is for development purpose only. Since samba server is sticky to the node it is scheduled on, data would be lost if the pod is rescheduled on another node.

> modify `/smbshare-volume` in deployment to specify different path for smb share data store
 - Access by Linux node
```console
kubectl create -f https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/example/smb-provisioner/smb-server.yaml
```
 - Access by Windows node
```console
kubectl create -f https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/example/smb-provisioner/smb-server-lb.yaml
```

#### Option#2. Create a Samba Server deployment on network disk
Default network disk in Azure is Azure managed disk and default one in GCE is persistent disk.

```console
kubectl create -f https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/example/smb-provisioner/smb-server-networkdisk.yaml
```

After deployment, a new service `smb-server` is created, file share path is `//smb-server.default.svc.cluster.local/share`
