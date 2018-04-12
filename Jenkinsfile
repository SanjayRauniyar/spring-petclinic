pipeline {
    agent { label 'linux' }
    tools {
    maven 'M3'
  }
    stages {
        stage ('Checkout') {
          steps {
            git 'https://github.com/SanjayRauniyar/spring-petclinic.git'
          }
        }
        stage('Build') {
            steps {
                sh 'mvn clean compile'
                         
            }
        }
      stage('Test') {
      steps {
        sh 'mvn test'
        junit '**/target/surefire-reports/TEST-*.xml'
       
      }
    } 
        
        stage('Package') {
      steps {
        sh 'mvn package'
        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
      }
        }
        
         stage('Deployment') {
          steps {
             sh 'cp target/*.jar ~/pet'
             }
              post{
            always{
                echo "running the application"
                sh 'docker stop pet_app'
                sh 'docker build -t springapp .'
                sh 'docker run -d --name pet_app -p 8090:8090 springapp'
            }
        }
        }
        
       
       
    }
}
