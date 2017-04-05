Before do |scenario|
  # POM Application class instantiation
  @app ||= TCasemgt::PageObjects::Application.new
    # API Application class instantiation
  @api ||= ApiObjects::Application.new
  # ProjectApi class instantiation
  @project_api = @api.project
end
After do |scenario|
  # teardown
  unless (@project_id.nil?)
    @project_api.delete_project(@project_id)
    # Validate Response success, status, code
    @api.validate_response(@response)
  end
end
