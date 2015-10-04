module FogExtensions
  module Xenserver
    module Server
      extend ActiveSupport::Concern

      include ActionView::Helpers::NumberHelper

      attr_accessor :start
	    attr_accessor :memory_min, :memory_max, :custom_template_name, :builtin_template_name, :hypervisor_host

      def to_s
        name
      end

      def nics_attributes=(attrs); end

      def volumes_attributes=(attrs); end

      def memory
        memory_static_max.to_i
      end

      def reset
        reboot
      end

      def ready?
        running?
      end

      def mac
        vifs.first.mac
      end

      def state
        power_state
      end

      def vm_description
        _("%{cpus} CPUs and %{memory} memory") % {:cpus => vcpus_max, :memory => number_to_human_size(memory_max.to_i)}
      end

      def interfaces
        if not __vifs.nil?
          vifs
        end
      end

      def volumes
        if not __vbds.nil?
          vbds
        end
      end

      def select_nic(fog_nics, nic)
        return fog_nics[0]
      end

    end
  end
end
