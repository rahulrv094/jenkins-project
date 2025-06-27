pipeline {
  agent { label 'ec2-agent' } 

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
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withDockerRegistry([credentialsId: "$DOCKERHUB_CREDENTIALS", url: '']) {
          sh 'docker push $IMAGE_NAME'
        }
      }
    }
  }
}
