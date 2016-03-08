 class API::EventsController < ApplicationController

   skip_before_action :verify_authenticity_token
   before_filter :set_access_control_headers
 
   def create
    application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    if application.nil?
      binding.pry
      render json: { error: "missing valid registered application URL" }, status: :unprocessable_entity
    else
      @event = application.events.build( event_params )  
        if @event.save
          render json: @event, status: :created
        else
          render json: { error: "missing event name" }, status: :unprocessable_entity
        end
    end
  end

  def preflight
    head 200
  end


   def set_access_control_headers
 
     headers['Access-Control-Allow-Origin'] = '*'
 
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
 
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end
  
  private

  def event_params
    params.require(:event).permit(:name)
  end
end
 