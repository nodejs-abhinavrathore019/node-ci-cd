# Different ways to avoid blocking event-loop

commonjs + ts

# Compatible Versions:

### Node

- v19.7.0

### Typescript

- 5.2.2

# 1-github

Showcases implementation of github actions in different ways.
Github actions are kept in .github folder.

There are two workflows **verify** and **publish**

- **verify:**
  - gets triggered when a new commit is made.
  - checkout the project.
  - lints check and fix the project.
  - tests the project by running test cases.
  - builds the project.
- **publish:**
  - manually triggered when a release tag is to be created.
  - uses package **semantic-release** to analyse the commits and makes a new release tag.

### Install

```bash
npm run install-1
```

### run in dev mode

```bash
npm run dev-1
```

## 1.1 without code splitting

- Implementation in **gh-workflows-without-code-splitting**
- Copy files from this folder to .github
- Basic implementation of Github actions.

## 1.2 code splitting using workflows

- Implementation in **gh-workflows-with-code-splitting-using-workflow**
- Copy files from this folder to .github
- Shows how code can be reused by splitting it using workflows.

## 1.3 code splitting using composite actions

- Implementation in **gh-workflows-with-code-splitting-using-composite-actions**
- Copy files from this folder to .github
- Shows how code can be reused by splitting it using composite actions.

## 1.4 using artifacts

- Implementation in **gh-workflows-with-artifacts**
- Copy files from this folder to .github
- Checkout the project and creates a zipped artifact, thereafter every job uses that zipped artifact instead of checking out project every-time.
- This is not an ideal example for artifact usage because checking out is rather fast and easy than going this way, but this implementation explains how a artifact can be used to share data between workflows.
- Ideal usage of artifacts is when we have to create a binary and many workflows needs that binary. We can create binary once and save it as an artifact.

## 1.5 using cache

- Implementation in **gh-workflows-with-cache**
- Copy files from this folder to .github
- Checkout the project and creates a cache for it, thereafter every job restores this cache instead of checking out project every-time.

## 1.6 using docker container

- Implementation in **gh-workflows-with-docker-container**
- Copy files from this folder to .github
- Builds and Publish docker image.

# 2-circle-ci

Showcases implementation of circle-ci workflows in different ways.
Circle CI workflows are kept in .circleci folder.

There are two workflows **verify** and **publish**

- **verify:**
  - gets triggered when a new commit is made.
  - checkout the project.
  - lints check and fix the project.
  - tests the project by running test cases.
  - builds the project.
- **publish:**
  - manually triggered when a release tag is to be created.
  - uses package **semantic-release** to analyse the commits and makes a new release tag.

### Install

```bash
npm run install-2
```

### run in dev mode

```bash
npm run dev-2
```

## 2.1 without code splitting

- Implementation in **circleci-without-code-splitting**
- Copy files from this folder to .circleci
- Basic implementation of circleci.
- This config creates one workflow on its own and search for job name _build_.

## 2.2 code splitting using workflows (cimg)

- Implementation in **circleci-code-splitting-with-workflows(convenience-image)**
- Copy files from this folder to .circleci
- Convenience-image are docker images created by CircleCI.
- We import node docker image for node environment.

```
docker:
      - image: cimg/node:<<parameters.node-version>>

```

## 2.3 code splitting using workflows (orbs)

- Implementation in **circleci-code-splitting-with-workflows(orbs)**
- Copy files from this folder to .circleci
- Orbs are reusable configurations for jobs.
- We import orbs to our config and then use specific job configs from it based on our requirement.

```
## importing orb for node

orbs:
  node: circleci/node@5.1.0

## using install config from orb node with node-version as parameter.

node/install:
          node-version: <<parameters.node-version>>
```

## 2.4 using workspace

- Implementation in **circleci-code-with-workspace**
- Copy files from this folder to .circleci
- Checkout the project and creates a workspace, thereafter every job in that workflow can use that workspace.

## 2.4 using artifacts

- Implementation in **circleci-code-with-artifact**
- Copy files from this folder to .circleci
- Checkout the project and creates a zipped artifact.
- Ideal usage of artifacts is when we have to create a binary at the end of workflow.

## 2.5 using cache

- Implementation in **circleci-code-with-cache**
- Copy files from this folder to .circleci
- Checkout the project and creates a cache for it, thereafter every job restores this cache instead of checking out project every-time.

## 2.6 using docker container

- Implementation in **circleci-code-with-docker-container**
- Copy files from this folder to .circleci
- Builds and Publish docker image.

# 3-jenkins

Not Implemented
