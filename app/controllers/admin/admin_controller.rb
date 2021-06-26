class Admin::AdminController < ApplicationController
  authorize_resource class: false
end
