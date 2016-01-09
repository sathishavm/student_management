require 'spec_helper'

describe Student do

  describe "#valid?" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end