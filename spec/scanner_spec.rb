require 'spec_helper'

describe "@scanner" do
  before(:each) do
    @scanner = Scanner.new
  end

  subject { @scanner.scan @item }

  context "when item is Apples" do
    before(:each) do
      @item = "Apples"
    end
    it "returns 100" do
      subject.should eq(100)
    end
  end

  context "when items is Apple & Cherries" do
    before(:each) do
      @scanner.scan "Apples"
      @item = "Cherries"
    end

    it "returns 175" do
      subject.should eq(175)
    end
  end

  context "when items is Apple & Cherries & Cherries" do
    before(:each) do
      @scanner.scan "Apples"
      @scanner.scan "Cherries"
      @item = "Cherries"
    end

    it "returns 230" do
      subject.should eq(230)
    end
  end

  context "when items are Apples, Bananas and Cherries" do
    before(:each) do
      @scanner.scan "Apples"
      @scanner.scan "Cherries"
      @item = "Bananas"
    end
    it "returns 325" do
      subject.should eq(325)
    end
  end

  context "when Bananas" do
    before(:each) do
      @item = "Bananas"
    end
    it "returns 150" do
      subject.should eq(150)
    end
  end

  context "when two Bananas" do
    before(:each) do
      @scanner.scan "Cherries"
      @scanner.scan "Cherries"
      @scanner.scan "Bananas"
      @item = "Bananas"
    end
    it "returns 280" do
      subject.should eq(280)
    end
  end

  context "iteration 4" do
    before(:each) do
      @scanner.scan "Cherries"
      @scanner.scan "Pommes"
      @scanner.scan "Cherries"
      @scanner.scan "Bananas"
      @scanner.scan "Bananas"
      @item = "Apples"
    end
    it "returns 280" do
      subject.should eq(280)
    end
  end

  context "iteration 5" do
    before(:each) do
      @item = "Mele,Pommes,Pommes,Apples,Pommes,Mele,Cherries,Cherries,Bananas"
    end
    it "returns 430" do
      subject.should eq(430)
    end
  end

  context "iteration 6" do
    before(:each) do
      @item = "Mele,Pommes,Pommes,Mele"
    end
    it "returns 250" do
      subject.should eq(250)
    end
  end

  context "iteration 6a" do
    before(:each) do
      @item = "Mele,Pommes,Pommes,Apples,Mele"
    end
    it "returns 150" do
      subject.should eq(150)
    end
  end
end