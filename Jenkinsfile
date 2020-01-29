pipeline {
  agent any
  stages {
    stage('build and run') {
      steps {
        sh "docker-compose up"
      }
    }
    stage('close') {
      steps {
        sh "docker-compose down"
      }
    }

  }
}
