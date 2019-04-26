pipeline {

  environment {
    registry = "achyasyahputra/my_flask_app"
    registryCredential = 'dockerhub'
    dockerImage = ''
  } 
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/achyasyahputra/my_flask_app'
      }
    } 
    stage('Build Image') {
      steps {
	script {
      	  dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
	  docker.withRegistry('https://index.docker.io/v1/', registryCredential) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused Image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  stage('Pull Image') {
      steps{
        sh "docker pull $registry:$BUILD_NUMBER"
      }
    }
  }
}
