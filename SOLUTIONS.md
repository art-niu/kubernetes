# Solutions

## Problem:
```
Pods (i.e. coredns) are not spreaded on each node.
```

## Cause:
In coredns deployment, podAffinityTerm attired to zone which is sof entity.
```
                topologyKey: failure-domain.beta.kubernetes.io/zone
```

## Solution:
Change topologyKey to hostname in coredns deployment
```
                topologyKey: kubernetes.io/hostname
```

Reference: https://kubernetes.io/docs/tasks/administer-cluster/nodelocaldns/
