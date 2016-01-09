require 'spec_helper'

describe Assignment do

  it { should belong_to(:training_class) }

  describe "#valid?" do
    it { should validate_presence_of(:training_class_id) }
    it { should validate_presence_of(:title) }
  end
end