class Admin::VendorsController < Admin::BaseController
  resource_controller

  create.success.wants.html { redirect_to collection_path }
  update.success.wants.html { redirect_to collection_path }

  new_action.response do |wants|
    wants.html {render :action => :new, :layout => !request.xhr?}
  end 
end
