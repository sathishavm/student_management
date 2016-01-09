require 'spec_helper'

describe Submission do

  it { should belong_to(:student) }
  it { should belong_to(:assignment) }
end