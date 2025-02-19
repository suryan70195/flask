pipeline {
    agent any

    environment {
        IMAGE_NAME = "kubersurya/lightweight-app"
        TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/suryan70195/flask.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${IMAGE_NAME}:${TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-jenkins-token', variable: 'DOCKER_PASSWORD')]) {
                    sh "echo ${DOCKER_PASSWORD} | docker login -u kubersurya --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${IMAGE_NAME}:${TAG}"
            }
        }

        stage('Run Container (Optimized)') {
            steps {
                script {
                    // Run Docker container
                    sh "docker run -d -p 5000:5000 --name lightweight-flask-app ${IMAGE_NAME}:${TAG}"
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up container after testing (Optional)
                    sh 'docker rm -f lightweight-flask-app || true'
                }
            }
        }
    }
}
