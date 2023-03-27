require 'rails_helper'

RSpec.describe "api_credentials/show", type: :view do
  let(:api_credential) { FactoryBot.create(:api_credential) }

  before(:each) do
    assign(:api_credential, api_credential)
  end

  it "renders attributes in <p>" do
    render
  end
end
