---
title: Install SonarQube in Docker
author: ALTAF
date: 2023-08-26 14:10:00 +0800
categories: [Blogging, Tutorial]
tags: [writing,DevOps]
render_with_liquid: false
---


# How to set up SonarQube with a Docker Compose and DB



To set up SonarQube with a Docker Compose configuration and an accompanying database, you can use the following example. This configuration uses SonarQube with a PostgreSQL database. Make sure you have Docker and Docker Compose installed on your system before proceeding.
Create a file named docker-compose.yml and add the following content:

```yml

version: '3'

services:
  sonarqube:
    image: sonarqube:latest
    ports:
      - "9000:9000"
    environment:
      - SONARQUBE_JDBC_URL=jdbc:postgresql://sonarqube-db:5432/sonar
      - SONARQUBE_JDBC_USERNAME=sonar
      - SONARQUBE_JDBC_PASSWORD=sonar
    volumes:
      - sonarqube_data:/opt/sonarqube/data
      - sonarqube_extensions:/opt/sonarqube/extensions
      - sonarqube_logs:/opt/sonarqube/logs
      - sonarqube_temp:/opt/sonarqube/temp
    depends_on:
      - sonarqube-db

  sonarqube-db:
    image: postgres:latest
    environment:
      - POSTGRES_USER=sonar
      - POSTGRES_PASSWORD=sonar
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  sonarqube_data:
  sonarqube_extensions:
  sonarqube_logs:
  sonarqube_temp:
  postgres_data:

```

In this configuration:

* We define two services: sonarqube for SonarQube and sonarqube-db for PostgreSQL.

* The sonarqube service uses the official SonarQube image and sets up environment variables for the database connection.

* Volumes are defined for persisting data between container restarts.

* The depends_on option ensures that the sonarqube-db service starts before the sonarqube service.

To start SonarQube with the database, run the following command in the same directory as your docker-compose.yml file:

```bash
docker-compose up -d
```

This command will download the required Docker images and start the containers in the background. SonarQube will be available at http://localhost:9000 once it's up and running.

You can access the SonarQube web interface with the default credentials (admin/admin). Be sure to change the admin password after the initial login.

Note: This example uses basic configurations, and it's important to adjust security and other settings as per your specific requirements in a production environment.