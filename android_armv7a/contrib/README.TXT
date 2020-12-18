Compile the order
1.  compile openssl (because librtmp depend on it. openssl is static lib)
2.  compile librtmp
3.  compile faac
4.  compile faad2
5.  compile libx264
6.  compile libxml
7.  compile harfbuzz
8.  compile fribidi-1.0.9
9.  compile harfbuzz
10. compile libpng
11. compile freetype first(--with-harfbuzz=no)
12. compile harfbuzz
13. compile freetype first(--with-harfbuzz=yes freetype depend on libpng and harfbuzz)
14. compile fontconfig (fontconfig depend freetype )
15. compile libass (libass depend on freetype and fribidi and libiconv)
16. compile ffmpeg


Depend on
1. librtmp
 0x00000001 (NEEDED)                     Shared library: [libz.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [librtmp.so]
2. libfaac
 0x00000001 (NEEDED)                     Shared library: [liblog.so]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so]
 0x00000001 (NEEDED)                     Shared library: [libm.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [libfaac.so]
3. libfaad
 0x00000001 (NEEDED)                     Shared library: [liblog.so]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so]
 0x00000001 (NEEDED)                     Shared library: [libm.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [libfaad.so]
4. libx264
 0x00000001 (NEEDED)                     Shared library: [libm.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x0000000e (SONAME)                     Library soname: [libx264.so]
5. libmp4v2
 0x00000001 (NEEDED)                     Shared library: [liblog.so]
 0x00000001 (NEEDED)                     Shared library: [libgnustl_shared.so]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so]
 0x00000001 (NEEDED)                     Shared library: [libm.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [libmp4v2.so]

6. libfreetype
 0x00000001 (NEEDED)                     Shared library: [libfreetype.so]
 0x00000001 (NEEDED)                     Shared library: [libz.so]
 0x00000001 (NEEDED)                     Shared library: [libpng.so]
 0x00000001 (NEEDED)                     Shared library: [libharfbuzz.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [libfreetype.so]

7. libfribidi

8. libass
 0x00000001 (NEEDED)                     Shared library: [libm.so]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so]
 0x00000001 (NEEDED)                     Shared library: [libfribidi.so]
 0x00000001 (NEEDED)                     Shared library: [libfreetype.so]
 0x00000001 (NEEDED)                     Shared library: [libz.so]
 0x00000001 (NEEDED)                     Shared library: [libpng.so]
 0x00000001 (NEEDED)                     Shared library: [libharfbuzz.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so]
 0x00000001 (NEEDED)                     Shared library: [libdl.so]
 0x0000000e (SONAME)                     Library soname: [libass.so]
