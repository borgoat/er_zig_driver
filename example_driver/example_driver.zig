const erl = @import("erl_driver").erl;

const ExampleData = struct { port: erl.ErlDrvPort };

fn driverStart(port: erl.ErlDrvPort, buff: [*c]u8) callconv(.C) erl.ErlDrvData {
    _ = buff;

    const data = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), erl.driver_alloc(@sizeOf(ExampleData))));
    data.port = port;
    return @ptrCast(erl.ErlDrvData, data);
}

fn driverStop(handle: erl.ErlDrvData) callconv(.C) void {
    erl.driver_free(handle);
}

fn driverOutput(handle: erl.ErlDrvData, buff: [*c]u8, bufflen: erl.ErlDrvSizeT) callconv(.C) void {
    const buf = buff[0..bufflen];

    const d = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), handle));
    const op = buf[0];
    const arg = buf[1];

    var res = if (op == 1)
        arg + 1
    else
        arg * 2;

    _ = erl.driver_output(d.port, @ptrCast([*c]u8, &res), 1);
}

var driver: [*c]erl.ErlDrvEntry = blk: {
    break :blk &struct {
        var driver_temp = erl.ErlDrvEntry{
            .init = null,
            .start = driverStart,
            .stop = driverStop,
            .output = driverOutput,
            .ready_input = null,
            .ready_output = null,
            .driver_name = "example_driver",
            .finish = null,
            .handle = null,
            .control = null,
            .timeout = null,
            .outputv = null,
            .ready_async = null,
            .flush = null,
            .call = null,
            .unused_event_callback = null,
            .extended_marker = erl.ERL_DRV_EXTENDED_MARKER,
            .major_version = erl.ERL_DRV_EXTENDED_MAJOR_VERSION,
            .minor_version = erl.ERL_DRV_EXTENDED_MINOR_VERSION,
            .driver_flags = 0,
            .handle2 = null,
            .process_exit = null,
            .stop_select = null,
            .emergency_close = null,
        };
    }.driver_temp;
};

export fn driver_init() callconv(.C) *erl.ErlDrvEntry {
    return driver;
}
