# Home Assistant Add-on: Gilda-opts add-on

## How to use

This add-on provides the `gilda_opts` optimizer as a web service.

When started, the optimize service will be available in the `GILDAOPTS_ADDR` (5012).

You can try it using the command:

```console
$ curl -s -X POST -H "Content-Type: application/json" -d@demand_grid.json  http://homeassistant:5012/optimize
```

where `cases/demand_grid.json` is the input file that contains the system description.



![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
