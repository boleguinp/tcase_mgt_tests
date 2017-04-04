Before do |scenario|
  @app ||= TCasemgt::PageObjects::Application.new
  @api ||= ApiObjects::Application.new
end
