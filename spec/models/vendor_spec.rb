require File.dirname(__FILE__) + '/../spec_helper'

describe Vendor do

  context "valid name" do
    context "missing name" do
      subject { create_vendor :name => nil }
      specify { should have(1).error_on(:name) }
    end

    context "duplicate name" do
      before  { create_vendor :name => 'ACME' }
      subject { create_vendor :name => 'ACME' }
      specify { should have(1).error_on(:name) }
    end
  end

  context "all valid" do
    subject { create_vendor }
    specify { should be_valid }
  end

  context "default sort" do
    before do
      @z = create_vendor :name => 'Z'
      @y = create_vendor :name => 'Y'
      @a = create_vendor :name => 'A'
    end

    subject { Vendor.all }

    specify { should == [@a, @y, @z]}
  end

  def create_vendor(fields = {})
    Vendor.create({:name => 'ACME'}.merge(fields))
  end
end
