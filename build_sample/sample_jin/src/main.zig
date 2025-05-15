const std = @import("std");
const func_a = @import("func_a.zig");
const func_b = @import("func_b.zig");
const func_c = @import("func_c.zig");
pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});
    try stdout.print("func_a(1): {}\n", .{func_a.func_a(1)});
    try stdout.print("func_b(1): {}\n", .{func_b.func_b(1)});
    try stdout.print("func_c(1): {}\n", .{func_c.func_c(1)});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
