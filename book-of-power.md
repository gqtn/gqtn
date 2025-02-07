# My Book

Under building...

---
### Indice

1. [cURL](#cURL)


---

### cURL
- Login usign curl on FTP or SFTP:
```
curl  -P - --insecure "ftp://82.45.34.23:21/" --user "testuser:testpassword"

curl  -k "sftp://83.46.38.23:22/" --user "testuser:testpassword"
```

- Upload using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -T "C:\test\testfile.xml" --ftp-create-dirs
```

- Download using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/testfile.xml" --user "testuser:testpassword" -o "C:\test\testfile.xml" --ftp-create-dirs
```

- Rename using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/" --user "testuser:testpassword" -Q "-RNFR /CurlPutTest/testfile.xml"  -Q "-RNTO /CurlPutTest/testfile.xml.tmp"   --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/" --user "testuser:testpassword" -Q "-RENAME ‘/CurlPutTest/testfile.xml’  ‘/CurlPutTest/testfile.xml.tmp’"   --ftp-create-dirs
```

- Delete using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/testfile.xml" --user "testuser:testpassword" -Q "–DELE  /CurlPutTest/testfile.xml" --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/ " --user "testuser:testpassword" -Q "–RM /CurlPutTest/testfile.xml" --ftp-create-dirs
```

- Make directory using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-MKD /CurlPutTest/test"  --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–MKDIR /CurlPutTest/Test" --ftp-create-dirs
```

- Remove directory using curl on FTP or SFTP:
```
curl -p - --insecure  "ftp://82.45.34.23:21/CurlPutTest/test" --user "testuser:testpassword" -Q "-RMD /CurlPutTest/test"  --ftp-create-dirs

curl  -k "sftp://83.46.38.23:22/CurlPutTest/test " --user "testuser:testpassword" -Q "–RMDIR /CurlPutTest/Test" --ftp-create-dirs
```

---


