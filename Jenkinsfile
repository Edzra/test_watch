pipeline {
   agent {
        label 'docker-agent'
    }

  environment {
    REGISTRY = 'registry.dockingideas.me'
    IMAGE_NAME = 'mock'
    CREDENTIALS_ID = 'nexus-docker-registry'  // Jenkins credential (username/password for registry)
  }

  stages {
    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${REGISTRY}/${IMAGE_NAME}")
        }
      }
    }

    stage('Push on Tag') {
      when {
        buildingTag()
      }
      steps {
        script {
          def tag = env.TAG_NAME
          echo "Pushing image to registry with tag: ${tag}"

          docker.withRegistry("https://${REGISTRY}", CREDENTIALS_ID) {
            dockerImage.push(tag)
            dockerImage.push('latest')
          }
        }
      }
    }
  }
}
