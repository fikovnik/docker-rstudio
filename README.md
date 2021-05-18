# RStudio PRO

With additional dependencies and configuration (does not suspend sessions).

``sh
export RSP_LICENSE=XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX
```

```sh
docker run \
    --privileged \
    -it \
    --name rstudio-server \
    --rm \
    -p 8787:8787 \
    -v $PWD/etc/rstudio:/etc/rstudio \
    -e RSP_LICENSE=$RSP_LICENSE \
    -e RSP_TESTUSER=$(whoami) \
    -e RSP_TESTUSER_PASSWD='rstudio' \
    -e RSP_TESTUSER_UID=$(id -u) \
    -e RSP_LAUNCHER=false \
    fikovnik/rstudiopro:latest
```

