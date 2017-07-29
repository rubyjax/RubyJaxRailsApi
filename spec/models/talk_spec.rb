require 'rails_helper'

RSpec.describe Talk, type: :model do
  it { should validate_presence_of(:title)       }
  it { should validate_presence_of(:category)    }
  it { should validate_presence_of(:description) }
end
