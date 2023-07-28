# iventoy-docker

Docker container for [iVentoy](https://iventoy.com)

## Usage
```
docker run --privileged --name iventoy --network host -v /path/to/data:/data -v /path/to/iso:/iso -v /path/to/user-script:/user illyathehath/iventoy:latest
```

## Ports
See https://iventoy.com/en/doc_portnum.html
| Port        | Protocol    | Description    |
| ----------- | ----------- | -------------- |
| 67/68	| UDP               | DHCP Server Port   |
| 69	| UDP               | TFTP Server Port   |
| 26000	| TCP               | iVentoy GUI HTTP Server Port   |
| 16000	| TCP               | iVentoy PXE Service HTTP Server Port   |
| 10809	| TCP               | NBD Server Port    |
