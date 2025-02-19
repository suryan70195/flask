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
                withCredentials([string(credentialsId: 'dockerhub-jenkins-token', variable: 'DOCKER_PASSWOR
