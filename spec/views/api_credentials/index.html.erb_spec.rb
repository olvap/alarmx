require 'rails_helper'

RSpec.describe "api_credentials/index", type: :view do
  let(:api_credential) { FactoryBot.create(:api_credential) }

  before(:each) do
    assign(:api_credentials, [
      api_credential
    ])
  end

  it "renders a list of api_credentials" do
    render
    'div>p'
  end
end
