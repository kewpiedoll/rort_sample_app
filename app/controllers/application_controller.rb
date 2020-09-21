class ApplicationController < ActionController::Base
  def hello
    render html: "hello Aki and O-chan!"
  end
end
