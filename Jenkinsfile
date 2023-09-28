pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clean workspace before cloning (optional)
                    deleteDir()
                    
                    // Clone the Git repository
                    git(url: 'https://github.com/imaltaf/Docs_web')
                }
            }
        }
        
        stage('Update and Install') {
            steps {
                script {
                    // Update the package list
                    sh 'sudo apt update'
                    
                    // Install required packages
                    sh 'sudo apt install -y ruby-full build-essential zlib1g-dev git'
                }
            }
        }

        stage('Change Directory and Bundle Install') {
            steps {
                script {
                    // Change directory to the cloned repository
                    dir('Docs_web') {
                        // Run the bundle command
                        sh 'bundle'
                    }
                }
            }
        }

        
        stage('Stop Docker Compose') {
            steps {
                // Stop the Docker Compose application
                sh 'docker-compose down'
            }
        }

        stage('Remove and Delete Docker Image') {
            steps {
                script {
                    // Remove the Docker image (if exists)
                    sh 'docker rm -f docs_web || true'
                    sh 'docker rmi -f docs_web || true'
                }
            }
        }

        stage('Create Docker Image') {
            steps {
                script {
                    // Create a Dockerfile
                    writeFile file: 'Dockerfile', text: '''
                        FROM nginx:stable-alpine
                        COPY _site /usr/share/nginx/html
                    '''
                }
            }
        }

        stage('Build Jekyll Site') {
            steps {
                script {
                    // Change directory to the cloned repository
                    dir('Docs_web') {
                        // Set the JEKYLL_ENV variable and build the Jekyll site
                        sh 'JEKYLL_ENV=production bundle exec jekyll b'

                        // Build the Docker image
                        sh 'docker build -t docs_web .'
                    }
                }
            }
        }

        stage('Start Docker Compose') {
            steps {
                // Start the Docker Compose application
                sh 'docker-compose up -d'
            }
        }
        
        // Add more stages for your deployment process here
        // For example, you might have stages for testing and other tasks.
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
