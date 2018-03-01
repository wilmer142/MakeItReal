class PermissionDeniedError < StandardError
  attr_reader :action

  def initialize(message, action)
  	puts "error del hijo"
    # Call the parent's constructor to set the message
    super(message)

    # Store the action in an instance variable
    @action = action
  end
end

# Cuando alguien trate de borrar algo sin permiso podrías 
# hacer algo así:
raise PermissionDeniedError.new("Permission denegado a wilmer", :delete)