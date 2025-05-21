pipeline {
  agent any

  environment {
    REGISTRY = 'registry.dockingideas.me'
    IMAGE_NAME = 'mock'
    CREDENTIALS_ID = 'my-docker-credentials'  // Jenkins credential (username/password for registry)
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
          def tag = env.GIT_TAG_NAME
          echo "Pushing image to registry with tag: ${tag}"

          docker.withRegistry("https://${REGISTRY}", CREDENTIALS_ID) {
            dockerImage.push(tag)
          }
        }
      }
    }
  }
}
