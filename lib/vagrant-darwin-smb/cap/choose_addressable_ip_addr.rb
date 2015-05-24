module VagrantDarwinSMB
  module Cap
    class ChooseAddressableIpAddr
        def self.choose_addressable_ip_addr(machine, possible)
          machine.communicate.tap do |comm|
            possible.each do |ip|
              command = "ping -c1 -t1 #{ip}"
              if comm.test(command)
                return ip
              end
            end
          end
          nil
        end
    end
  end
end
