# DB2 Driver Install Build Script

This Dockerfile and accompanying `unixodbc` config file will build a custom
image to install the IBM DB2 ODBC CLI driver.

> [!IMPORTANT]
> You **must** bring your own copy of the `linux_x86_64` `clidriver` downloaded
> from IBM, and place it at the root of this project's directory, with the name
> `clidriver`. Otherwise, the build will fail. `clidriver` not included in this
> repository due to license restrictions on redistributing the driver.

## How to build

```bash
docker build -t <your_repository_name>:<your_tag_name> .
```
