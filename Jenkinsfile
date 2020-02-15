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
        -v /var/jenkins_home/workspace/RoboDemo_master/data:/opt/robotframework/reports:Z \
        -v /var/jenkins_home/workspace/RoboDemo_master/tasks:/opt/robotframework/tests:Z \
        -e ROBOT_OPTIONS=\"--variable SEARCH:${params.SEARCH}\" \
        ppodgorsek/robot-framework"
      }
    }
    stage('save robot output') {
      steps {
step(
    [
    $class : 'RobotPublisher',
    outputPath : '/var/jenkins_home/workspace/RoboDemo_master/data',
    outputFileName : "*.xml",
    disableArchiveOutput : false,
    passThreshold : 100,
    unstableThreshold: 95.0,
    otherFiles : "*.png",
    ]
    ) 
	}
    }
	stage('dbbot') {
      steps {
		sh "python -m dbbot.run -b postgresql://postgres:postgres@172.17.0.1:5432/postgres /var/jenkins_home/workspace/RoboDemo_master/data/output.xml"
      }
    }
    stage('close') {
      steps {
        sh "rm -r data"
        sh "docker container prune --force"
      }
    }
  }
}
