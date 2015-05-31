### Note
This plugin has been merged into vagrant and should be available in yet unreleased v1.7.3. Once this version of vagrant is released, this repo will go the way of the dodo.


# vagrant-darwin-smb plugin
This plugin provides capability to add SMB synced folders to Darwin (OS X) guests. It is a simple wrapper/proxy to [mount_smbfs](http://linux.die.net/man/8/smbmount) command.

## Installation
    $ vagrant plugin install vagrant-darwin-smb

## Usage
Define SMB synced folders in your Vagrantfile as usual. It should just work. If you need custom options you can pass an array of strings as `mount_options` parameter.

## Caveats
Currently, there is no ability to pass -f, -d or -N parameters to mount_smbfs. 

## Acknowledgments
This plugin steals shamelessly from core Vagrant Darwin NFS and Linux SMB capabilities. All credit goes to Vagrant guys.
