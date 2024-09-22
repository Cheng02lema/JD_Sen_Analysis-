import hashlib

password = b'my_password'
salt = b'some_salt'
n = 2 ** 14
r = 8
p = 1
dklen = 64

key = hashlib.scrypt(password, salt=salt, n=n, r=r, p=p, dklen=dklen)
print(key.hex())
