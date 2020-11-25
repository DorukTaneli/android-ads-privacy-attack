#!/usr/bin/env python3
import os

os.system('apktool d base.apk')
print('\nDecompiled base.apk\n')

with open('base\AndroidManifest.xml', 'r') as file:
    filedata = file.read()

filedata = filedata.replace('package="', 'package="amended.')

with open('base\AndroidManifest.xml', 'w') as file:
    file.write(filedata)

print('Amended for co-install\n')

os.system('apktool b base -o amended.apk')
print('\nBuilt amended.apk\n')

os.system('jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore amended.apk alias_name -storepass 123456')
print('\nSigned apk, ready for co-install\n')

os.system('adb install amended.apk')
print('Installed amended.apk')