class ApplicationController < ActionController::Base
    def homepage
        render ({:template => "home/index"})
    end
end
