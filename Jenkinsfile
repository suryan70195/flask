pipeline {
    agent any

    environment {
        IMAGE_NAME = "kubersurya/lightweight-app"
        TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/suryan70195/flask.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
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
                    sh "docker run -d -p 5000:5000 --name lightweight-flask-app ${IMAGE_NAME}:${TAG}"
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {  
                    sh 'docker rm -f lightweight-flask-app || true'
                }
            }
        }
    }
}
