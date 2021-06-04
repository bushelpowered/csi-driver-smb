# Install CSI driver with Helm 3

## Prerequisites
 - [install Helm](https://helm.sh/docs/intro/quickstart/#install-helm)

## install latest version
```console
helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts
helm install csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system
```

### install a specific version
```console
helm repo add csi-driver-smb https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts
helm install csi-driver-smb csi-driver-smb/csi-driver-smb --namespace kube-system --version v1.0.0
```

### search for all available chart versions
```console
helm search repo -l csi-driver-smb
```

## uninstall CSI driver
```console
helm uninstall csi-driver-smb -n kube-system
```

## latest chart configuration

The following table lists the configurable parameters of the latest SMB CSI Driver chart and default values.

| Parameter                                         | Description                                                | Default                                                           |
|---------------------------------------------------|------------------------------------------------------------|-------------------------------------------------------------------|
| `image.smb.repository`                            | csi-driver-smb docker image                                | mcr.microsoft.com/k8s/csi/smb-csi                                 |
| `image.smb.tag`                                   | csi-driver-smb docker image tag                            | latest                                                            |
| `image.smb.pullPolicy`                            | csi-driver-smb image pull policy                           | IfNotPresent                                                      |
| `image.csiProvisioner.repository`                 | csi-provisioner docker image                               | mcr.microsoft.com/oss/kubernetes-csi/csi-provisioner              |
| `image.csiProvisioner.tag`                        | csi-provisioner docker image tag                           | v1.4.0                                                            |
| `image.csiProvisioner.pullPolicy`                 | csi-provisioner image pull policy                          | IfNotPresent                                                      |
| `image.livenessProbe.repository`                  | liveness-probe docker image                                | mcr.microsoft.com/oss/kubernetes-csi/livenessprobe                |
| `image.livenessProbe.tag`                         | liveness-probe docker image tag                            | v2.3.0                                                            |
| `image.livenessProbe.pullPolicy`                  | liveness-probe image pull policy                           | IfNotPresent                                                      |
| `image.nodeDriverRegistrar.repository`            | csi-node-driver-registrar docker image                     | mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar    |
| `image.nodeDriverRegistrar.tag`                   | csi-node-driver-registrar docker image tag                 | v2.2.0                                                            |
| `image.nodeDriverRegistrar.pullPolicy`            | csi-node-driver-registrar image pull policy                | IfNotPresent                                                      |
| `imagePullSecrets`                                | Specify docker-registry secret names as an array           | [] (does not add image pull secrets to deployed pods)             |
| `serviceAccount.create`                           | whether create service account of csi-smb-controller       | true                                                              |
| `rbac.create`                                     | whether create rbac of csi-smb-controller                  | true                                                              |
| `controller.replicas`                             | the replicas of csi-smb-controller                                  | 2                                                   |
| `controller.metricsPort`                          | metrics port of csi-smb-controller                   |29644                                               |
| `controller.logLevel`                             | controller driver log level                                                          |`5`                                                           |
| `node.metricsPort`                                | metrics port of csi-smb-node                         |29645
| `node.logLevel`                                   | node driver log level                                                          |`5`                                                           |
| `linux.enabled`                                   | whether enable linux feature                               | true                                                              |
| `linux.kubelet`                                   | configure kubelet directory path on Linux agent node node                  | `/var/lib/kubelet`                                                |
| `windows.enabled`                                 | whether enable windows feature                             | false                                                             |
| `windows.kubelet`                                 | configure kubelet directory path on Windows agent node                | `'C:\var\lib\kubelet'`                                            |
| `windows.image.livenessProbe.repository`          | windows liveness-probe docker image                        | mcr.microsoft.com/oss/kubernetes-csi/livenessprobe                |
| `windows.image.livenessProbe.tag`                 | windows liveness-probe docker image tag                    | v2.3.0                                 |
| `windows.image.livenessProbe.pullPolicy`          | windows liveness-probe image pull policy                   | IfNotPresent                                                      |
| `windows.image.nodeDriverRegistrar.repository`    | windows csi-node-driver-registrar docker image             | mcr.microsoft.com/oss/kubernetes-csi/csi-node-driver-registrar    |
| `windows.image.nodeDriverRegistrar.tag`           | windows csi-node-driver-registrar docker image tag         | v2.2.0                                 |
| `windows.image.nodeDriverRegistrar.pullPolicy`    | windows csi-node-driver-registrar image pull policy        | IfNotPresent                                                      |
| `controller.runOnMaster`                          | run controller on master node                              | false                                                             |
| `node.livenessProbe.healthPort `                  | the health check port for liveness probe                   | `29643` |
| `controller.resources.csiProvisioner.limits.cpu`      | csi-provisioner cpu limits                            | 100m                                                           |
| `controller.resources.csiProvisioner.limits.memory`   | csi-provisioner memory limits                         | 100Mi                                                          |
| `controller.resources.csiProvisioner.requests.cpu`    | csi-provisioner cpu requests limits                   | 10m                                                            |
| `controller.resources.csiProvisioner.requests.memory` | csi-provisioner memory requests limits                | 20Mi                                                           |
| `controller.resources.livenessProbe.limits.cpu`       | liveness-probe cpu limits                             | 100m                                                           |
| `controller.resources.livenessProbe.limits.memory`    | liveness-probe memory limits                          | 300Mi                                                          |
| `controller.resources.livenessProbe.requests.cpu`     | liveness-probe cpu requests limits                    | 10m                                                            |
| `controller.resources.livenessProbe.requests.memory`  | liveness-probe memory requests limits                 | 20Mi                                                           |
| `controller.resources.smb.limits.cpu`                | smb-csi-driver cpu limits                            | 200m                                                           |
| `controller.resources.smb.limits.memory`             | smb-csi-driver memory limits                         | 200Mi                                                          |
| `controller.resources.smb.requests.cpu`              | smb-csi-driver cpu requests limits                   | 10m                                                            |
| `controller.resources.smb.requests.memory`           | smb-csi-driver memory requests limits                | 20Mi                                                           |
| `controller.resources.csiResizer.limits.cpu`          | csi-resizer cpu limits                                | 100m                                                           |
| `controller.resources.csiResizer.limits.memory`       | csi-resizer memory limits                             | 300Mi                                                          |
| `controller.resources.csiResizer.requests.cpu`        | csi-resizer cpu requests limits                       | 10m                                                            |
| `controller.resources.csiResizer.requests.memory`     | csi-resizer memory requests limits                    | 20Mi                                                           |
| `controller.affinity`                                 | controller pod affinity                               | {}                                                             |
| `controller.nodeSelector`                             | controller pod node selector                          | {}                                                             |
| `controller.tolerations`                              | controller pod tolerations                            | []                                                             |
| `node.resources.livenessProbe.limits.cpu`             | liveness-probe cpu limits                             | 100m                                                           |
| `node.resources.livenessProbe.limits.memory`          | liveness-probe memory limits                          | 100Mi                                                          |
| `node.resources.livenessProbe.requests.cpu`           | liveness-probe cpu requests limits                    | 10m                                                            |
| `node.resources.livenessProbe.requests.memory`        | liveness-probe memory requests limits                 | 20Mi                                                           |
| `node.resources.nodeDriverRegistrar.limits.cpu`       | csi-node-driver-registrar cpu limits                  | 100m                                                           |
| `node.resources.nodeDriverRegistrar.limits.memory`    | csi-node-driver-registrar memory limits               | 100Mi                                                          |
| `node.resources.nodeDriverRegistrar.requests.cpu`     | csi-node-driver-registrar cpu requests limits         | 10m                                                            |
| `node.resources.nodeDriverRegistrar.requests.memory`  | csi-node-driver-registrar memory requests limits      | 20Mi                                                           |
| `node.resources.smb.limits.cpu`                      | smb-csi-driver cpu limits                            | `2`                                                            |
| `node.resources.smb.limits.memory`                   | smb-csi-driver memory limits                         | 2100Mi                                                         |
| `node.resources.smb.requests.cpu`                    | smb-csi-driver cpu requests limits                   | 10m                                                            |
| `node.resources.smb.requests.memory`                 | smb-csi-driver memory requests limits                | 20Mi                                                           |
| `node.affinity`                                       | node pod affinity                                     | {}                                                             |
| `node.nodeSelector`                                   | node pod node selector                                | {}                                                             |
| `node.tolerations`                                    | node pod tolerations                                  | []                                                             |
| `podAnnotations`                                      | collection of annotations to add to all the pods      | {}                                                             |
| `podLabels`                                           | collection of labels to add to all the pods           | {}                                                             |
| `priorityClassName`                                   | priority class name to be added to pods               | system-cluster-critical                                        |
| `securityContext`                                     | security context to be added to pods                  | {}                                                             |

## troubleshooting
 - Add `--wait -v=5 --debug` in `helm install` command to get detailed error
 - Use `kubectl describe` to acquire more info
