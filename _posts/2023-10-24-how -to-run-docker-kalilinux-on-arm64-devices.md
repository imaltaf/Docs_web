# Docker Compose with a Kali Linux container 0n ``ARM64``

To use Docker Compose with a Kali Linux container, you can create a ```docker-compose.yml``` file and then use the docker-compose command to manage your containers. However, the docker-compose tool does not officially support ``ARM64`` architecture directly. You can still use Docker Compose, but you need to make sure your Kali Linux image is available for ``ARM64``.

## Here's how you can create a basic ```docker-compose.yml``` file and run it:

Create a ```docker-compose.yml``` file with the following contents:

```yml 
version: '3'
services:
  kali:
    image: kalilinux/kali-rolling:``arm64``
    container_name: kali_container
    command: sleep infinity  # Keeps the container running

```
Save this file in a directory of your choice.

Open a terminal and navigate to the directory where you saved the ```docker-compose.yml``` file.

Use the ```docker-compose up -d``` command to start the Kali Linux container in detached mode:


```bash
docker-compose up -d
```
This will download the Kali Linux ``ARM64`` image and start a container named kali_container. The sleep infinity command is used to keep the container running in the background.

To access the Kali Linux container, you can use the docker exec command:


```bash 
docker exec -it kali_container /bin/bash
```

This command opens a Bash shell in the running Kali Linux container. From there, you can use Kali Linux as you normally would.

Remember that Kali Linux is a specialized distribution for penetration testing and security auditing. Make sure to use it responsibly and within legal boundaries.