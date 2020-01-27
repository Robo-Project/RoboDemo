pipeline {
  agent any
  stages {
    stage('build and run') {
      steps {
        sh "whoami"
        sh "docker-compose up"
      }
    }

  }
}
