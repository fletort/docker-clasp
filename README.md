# docker-clasp
clasp command Line Tool docker image (google app script client)

## What is clasp ?

clasp is an open-source tool, separate from the Google Apps Script platform, that lets you 
develop and manage Apps Script projects from your terminal rather than the Online Google
Apps Script editor.

See: https://developers.google.com/apps-script/guides/clasp

## How to use this image

### Fist Login ?

For you first login (no credential stored yet in a local .clasprc.json), you must do the login procedure.
Do not forget that the file must exist on your host to can be mounted in the docker container.
```console
$ touch ~/.clasprc.json
$ docker run -it --rm -v ~/.clasprc.json:/root/.clasprc.json fletort/clasp login --no-localhost
```
The we will need to copy/paste the link on your browzer that copy/paster back the given code.

You credentials should now be stored on your local host file `.clasprc.json.`

### Docker Way

You can run the Docker image from a directory dedicated to your Google Apps Script project:

```console
$ docker run -it --rm --name my-app-script -v "$PWD":/work/app -v ~/.clasprc.json:/root/.clasprc.json fletort/clasp help
```

Then you can put any of the clasp operation instead of the help operation on the upper example 
(for example list to list all the project).

### Docker Compose Way

If you prefer Docker Compose (to not put all mouting staf in each request), the following docker-compose.yml file 
will be needed in your project directory:

```yml
version: "2"
services:
  clasp:
    image: "fletort/clasp"
    volumes:
      - ($PWD):/work/app
      - ~/.clasprc.json:/root/.clasprc.json
```

You can then run using Docker Compose:
```console
$ docker-compose --rm run clasp help
```

### Bash Script (Shortcut) Waa

At least you can also make a "shortcust" (shell script) to make the first method (docker way) easily.
The following script (that can be put in a directory presents in your PATH, as /usr/local/bin) will do the job:
```bash
#!/bin/bash
docker run -it --rm -v "$PWD":/work/app -v ~/.clasprc.json:/root/.clasprc.json fletort/clasp $@
```
With a such script named clasp, we have only to do as the official version:
```console
$ clasp help
```







