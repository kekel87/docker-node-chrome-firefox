# <img src="https://www.docker.com/sites/default/files/Whale%20Logo332_5.png" width="40" height="30"/> Dockerfor Angular CI (Gitlab)

Capability to run full ci of angular application :
- install dependencies (yarn)
- run karma and e2e tests (Chromium)
- build prod app
- build docker image
- deploy image
- git

### Gitlab CI :
Use case :
  - gitlab-runner `--docker-image kekel87/angular-ci`
  - .gitlab-ci.yml `image: kekel87/angular-ci`
  - [services](http://doc.gitlab.com/ce/ci/yaml/README.html#image-and-services).

### Karma :

*ChromiumHeadless is available since karma-chrome-launcher@2.2.0 :*
```javascript
// karma.conf.js

browsers: ['ChromiumNoSandbox'],
customLaunchers: {
  ChromiumNoSandbox: {
    base: 'ChromiumHeadless',
    flags: ['--no-sandbox']
  }
},
```

### Protrator : 
```javascript
// protrator-ci.conf.js
  capabilities: [
    'browserName': 'chrome',
    'chromeOptions': {
      'args': ['no-sandbox', 'headless', 'disable-gpu']
    }
  }],
  chromeDriver: '/usr/bin/chromedriver',
```

Thanks :
- https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/