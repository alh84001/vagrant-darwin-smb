begin
  require 'vagrant'
rescue LoadError
  raise "The Vagrant Darwin SMB plugin must be run within Vagrant."
end

if Vagrant::VERSION < "1.5.0"
  raise "The Vagrant Darwin SMB plugin is only compatible with Vagrant 1.5.0+"
end

module VagrantDarwinSMB
  class Plugin < Vagrant.plugin('2')
    name 'DarwinSMB'

    description <<-DESC
    This plugin adds SMB share support in Darwin for Vagrant.
    DESC

    guest_capability("darwin", "mount_smb_shared_folder") do
      require_relative "cap/mount_smb_shared_folder"
      Cap::MountSMBSharedFolder
    end

    guest_capability("darwin", "choose_addressable_ip_addr") do
      require_relative "cap/choose_addressable_ip_addr"
      Cap::ChooseAddressableIpAddr
    end
  end
end
