module FogExtensions
  module Xenserver
    module VDI
      extend ActiveSupport::Concern

      def size_gb
        (virtual_size.to_i / 1073741824) * 1.0
      end

      def size_gb=(val)
        virtual_size = (val.to_i) * 1073741824
      end

    end
  end
end