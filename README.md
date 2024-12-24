# WeekToDo | FOSS Minimalist Weekly Planner
---
![GitHub all releases](https://img.shields.io/github/downloads/zuntek/weektodoweb/total) 
[![vue3](https://img.shields.io/badge/vue-3.x-brightgreen.svg)](https://vuejs.org/)

WeekToDo is a free minimalist weekly planner app focused on privacy. Schedule your tasks and projects with to do lists and a calendar. Available for Windows, Mac, Linux or online.

![Logo](https://weektodo.me/weektodo-preview.webp)

## Features

- Cross platform
- Light/dark mode toggle
- Custom To-do Lists
- Drag and Drop
- Multi-language
- Sub-tasks
- Markdown Support
- Customizable user interface
- Local Storage
- Task Colors
- Task Time
- Recurring Tasks
- Notifications and reminders

## Roadmap

- Touch mode
- Mobile Version
- Sync across devices
- Workspaces
- Themes

## Sponsors

WeekToDo is an GPL-licensed open source project with its ongoing development made possible entirely by users support and sponsors. If you'd like to join them, please consider [ sponsoring WeekToDo's development](https://weektodo.me/sponsor-us/) or [make the donation](https://weektodo.me/support-us/) you can.

<p align="center">
  <h3 align="center">Diamond Sponsors</h3>
</p>

<p align="center">
  <a target="_blank" href="https://password.link">
  <img alt="Password.link - Securely share sensitive information with one-time links. Send and receive passwords and confidential documents." src="https://weektodo.me/img/sponsors/passwordlink/wide.webp" width="350">
  </a>
</p>

<p align="center">
  <h3 align="center">Silver Sponsors</h3>
</p>

<p align="center">
  <a target="_blank" href="https://www.snapclear.app/">
    <img alt="Snapclear - Remove image backgrounds with a single click for free." src="https://weektodo.me/img/sponsors/snapclear/wide.webp" width="150">
  </a>
  <a target="_blank" href="https://chrome.google.com/webstore/detail/easyfiller-automatic-form/oaphggcbnpminjffkjgldfepehcdjndp?hl=es&authuser=0">
    <img alt="Easyfiller - Fill your forms with a single click for free" src="https://weektodo.me/img/sponsors/easyfiller/wide.webp" width="150">
  </a>
</p>

  
## Installation

### Download installer 

[Windows / Linux / macOS](https://github.com/zuntek/weektodoweb/releases/latest
) 

### External Stores

#### Windows 

[Uptodown](https://weektodo.uptodown.com/windows)

#### macOS 

[Macupdate](https://www.macupdate.com/app/mac/63506/weektodo)

#### Linux 

Snapd can be installed from the command line:

```bash
sudo apt update
sudo apt install snapd
```
To install WeekToDo, simply use the following command:
```bash
sudo snap install weektodo
```    

## Build and Run From Source

If you want to understand how WeekToDo works or want to debug an issue, you'll want to get the source, build it, and run it locally.

### Installing Prerequisites

You'll need git, a recent version of [Node.JS](https://nodejs.org/en/) (currently v16.X is recommended), [Yarn](https://yarnpkg.com/) and [Electron](https://www.electronjs.org/).

```
git clone https://github.com/manuelernestog/weektodo
cd weektodo
yarn install
yarn run serve // to run web version
yarn run electron:serve // to run native version
```

### Docker
get into the `docker` folder, if you want run the development web version copy the file with prefix "devlop." and delete the prefix then run the command: `docker-compose up`, production version also.
use command `docker build -t weektodo:latest -f docker/Dockerfile .` to build the image.

## Contributing

You can support this project in several ways:

### Donate

https://weektodo.me/support-us

### Share

- [Facebook](https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fweektodo.me%2F)
- [Twitter](https://twitter.com/intent/tweet?url=https%3A%2F%2Fweektodo.me%2F&text=)
- [Linkedin](https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fweektodo.me%2F&title=)

### Rate the app

- [ProductHunt](https://www.producthunt.com/posts/weektodo)
- [AlternativeTo](https://alternativeto.net/software/weektodo/about/)
- [SassHub](https://www.saashub.com/weektodo-reviews/new)

### Translations

Currently the system is developed in multiple languages, you can send me a correction of any error or you can add your language if it's not available.

You can find the base file with all the used words in english [here](src/assets/languages/en.json/)

For add a new language Fork the repo and create a Pull Request creating a new file of the `translations/en.json` and name he file acording the [language code](https://gist.github.com/Josantonius/b455e315bc7f790d14b136d61d9ae469). 

If this is to dificult, you can donwload this [file](src/assets/languages/en.json/), translate it and send the file to the email contact@weektodo.me
 
## Contributing

Weektodo is open-source. Pull requests and contributions are welcome! There are three ways to contribute: grab a [bug report](https://github.com/manuelernestog/issues?q=is%3Aopen+is%3Aissue+label%3Abug) or [feature suggestion](https://github.com/manuelernestog/issues?q=is%3Aissue+is%3Aopen+label%3Afeature) that has been marked `accepted` and dig in.

Read [Contributing.md](/CONTRIBUTING.md) for more information.

## Author

- [Manuel Ernesto Garcia](https://manuelernestogr.bio.link/)

## Contributors

- Logo Rebranding by [hallgraph](https://twitter.com/hallgraph)
- [Translators](https://weektodo.me/about/)

<a href="https://github.com/manuelernestog/weektodo/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=manuelernestog/weektodo" />
</a>



Made with [contrib.rocks](https://contrib.rocks).

  
