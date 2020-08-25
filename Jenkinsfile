pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Building cart app'
        sh 'mvn compile'
      }
    }

    stage('test') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Testing cart app'
        sh 'mvn clean test'
      }
    }

    stage('package') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        echo 'Packaging cart app'
        sh 'mvn package -DskipTests'
        archiveArtifacts(artifacts: '**/target/*.jar', fingerprint: true)
      }
    }

    stage('Docker Build and Publish') {
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin')
          {

            def dockerImage = docker.build("Chato973/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  tools {
    maven 'Maven 3.6.3'
  }
}