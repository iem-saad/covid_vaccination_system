class Head::HeadController < ApplicationController
  authorize_resource class: false
end
