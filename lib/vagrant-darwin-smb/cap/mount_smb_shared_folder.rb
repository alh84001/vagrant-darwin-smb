require "shellwords"

module VagrantDarwinSMB
  module Errors
    class DarwinMountFailed < Vagrant::Errors::VagrantError
      error_key(:darwin_mount_failed)
    end 
  end

  module Cap
    class MountSMBSharedFolder
      extend Vagrant::Util::Retryable
      def self.mount_smb_shared_folder(machine, name, guestpath, options)
        expanded_guest_path = machine.guest.capability(:shell_expand_guest_path, guestpath)
        # create the guest path if it doesn't exist
        machine.communicate.execute("mkdir -p #{expanded_guest_path}")

        smb_password = Shellwords.shellescape(options[:smb_password])
        mount_opts = options[:mount_options];
        mount_command = "mount -t smbfs " +
          (mount_opts ? "-o '#{mount_opts.join(",")}' " : "") +
          "'//#{options[:smb_username]}:#{smb_password}@#{options[:smb_host]}/#{name}' " +
          "#{expanded_guest_path}"
        retryable(on: Errors::DarwinMountFailed, tries: 10, sleep: 5) do 
          machine.communicate.sudo(
            mount_command,
            error_class: Errors::DarwinMountFailed)
        end
      end
    end
  end
end