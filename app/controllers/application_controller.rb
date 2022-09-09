class ApplicationController < ActionController::Base

# Disable Authenticity Token
# For static page Rails applications, a check is made to assure that the data submitted to the controller originates from the same website. In most single page applications that consume an API we don't utilize this feature and need to disable it. Add the following code:
# app/controllers/application_controller.rb

skip_before_action :verify_authenticity_token

end
