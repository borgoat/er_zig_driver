const std = @import("std");

/// Build a shared library as a valid erlang driver.
pub fn addErlangDriver(b: *std.build.Builder, name: []const u8, root_src: ?[]const u8) !*std.build.LibExeObjStep {
    const driver = b.addSharedLibrary(name, root_src, .unversioned);
    driver.linkLibC();
    driver.force_pic = true;
    driver.linker_allow_shlib_undefined = true;
    const driver_install = try b.allocator.create(ErlDriverInstallStep);
    driver_install.* = .{
        .builder = b,
        .step = std.build.Step.init(.custom, "install driver", b.allocator, ErlDriverInstallStep.make),
        .driver = driver,
        .name = name,
    };
    driver_install.step.dependOn(&driver.step);
    b.getInstallStep().dependOn(&driver_install.step);
    return driver;
}

/// It seems erl_ddll:load/2 always expects the file to end in .so - this is why we force the extension here.
/// > The Name specified is to correspond to the filename of the dynamically loadable object file
/// > residing in the directory specified as Path, but without the extension (that is, .so).
/// -- from https://www.erlang.org/doc/man/erl_ddll.html#load-2
const ErlDriverInstallStep = struct {
    builder: *std.build.Builder,
    step: std.build.Step,
    driver: *std.build.LibExeObjStep,
    name: []const u8,

    fn make(step: *std.build.Step) !void {
        const self = @fieldParentPtr(ErlDriverInstallStep, "step", step);
        const builder = self.builder;

        const dest_rel_path = builder.fmt("{s}.so", .{self.name});
        const dest_full_path = builder.getInstallPath(.lib, dest_rel_path);

        try builder.updateFile(self.driver.getOutputSource().getPath(builder), dest_full_path);
    }
};
