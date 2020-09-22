class ApplicationController < ActionController::Base
  def hello
    render html: "What this is: Marathon training plans and advise for real runners. 
                  What this isn't: crybaby facebook shit."
  end
end
