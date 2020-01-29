pipeline {
  agent any
  stages {
    stage('build and run') {
      steps {
        sh "docker run --rm \
        -v data:/opt/robotframework/reports:Z \
        -v /var/lib/jenkins/workspace/RoboDemo_master/tasks:/opt/robotframework/tests:Z \
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
        sh "docker container prune --force"
        sh "docker volume prune --force"
      }
    }

  }
}
