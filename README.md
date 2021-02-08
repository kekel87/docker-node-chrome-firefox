# ![Docker](https://raw.githubusercontent.com/kekel87/readme-images/master/docker.png) Docker for node CI (Gitlab)

![gitlab](https://raw.githubusercontent.com/kekel87/readme-images/master/gitlab.png) ![node](https://raw.githubusercontent.com/kekel87/readme-images/master/node.png) ![npm](https://raw.githubusercontent.com/kekel87/readme-images/master/npm.png) ![yarn](https://raw.githubusercontent.com/kekel87/readme-images/master/yarn.png) ![karma](https://raw.githubusercontent.com/kekel87/readme-images/master/karma.png) ![protractor](https://raw.githubusercontent.com/kekel87/readme-images/master/protractor.png) ![phantomjs](https://raw.githubusercontent.com/kekel87/readme-images/master/phantomjs.png) ![chrome](https://raw.githubusercontent.com/kekel87/readme-images/master/chrome.png) ![firefox](https://raw.githubusercontent.com/kekel87/readme-images/master/firefox.png)

[![](https://images.microbadger.com/badges/version/kekel87/node-chrome-firefox.svg)](https://microbadger.com/images/kekel87/node-chrome-firefox "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/kekel87/node-chrome-firefox.svg)](https://microbadger.com/images/kekel87/node-chrome-firefox "Get your own image badge on microbadger.com")

Capability to run full CI of node application :

- install dependencies
- build
- run unit tests on chrome & firefox
- run e2e tests on chrome & firefox

### Gitlab CI :

### Karma Gilab CI example config :

```yml
# .gitlab-ci.yml
unit:
  image: kekel87/node-chrome-firefox
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
  },
  FirefoxHeadless: {
    base: 'Firefox',
    flags: ['-headless'],
  },
},
```

### Protrator Gilab CI example config :

```yml
# .gitlab-ci.yml
e2e:
  image: kekel87/node-chrome-firefox
  stage: test
  script:
    - yarn
    - yarn ng e2e --protractor-config e2e/protractor-headless.conf.js
```

```javascript
// protrator-headless.conf.js
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

How i test it locally :

```bash
# build
docker build -t kekel87/node-chrome-firefox .
# enter to docker image
docker run -it --rm --name test -v $MY_ANGULAR_APP$:/app kekel87/node-chrome-firefox sh
cd app
# install project
yarn
# run lint, unit tests and e2e tests
yarn ng lint --type-check
yarn ng test --browsers ChromeHeadless --watch=false
yarn ng test --browsers FirefoxHeadless --watch=false
yarn e2e --configuration headless
# test a prod build
yarn ng build --prod --progress=false
# serve project with angular-http-server to validate build
angular-http-server --path .\dist\
```
