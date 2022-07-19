# docker-jenkins

Docker image based on [jenkins/jenkins:lts](https://hub.docker.com/r/jenkins/jenkins) with docker CLI on master node.

## Usage

* Start jenkins : `docker-compose up -d`

* Retrieve initial password : `docker exec -ti jenkins cat /var/jenkins_home/secrets/initialAdminPassword`

* Open https://jenkins.dev.localhost

## Jenkins environment

You may add the following environment variables to write portable Jenkinsfile :

| Variable                      | Description                                                  | Example                             |
| ----------------------------- | ------------------------------------------------------------ | ----------------------------------- |
| DOCKER_REGISTRY               | Hostname for docker registry                                 | `registry.${HOST_HOSTNAME}`         |
| DOCKER_REGISTRY_URL           | URL for docker registry                                      | `https://registry.${HOST_HOSTNAME}` |
| DOCKER_REGISTRY_CREDENTIAL_ID | Jenkins credential id to access registry (username/password) | `nexus_user`                        |

## Notes

* This approach could not be the best one for production purpose. See [~jpetazzo/Using Docker-in-Docker for your CI or testing environment? Think twice.](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)
* Jenkins is added to docker group at runtime if `unix:///var/run/docker.sock` is mounted (**deprecated**)

## See also

* [www.jenkins.io - Installing Jenkins - docker](https://www.jenkins.io/doc/book/installing/docker/)
* [www.jenkins.io - Using Docker with Pipeline](https://www.jenkins.io/doc/book/pipeline/docker/)

## License

[MIT](LICENSE)




