require 'spec_helper'

describe TrainingClass do

  describe "#valid?" do
    it { should validate_presence_of(:name) }
  end
end