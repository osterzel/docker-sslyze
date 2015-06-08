# zeitgeist/docker-sslyze

[sslyze](https://github.com/nabla-c0d3/sslyze) in a Docker container.

## Requirements

* [Docker](https://www.docker.com/) 1.5+ (previous versions may work fine, but I haven't tried)

## Installation

Get the [trusted build on the docker hub](https://registry.hub.docker.com/u/zeitgeist/docker-sslyze/):

```bash
$ docker pull zeitgeist/docker-sslyze
```

or download and compile the source yourself from Github:

```bash
$ git clone https://github.com/alexzeitgeist/docker-sslyze.git
$ cd docker-sslyze
$ docker build -t zeitgeist/docker-sslyze .
```

## Usage

[sslyze](https://github.com/nabla-c0d3/sslyze) is a Python tool that can analyze the SSL configuration of a server by connecting to it. It is designed to be fast and comprehensive, and should help organizations and testers identify misconfigurations affecting their SSL servers.

Example usage:

```bash
$ docker run --rm zeitgeist/docker-sslyze --regular www.zeitgeist.se:443
```
