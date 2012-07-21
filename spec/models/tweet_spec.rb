require 'spec_helper'

describe Tweet do
  before { @tweet = create(:tweet) }

  it { should ensure_length_of(:content).is_at_least(3) }

  it { should allow_mass_assignment_of(:content) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should have_readonly_attribute(:created_at) }

  it { should validate_presence_of(:content) }
end
