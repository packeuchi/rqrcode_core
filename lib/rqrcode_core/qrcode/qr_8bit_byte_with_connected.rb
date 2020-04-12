# frozen_string_literal: true

module RQRCodeCore
  class QR8bitByteWithConnected
    attr_reader :mode, :page_number, :last_page_number, :parity

    def initialize(data, page_number, last_page_number, parity)
      @mode = QRMODE[:mode_8bit_byte]
      @data = data
      @page_number = page_number
      @last_page_number = last_page_number
      @parity = parity
    end

    def get_length
      @data.bytesize
    end

    def write(buffer)
      buffer.byte_with_connected_encoding_start(get_length, @page_number, @last_page_number, @parity)
      @data.each_byte do |b|
        buffer.put(b, 8)
      end
    end
  end
end
