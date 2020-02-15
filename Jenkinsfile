pipeline {
  parameters {
      string(name: 'SEARCH', defaultValue: 'Robotic Process Automation', description: 'Searchword for wikipedia')
    }
  agent any
  stages {
    stage('setup') {
      steps {
          sh "rm -rf data"
          sh "mkdir data"
      }
    }
    stage('build and run') {
      steps {
       sh "docker run --rm \
        -v `pwd`/data:/opt/robotframework/reports:Z \
        -v `pwd`/tasks:/opt/robotframework/tests:Z \
        -e ROBOT_OPTIONS='--variable SEARCH:${SEARCH// /_}' \
        ppodgorsek/robot-framework"
      }
    }
   stage('dbbot') {
      steps {
		sh 'python -m dbbot.run -b postgresql://postgres:postgres@172.17.0.1:5432/postgres $(pwd)/data/output.xml'
      }
    }
  }
  post {
    always {
      robot outputPath: 'data/'
      sh "rm -r data"
      sh "docker container prune --force"
    }
  }
}


