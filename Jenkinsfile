pipeline {

  environment {
    registry = "achyasyahputra/flaskapp"
    registryCredential = 'dockerhub'
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
      	  docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', dockerhub) {
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
  }
}
