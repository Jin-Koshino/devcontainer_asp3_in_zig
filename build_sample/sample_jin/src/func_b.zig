const std = @import("std");

pub fn func_b(a: u8) u8 {
    const value = a + 1;
    std.debug.print("func_b: {}\n", .{value});
    return value;
}
