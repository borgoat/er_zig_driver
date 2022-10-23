const c = @cImport({
    @cInclude("erl_driver.h");
});

const ExampleData = struct { port: c.ErlDrvPort };

fn exampleDrvStart(port: c.ErlDrvPort, buff: [*c]u8) callconv(.C) c.ErlDrvData {
    _ = buff;

    const data = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), c.driver_alloc(@sizeOf(ExampleData))));
    data.port = port;
    return @ptrCast(c.ErlDrvData, data);
}

fn exampleDrvStop(handle: c.ErlDrvData) callconv(.C) void {
    c.driver_free(handle);
}

fn exampleDrvOutput(handle: c.ErlDrvData, buff: [*c]u8, bufflen: c.ErlDrvSizeT) callconv(.C) void {
    _ = bufflen;
    const d = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), handle));
    const op = buff[0];
    const arg = buff[1];

    var res = if (op == 1)
        arg + 1
    else
        arg * 2;

    _ = c.driver_output(d.port, @ptrCast([*c]u8, &res), 1);
}

var driver: [*c]c.ErlDrvEntry = blk: {
    break :blk &struct {
        var string_temp = "example_drv".*;

        var driver_temp = c.ErlDrvEntry{
            .init = null,
            .start = exampleDrvStart,
            .stop = exampleDrvStop,
            .output = exampleDrvOutput,
            .ready_input = null,
            .ready_output = null,
            .driver_name = &string_temp,
            .finish = null,
            .handle = null,
            .control = null,
            .timeout = null,
            .outputv = null,
            .ready_async = null,
            .flush = null,
            .call = null,
            .unused_event_callback = null,
            .extended_marker = -0x1111113, // TODO c.ERL_DRV_EXTENDED_MARKER overflows
            .major_version = c.ERL_DRV_EXTENDED_MAJOR_VERSION,
            .minor_version = c.ERL_DRV_EXTENDED_MINOR_VERSION,
            .driver_flags = 0,
            .handle2 = null,
            .process_exit = null,
            .stop_select = null,
            .emergency_close = null,
        };
    }.driver_temp;
};

export fn driver_init() callconv(.C) *const c.ErlDrvEntry {
    return driver;
}
