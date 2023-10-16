class ApplicationController < ActionController::Base
   include SessionsHelper

   def render_flash
      render turbo_stream: turbo_stream.update("flash",partial: "layouts/shared/flash")
   end 

end
