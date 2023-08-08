echo “DevOps CW2"


node {
    def app
    /*3a. Clone repository from Github*/
    stage('Clone repository') {
        checkout scm
    }
 
    /*3b. Build Image*/
    stage('Build image') {
        app = docker.build("madihah99/devops")
    }

    /*3c. Test Image*/
    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    /*3d. Push Image to DockerHub*/
    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

        sshagent(['my-ssh-key']) {
    sh 'ssh ubuntu@3.92.68.99 kubectl set image deployments/devops devops=madihah99/devops:$BUILD_NUMBER'
    }
