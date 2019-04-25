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
      	  docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
	  withCredentials([usernamePassword( credentialsId: 'dockerhub', usernameVariable: 'achyasyahputra', passwordVariable: 'Hitman129032')]) {

	   docker.withRegistry('', 'dockerhub') {
sh "docker login -u ${USERNAME} -p ${PASSWORD}"
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
