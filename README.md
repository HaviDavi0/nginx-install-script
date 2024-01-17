# Nginx Installer Script 

## Overview

This bash script `install_nginx.sh` is designed to facilitate the installation of Nginx on a remote server using SSH. It checks whether Nginx is installed, installing it if necessary, and ensuring that the Nginx service is running.

### Prerequisites

Before using this script, ensure you have the following:

- An SSH key pair for authentication.
- Access to the server with the specified IP address and username.

### Configuration

Open the script `install_nginx.sh` in a text editor of choice and edit the following variables:

```bash
# Declare Variables:
SSH_key="/path/to/your/private/key"
SERVER_IP="your_server_ip"
SERVER_USER="your_username"
```
