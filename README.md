# CV jekyll theme

Free theme for the creation of your CV. View demo [here](https://jekyll-cv.stavrospanakakis.com/).

## Features
- Lightweight
- Free & Open Source
- Mobile Responsive
- Dark Mode Support


## Preview
![Preview](./preview.png)

## Installation
- [Fork](https://github.com/stavrospanakakis/jekyll-cv/fork) the repository
- Create a ```gh-pages``` branch
- Go to Settings and select ```gh-pages``` as Github Pages source
- Replace dummy data at ```_data/data.yml``` and ```_config.yml```
- You're done!

Go to https://username.github.io/jekyll-cv/

# Docker compose actions

Lint YAML
```
docker-compose run --rm lint-yaml
```
Lint Javascript files
```
docker-compose run --rm lint-js
```
Lint SCSS files
```
docker-compose run --rm lint-sass
```
Lint Dockerfile
```
docker-compose run --rm lint-dockerfile
```
Save Docker image to tar
```
docker-compose run --rm docker-save-image
```
Scan Dockerfile for Security Issues
```
docker-compose run --rm lint-yaml
```
Scan Docker image for vulnerabilities
```
docker-compose build app # build image
docker-compose run --rm docker-save-image # save image to tar
docker-compose run --rm trivy-scan-image # scan image
rm ./artifacts/image.tar # remove tar file
```

## Contributing 
- Feel free to open issues and create pull requests for new features or skins

## License
- [MIT](./LICENSE)
