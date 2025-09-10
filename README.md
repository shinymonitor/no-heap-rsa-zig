# No Heap RSA Zig
A performant single-file, heap-less implementation of RSA encryption and signatures in Zig with OAEP+ padding and PEM key storage.

**Change compile time variables in rsa.zig to use different modulus sizes**

## Features
- Zero heap allocation: Uses only stack buffers and compile-time constants
- Montgomery multiplication for efficient modular exponentiation
- PEM format key storage and loading
- RSA encryption/decryption with OAEP+ padding
- Digital signatures with SHA-256 hashing
- Miller-Rabin primality testing for secure key generation
- Configurable modulus size via compile-time constants

## API Reference:
### Key Management

    pub fn gen_keys() Keys
    pub fn save_private_key(keys: Keys, filename: []const u8) !void
    pub fn save_public_key(keys: Keys, filename: []const u8) !void
    pub fn load_private_key(filename: []const u8) !Keys
    pub fn load_public_key(filename: []const u8) !Keys

### Encryption/Decryption

    pub fn encrypt(message: []const u8, public_key: PublicKey) !BitsType
    pub fn decrypt(blob: BitsType, keys: Keys) ![MAX_MESSAGE_LEN]u8


### Signatures

    pub fn sign(message: []const u8, keys: Keys) BitsType
    pub fn verify(message: []const u8, signature: BitsType, public_key: PublicKey) bool

## Usage Example

    const std = @import("std");
    const rsa = @import("rsa.zig");

    pub fn main() !void {
        const keys = rsa.gen_keys();
        
        try rsa.save_private_key(keys, "private.pem");
        try rsa.save_public_key(keys, "public.pem");
        
        const message = "Hello, RSA!";
        const ciphertext = try rsa.encrypt(message, keys.public_key);
        
        const decrypted = try rsa.decrypt(ciphertext, keys);
        
        const signature = rsa.sign(message, keys);
        
        const is_valid = rsa.verify(message, signature, keys.public_key);
        
        std.debug.print("Message: {s}\n", .{message});
        std.debug.print("Decrypted: {s}\n", .{decrypted[0..message.len]});
        std.debug.print("Signature valid: {}\n", .{is_valid});
    }

## Testing:
Run the test script:

    zig run test.zig


## Warning
**This implementation has not been professionally auditted. Use at your own risk**