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
    stage('build') {
      steps {
	script {
      	  docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
