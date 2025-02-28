const std = @import("std");

// Static Library
// pub fn build(b: *std.Build) void {
//     const target = b.standardTargetOptions(.{});
//     const optimize = b.standardOptimizeOption(.{});

//     const libfizzbuzz = b.addStaticLibrary(.{
//         .name = "fizzbuzz",
//         .root_source_file = b.path("fizzbuzz.zig"),
//         .target = target,
//         .optimize = optimize,
//     });

//     const exe = b.addExecutable(.{
//         .name = "demo",
//         .root_source_file = b.path("demo.zig"),
//         .target = target,
//         .optimize = optimize,
//     });

//     exe.linkLibrary(libfizzbuzz);

//     b.installArtifact(libfizzbuzz);

//     if (b.option(bool, "enable-demo", "install the demo too") orelse false) {
//         b.installArtifact(exe);
//     }
// }

// Dynamic Library
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libfizzbuzz = b.addSharedLibrary(.{
        .name = "fizzbuzz",
        .root_source_file = b.path("fizzbuzz.zig"),
        .target = target,
        .optimize = optimize,
        .version = .{ .major = 1, .minor = 2, .patch = 3 },
    });
    b.installArtifact(libfizzbuzz);
}