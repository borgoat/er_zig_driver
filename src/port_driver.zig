const c = @cImport({
    @cInclude("erl_driver.h");
});

const std = @import("std");
const print = std.debug.print;

const ExampleData = struct { port: c.ErlDrvPort };

fn example_drv_start(port: c.ErlDrvPort, buff: [*c]u8) callconv(.C) c.ErlDrvData {
    _ = buff;
    
    print("here!", .{});

    const data = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), c.driver_alloc(@sizeOf(ExampleData))));
    data.port = port;
    return @ptrCast(c.ErlDrvData, data);
}

fn example_drv_stop(handle: c.ErlDrvData) callconv(.C) void {
    c.driver_free(handle);
}

fn example_drv_output(handle: c.ErlDrvData, buff: [*c]u8, bufflen: c.ErlDrvSizeT) callconv(.C) void {
    _ = bufflen;
    const d = @ptrCast(*ExampleData, @alignCast(@alignOf(*ExampleData), handle));
    const op = buff[0];
    const arg = buff[1];

    const res = if (op == 1) 
        arg + 1
     else
        arg * 2;

    _ = c.driver_output(d.port, res, 1);
}

export fn driver_init() callconv(.C) *c.ErlDrvEntry {
    print("driver init", .{});
    return &c.ErlDrvEntry{
        .init = null,
        .start = example_drv_start,
        .stop = example_drv_stop,
        .output = example_drv_output,
        .ready_input = null,
        .ready_output = null,
        .driver_name = @intToPtr([*c]u8, @ptrToInt("example_drv")), // ! Won't work with const *
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
}