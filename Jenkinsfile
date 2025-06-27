pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Jenkins credentials ID
    IMAGE_NAME = 'rahulrv098/jenkins-demo'
  }

  stages {
    stage('Clone') {
      steps {
        git branch: 'main', url: 'https://github.com/rahulrv094/jenkins-project.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        bat 'docker build -t myimage .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withDockerRegistry([credentialsId: "$DOCKERHUB_CREDENTIALS", url: '']) {
          bat 'docker push myimage'
        }
      }
    }
  }
}
