# DB2 Driver Install Build Script

This Dockerfile and accompanying `odbcinst.ini` config file will build a custom
image to install the IBM DB2 ODBC CLI driver.

If you need a copy of the driver binaries, download them from [IBM's docsite here](https://www.ibm.com/support/pages/db2-odbc-cli-driver-download-and-installation-information).
Do note that you'll be required to create an account before proceeding.

> [!IMPORTANT]
> You **must** bring your own copy of the `linux_x86_64` `clidriver` downloaded
> from IBM and place it at the root of this project's directory with the name
> `clidriver`. Otherwise, the build will fail. `clidriver` not included in this
> repository due to license restrictions on redistributing the driver.

## How to build

```bash
git clone https://github.com/shovelfather/odbc_custom_image.git
cd odbc_custom_image
# make sure you've moved the driver files here under the `clidriver` directory
# before building.
docker build .
```

> [!TIP]
> Specify `--build-arg tag=<desired_decisions_version>` if you want to base the
> build on a version other than latest -- the above will default to latest if no
> `tag` is specified.
