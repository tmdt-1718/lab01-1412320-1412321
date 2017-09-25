Rails.application.config.generators do |g|
    g.test_framework :rspec,
    fixture: true,
    controller_specs: true,
    view_specs: false,
    routing_spec: false,
    helper_specs: false
    g.stylesheets = false
    g.javascripts = false
    g.helper = false
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
end