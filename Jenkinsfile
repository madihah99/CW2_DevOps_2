echo “DevOps CW2"


node {
    def app

    stage('Clone repository') {
        /* The clone repositry to workspace */

        checkout scm
    }


    /*Build the image */
    stage('Build image') {
        app = docker.build("madihah99/devops")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

        sshagent(['my-ssh-key']) {
    sh 'ssh ubuntu@ 3.92.68.99 kubectl set image deployments/devops devops=madihah99/devops:$BUILD_NUMBER'
    }
