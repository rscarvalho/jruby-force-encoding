require 'spec_helper'

describe ForceEncoding do
  it 'should convert string with java class' do
    ForceEncoding::RailsPluginJavaUtil.should_not be_nil
    ForceEncoding::RailsPluginJavaUtil.should be_a(Class)
  end
end