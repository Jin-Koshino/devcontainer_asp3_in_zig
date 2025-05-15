const func_a = @import("func_a.zig");

pub fn func_c(a: u8) u8 {
    const value = func_a.func_a(a);
    return value + 1;
}
