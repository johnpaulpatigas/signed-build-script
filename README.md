# signed-build-script
Script for creating a signing build environment

## Disclaimer
This script only works for password-less keys (DO NOT SET A PASSWORD) *This is due to building inline, other steps are necessary for a password*

## How to run
1. Download the script in your root build directory and run it

`wget https://raw.githubusercontent.com/johnpaulpatigas/signed-build-script/main/create-signed-env.sh`

`chmod +x create-signed-env.sh`

`./create-signed-env.sh`

2. Enter info for certificate subject line and confirm

3. Hit enter to set no password for each certificate. **Cannot set a password to build inline with this method!**

Build as usual!
