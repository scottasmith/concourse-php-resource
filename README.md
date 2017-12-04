# concourse-php-resource

DEPRECATED in favour of new builds [docker-php](https://github.com/scottasmith/docker-php) on [Dockerhub](https://hub.docker.com/r/scottsmith/php)

[concourse.ci](https://concourse.ci/ "concourse.ci Homepage") for running PHP unit tests

## Simply a PHP image with a few more extensions installed ready for testing code

### Example

```
jobs:
- name: 'Test My App'
  plan:
  - get: my-app-resource
    trigger: true
    version: every
  - task: 'Test Module'
    file: my-app-resource/.task-test.yml

```

And the file `.task-test.yml` goes into your repo with content similar to:
```
platform: linux
image_resource:
  type: docker-image
  source:
    repository: scottsmith/concourse-php-resource
    tag: 7.1-cli
inputs:
- name: my-app-resource
  path: my-app
run:
  path: my-app/bin/run_tests.sh
```
