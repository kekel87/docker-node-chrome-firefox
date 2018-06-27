# ![Docker](https://raw.githubusercontent.com/kekel87/docker-angular-ci/master/docker.png) Docker for Angular CI (Gitlab)

[![](https://images.microbadger.com/badges/image/kekel87/angular-ci.svg)](https://microbadger.com/images/kekel87/angular-ci 'Get your own image badge on microbadger.com')

Capability to run full ci of angular application :

- install dependencies (yarn or npm)
- run unit tests (PhantomJS/Chrome/Firefox)
- run e2e tests (PhantomJS/Chrome/Firefox)
- git stuff

### Gitlab CI :

Use case :

- gitlab-runner `--docker-image kekel87/angular-ci`
- .gitlab-ci.yml `image: kekel87/angular-ci`
- [services](http://doc.gitlab.com/ce/ci/yaml/README.html#image-and-services)

### Karma example config :

```yml
unit:
  image: kekel87/angular-ci
  stage: test
  script:
    - yarn
    - yarn ng test --browsers ChromeHeadless --code-coverage --watch=false --progress=false
  coverage: /Statements\s*:\s*([^%]+)/
```

```javascript
// karma.conf.js
customLaunchers: {
  ChromeHeadless: {
    base: 'Chrome',
    flags: [
      '--headless',
      '--disable-gpu',
      '--remote-debugging-port=9222',
      '--no-sandbox'
    ]
  }
},
```

### Protrator example config :

```yml
e2e:
  image: kekel87/angular-ci
  stage: test
  script:
    - yarn  
    - yarn ng e2e --protractor-config e2e/protractor-ci.conf.js
```

```javascript
// protrator-ci.conf.js
  multiCapabilities: [
    {
      browserName: 'firefox',
      'moz:firefoxOptions': {
        args: ['--headless'],
      },
    },
    {
      browserName: 'chrome',
      chromeOptions: {
        args: ['--no-sandbox', '--headless', '--disable-gpu'],
      },
    },
  ],
```
