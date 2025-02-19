pipeline {
    agent any

    environment {
        IMAGE_NAME = "yourdockerhubusername/lightweight-app"
        TAG = "latest"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-repo/lightweight-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u yourdockerhubusername --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Run Container (Optimized)') {
            steps {
                sh 'docker run -d -p 5000:5000 --name lightweight-app --memory=128m --cpus=0.2 $IMAGE_NAME:$TAG'
            }
        }
    }
}
