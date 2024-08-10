# Home Assistant Add-on: Gilda-local add-on

## How to use

This add-on provides `gilda_local` optimizer as a service.

When started, the optimize service will be available in the `GILDALOCAL_ADDR` (5024).

You can try it using the command:

```console
$ curl -s -X POST -H "Content-Type: application/json" -d@demand_grid.json  http://homeassistant:5012/optimize
```

where `cases/demand_grid.json` is the input file that contains the system description.
