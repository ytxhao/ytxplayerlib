Compile the order
1.  compile openssl (because librtmp depend on it. openssl is static lib)
2.  compile librtmp
3.  compile libfdk-aac
4.  compile faad2
5.  compile libx264
6.  compile libxml
7.  compile libpng
8.  compile fribidi-1.0.9
9.  compile freetype first(--with-harfbuzz=no)
10. compile fontconfig (fontconfig depend freetype )
11. compile harfbuzz
12. compile freetype second(--with-harfbuzz=yes freetype depend on libpng and harfbuzz)
13. compile libiconv
14. compile libass (libass depend on freetype and fribidi and libiconv)
15. compile liblame
16. compile ffmpeg


Depend on
1. libssl.so
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libssl.so]
2. libcrypto.so
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libcrypto.so]
3. librtmp
 0x0000000000000001 (NEEDED)             Shared library: [libssl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [librtmp.so]
4. libfdk-aac.so
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libfdk-aac.so]
5. libfaad
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libfaad.so]]
6. libx264
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libx264.so]
7. libxml2
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libxml2.so]
8. libpng16
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libpng16.so]
9. libfribidi
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libfribidi.so]
10. libfreetype
 0x0000000000000001 (NEEDED)             Shared library: [libharfbuzz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpng16.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libfreetype.so]
11. libfontconfig
 0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpng16.so]
 0x0000000000000001 (NEEDED)             Shared library: [libxml2.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libfontconfig.so]
12. libharfbuzz
 0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpng16.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libharfbuzz.so]
13. libiconv
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libiconv.so]
14. libass
 0x0000000000000001 (NEEDED)             Shared library: [libiconv.so]
 0x0000000000000001 (NEEDED)             Shared library: [libfribidi.so]
 0x0000000000000001 (NEEDED)             Shared library: [libfontconfig.so]
 0x0000000000000001 (NEEDED)             Shared library: [libxml2.so]
 0x0000000000000001 (NEEDED)             Shared library: [libharfbuzz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libfreetype.so]
 0x0000000000000001 (NEEDED)             Shared library: [libpng16.so]
 0x0000000000000001 (NEEDED)             Shared library: [libz.so]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libass.so]
15. libmp3lame
 0x0000000000000001 (NEEDED)             Shared library: [libm.so]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so]
 0x000000000000000e (SONAME)             Library soname: [libmp3lame.so]