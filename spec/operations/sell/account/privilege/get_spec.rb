RSpec.describe EbayAPI, ".sell.account.privilege.get" do
  let(:url)           { "https://api.ebay.com/sell/account/v1/privilege/" }
  let(:client)        { described_class.new(settings) }
  let(:scope)         { client.sell.account(version: version).privilege }
  let(:settings)      { yaml_fixture_file(settings_file) }
  let(:version)       { "1.2.0" }
  let(:settings_file) { "settings.valid.yml" }

  before  { stub_request(:get, url).to_return(response) }
  subject { scope.get }

  context "success" do
    let(:response) do
      open_fixture_file "sell/account/privilege/get/success"
    end

    it "returns just parsed JSON with data about selling limits" do
      expect(subject).to \
        eq(
          "sellingLimit" => {
              "amount"   => { "value" => "500", "currency" => "USD" },
              "quantity" => 10
          },
          "sellerRegistrationCompleted" => true
        )
    end
  end
end
