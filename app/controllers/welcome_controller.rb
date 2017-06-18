class WelcomeController < ApplicationController

  def index
    @qr = RQRCode::QRCode.new(root_url.to_s, :size => 6, :level => :h )
  end
end
