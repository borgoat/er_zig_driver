const std = @import("std");

// TODO Configurable || auto discovery
const ERLANG_PATH = "/Users/borgoat/.asdf/installs/erlang/25.1.1/";

pub fn build(b: *std.build.Builder) void {

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary("er_zig_driver", "src/port_driver.zig", b.version(1, 0, 0));
    lib.setBuildMode(mode);
    lib.addSystemIncludePath(ERLANG_PATH ++ "usr/include");
    lib.addLibraryPath(ERLANG_PATH ++ "usr/lib");
    lib.linkLibC();
    lib.force_pic = true;
    lib.linker_allow_shlib_undefined = true;
    lib.install();

    const main_tests = b.addTest("src/port_driver.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
