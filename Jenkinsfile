pipeline {
    agent {
        label 'DevOps_server'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repository') {
            steps {
                script {
                    git(url: 'https://github.com/imaltaf/Docs_web.git', branch: 'main')
                }
            }
        }

        stage('Update and Install') {
            steps {
                script {
                    sh 'sudo apt update && sudo apt install -y ruby-full build-essential zlib1g-dev git'
                    sh 'sudo gem install jekyll bundler'
                    sh 'sudo apt update && sudo apt install maven'
                }
            }
        }

        stage('Change Directory and Bundle Install') {
            steps {
                sh 'sudo bundle install --path vendor/bundle'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script{
                    withSonarQubeEnv(credentialsId: 'sonar_devops_server-token') {
                        sh "mvn clean package sonar:sonar"
                        }
                }
                
            }
        }

        stage('Stop Docker Compose') {
            steps {
                sh 'sudo docker-compose down'
                sh 'sudo docker rm -f docs_web || true'
                sh 'sudo docker rmi -f docs_web || true'
            }
        }

        stage('Build Jekyll Site') {
            steps {
                sh 'sudo JEKYLL_ENV=production bundle exec jekyll b'
            }
        }

        stage('Create Docker Image') {
            steps {
                sh 'sudo docker build -t docs_web .'
            }
        }

        stage('Start Docker Compose') {
            steps {
                sh 'sudo docker-compose up -d'
            }
        }

    }

    post {
        success {
            echo 'Pipeline succeeded! Add further actions here if needed.'
        }
        
        failure {
            echo 'Pipeline failed! Add further error handling here if needed.'
        }
    }
}
