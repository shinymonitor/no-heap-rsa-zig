SINGLE-FILE LIBRARY FOR HEAP-LESS IMPLEMENTATION OF RSA ENCRYPTION AND SIGNING IN ZIG WITH OAEP PADDING USING ONLY ONE DEPENDENCY FROM STANDARD LIBRARY FOR HASHING FUNCTION

CHANGE COMPILE TIME VARIABLES IN rsa.zig TO USE DIFFERENT MODULUS SIZES

FUNCTIONS:
5 public functions from rsa.zig
- RSA_key_gen()
- RSA_sign(MESSAGE, signer_private_key, signer_public_key)
- RSA_verify(Signature, MESSAGE, signer_public_key)
- RSA_encrypt(MESSAGE, receiver_public_key)
- RSA_decrypt(ENCRYPTED_MESSAGE , receiver_public_key, reciever_private_key)

TESTING:
Run test.zig
