pipeline {
  agent {
    docker {
      image 'maven:3-openjdk-11'
    }

  }
  stages {
    stage('build') {
      steps {
        echo 'Building cart app'
        sh 'mvn compile'
      }
    }

    stage('test') {
      steps {
        echo 'Testing cart app'
        sh 'mvn clean test'
      }
    }

    stage('package') {
      steps {
        echo 'Packaging cart app'
        sh 'mvn package -DskipTests'
        archiveArtifacts(artifacts: '**/target/*.jar', fingerprint: true)
      }
    }

  }
  tools {
    maven 'Maven 3.6.3'
  }
}