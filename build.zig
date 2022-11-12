const std = @import("std");
const erbuild = @import("src/build.zig");

const erlDriverPkg = std.build.Pkg{
    .name = "erl_driver",
    .source = std.build.FileSource.relative("src/main.zig"),
};

pub fn build(b: *std.build.Builder) void {

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const example_driver = b.addSharedLibrary("example_driver", "example_driver/example_driver.zig", b.version(1, 0, 0));
    example_driver.addPackage(erlDriverPkg);
    example_driver.setBuildMode(mode);
    erbuild.libraryAsDriver(example_driver);

    const main_tests = b.addTest("src/port_driver.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
