class VandalUi::SchemasController < ::Api::V3::ApplicationController
  def show
    Rails.application.eager_load!
    Dir.glob("#{Rails.root}/app/resources/**/*.rb").each do |f|
      require f
    end
    render json: Graphiti::Schema.generate
  end
end
