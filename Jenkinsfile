pipeline {
    agent {
        label 'DevOps_server'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                // Clean workspace before cloning
                deleteDir()
            }
        }

        stage('Clone Repository') {
            steps {
                script {
                    // Clone the "main" branch of the Git repository
                    git(url: 'https://github.com/imaltaf/Docs_web.git', branch: 'main')
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

                    sh 'sudo gem install jekyll bundler'
                }
            }
        }
        stage('Change Directory and Bundle Install') {
            steps {
                script {
                    // Change directory to the cloned repository
            dir('Docs_web') {
                    // Set up Ruby environment if necessary
                    // ...
                    
                    // Install gems locally in the project directory
                    sh 'sudo bundle install --path vendor/bundle'
            }
        }
    }
}





        
        stage('Stop Docker Compose') {
            steps {
                dir('Docs_web') {
                        // Set the JEKYLL_ENV variable and build the Jekyll site
                        sh 'sudo docker-compose down'
                        sh 'docker rm -f docs_web || true'
                        sh 'docker rmi -f docs_web || true'
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
                    }
                }
            }
        }
        stage('Create Docker Image') {
            steps {
                script {
                    // Build the Docker image using absolute paths
                    sh 'docker build -t docs_web /home/ubuntu/workspace/Altaf_Docs'
        }
    }
}


        stage('Start Docker Compose') {
            steps {
                // Start the Docker Compose application
                dir('Docs_web') {
                        // Set the JEKYLL_ENV variable and build the Jekyll site
                        sh 'sudo docker-compose up -d'
                }
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
