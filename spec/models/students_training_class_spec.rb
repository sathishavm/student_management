require 'spec_helper'

describe StudentsTrainingClass do

  it { should belong_to(:student) }
  it { should belong_to(:training_class) }
end