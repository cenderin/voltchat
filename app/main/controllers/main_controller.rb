# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    before_action :require_login, only: :index
    def index
      reset_message
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    def send_message
      store._messages << page._form && create_time

      reset_message
    end

    def reset_message
      page._form = Message.new
    end
    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    def create_time
      page._form._time_created = Time.new
    end
    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
