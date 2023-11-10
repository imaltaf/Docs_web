# Juice Shop Docker

This repository provides a Docker image for OWASP Juice Shop - an intentionally insecure web application for security training and awareness.

## Getting Started

Follow these instructions to get a local instance of Juice Shop up and running using Docker.

### Prerequisites

- Docker installed on your machine. You can download it [here](https://www.docker.com/get-started).

### Usage

1. Open a terminal window.

2. Run the following command to pull the Juice Shop Docker image and start a container:

    ```bash
    docker run --rm -p 80:3000 bkimminich/juice-shop
    ```

   This will expose the Juice Shop application on http://localhost:80.

3. Open your web browser and navigate to http://localhost:80 to access the Juice Shop.

### Additional Options

- If you want to run the container in detached mode, you can add the `-d` flag:

    ```bash
    docker run -d --rm -p 80:3000 bkimminich/juice-shop
    ```

    This allows you to continue using the terminal without blocking it.

- To stop the container, use the following command:

    ```bash
    docker stop $(docker ps -q --filter ancestor=bkimminich/juice-shop)
    ```

### Contributing

If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
