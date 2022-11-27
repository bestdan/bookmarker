require 'rails_helper'

RSpec.describe BaseSerializer, type: :serializer do
  let(:resource) { FactoryBot.create(:user) }
  let(:serialized_resource) { described_class.new(resource).as_json }

  subject { serialized_resource[:base] }

  it "has an id that matches with the resource id" do
    expect(subject[:id]).to eq(resource.id)
  end
end
