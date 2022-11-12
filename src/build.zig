const std = @import("std");

/// Build a shared library as a valid erlang driver.
pub fn libraryAsDriver(lib: *std.build.LibExeObjStep) void {
    lib.linkLibC();
    lib.force_pic = true;
    lib.linker_allow_shlib_undefined = true;
    lib.install();
}
