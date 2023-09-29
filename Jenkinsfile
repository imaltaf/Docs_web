pipeline {
    agent {
        label 'DevOps_server'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
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
                    sh 'apt update && apt install -y ruby-full build-essential zlib1g-dev git'
                    sh 'sudo gem install jekyll bundler'
                }
            }
        }

        stage('Change Directory and Bundle Install') {
            steps {
                script {
                    dir('Docs_web') {
                        sh 'sudo bundle install --path vendor/bundle'
                    }
                }
            }
        }

        stage('Stop Docker Compose') {
            steps {
                dir('Docs_web') {
                    sh 'docker-compose down /home/ubuntu/workspace/Altaf_Docs/Dockerfile'
                    sh 'docker rm -f docs_web || true'
                    sh 'docker rmi -f docs_web || true'
                }
            }
        }

        stage('Build Jekyll Site') {
            steps {
                script {
                    dir('Docs_web') {
                        sh 'sudo JEKYLL_ENV=production bundle exec jekyll b'
                    }
                }
            }
        }

        stage('Create Docker Image') {
            steps {
                script {
                    sh 'docker build -t docs_web -f /home/ubuntu/workspace/Altaf_Docs/Dockerfile'
                }
            }
        }

        stage('Start Docker Compose') {
            steps {
                dir('Docs_web') {
                    sh 'docker-compose up -d /home/ubuntu/workspace/Altaf_Docs/Dockerfile'
                }
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
