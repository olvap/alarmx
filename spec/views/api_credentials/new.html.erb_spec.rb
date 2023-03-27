require 'rails_helper'

RSpec.describe "api_credentials/new", type: :view do
  before(:each) do
    assign(:api_credential, ApiCredential.new())
  end

  it "renders new api_credential form" do
    render

    assert_select "form[action=?][method=?]", api_credentials_path, "post" do
    end
  end
end
