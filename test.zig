const std = @import("std");
const rsa = @import("rsa.zig");
pub fn main() !void {
    std.debug.print("GENERATING KEYS.....\n", .{});
    const alice_keys = rsa.RSA_key_gen();
    std.debug.print("ALICE'S KEYS:\nPublic Key: {any}\nPrivate Key: {any}\n", .{ alice_keys.public_key, alice_keys.private_key });
    std.debug.print("GENERATING KEYS.....\n", .{});
    const bob_keys = rsa.RSA_key_gen();
    std.debug.print("BOB'S KEYS:\nPublic Key: {any}\nPrivate Key: {any}\n", .{ bob_keys.public_key, bob_keys.private_key });
    const alice_signature = rsa.RSA_sign("SIGNED DATA", alice_keys.private_key, alice_keys.public_key);
    std.debug.print("ALICE'S SIGNATURE FOR \"SIGNED DATA\": {any}\n", .{alice_signature});
    const bob_verify = rsa.RSA_verify(alice_signature, "SIGNED DATA", alice_keys.public_key);
    std.debug.print("BOB VERIFY SIGNATURE: {any}\n", .{bob_verify});
    const alice_to_bob_encrypted = rsa.RSA_encrypt("HELLO BOB", bob_keys.public_key);
    std.debug.print("ALICE SENDS ENCRYPTED MESSAGE \"HELLO BOB\" TO BOB: {any}\n", .{alice_to_bob_encrypted});
    const alice_to_bob_decrypted = rsa.RSA_decrypt(try alice_to_bob_encrypted, bob_keys.public_key, bob_keys.private_key);
    std.debug.print("BOB DECRYPT MESSAGE: {any}\n", .{alice_to_bob_decrypted});
}
