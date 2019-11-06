# RackMid_MinBasic

Minimum Rack middleware implementing Basic Authorization.

## Usage

```
$ gem install rack
$ rackup
```

After launching the server, access `http://localhost:9292` via browser.

You can login with the following info.

```
user: HOGE
pass: FUGA
```

### If you want to login via cURL

Username and Password must be encoded by BASE64 without `\n`.

```
$ echo "HOGE:FUGA" | base64
SE9HRTpGVUdBCg==

$ curl http://localhost:9292 -H "Authorization: Basic SE9HRTpGVUdBCg=="
BASIC Auth required.

$ echo -n "HOGE:FUGA" | base64
SE9HRTpGVUdB

$ curl http://localhost:9292 -H "Authorization: Basic SE9HRTpGVUdB"
Hello, World
```
