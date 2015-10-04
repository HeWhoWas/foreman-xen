module FogExtensions
  module Xenserver
    module VBD
      extend ActiveSupport::Concern

      include ActionView::Helpers::NumberHelper

      attr_accessor :sr_uuid, :physical_size

    end
  end
end
