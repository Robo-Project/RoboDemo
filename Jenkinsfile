pipeline {
  agent any
  stages {
    stage('build and run') {
      steps {
        sh "docker run --rm \
        -v data:/opt/robotframework/reports:Z \
        -v $(pwd)/tasks/:/opt/robotframework/tests:Z \
        ppodgorsek/robot-framework"
      }
    }
    stage('save') {
      steps {
      sh "docker run --rm -v data:/saver/data roboteam/saver"
      }
    }
    stage('close') {
      steps {
        sh "docker container prune"
        sh "docker volume prune"
      }
    }

  }
}
