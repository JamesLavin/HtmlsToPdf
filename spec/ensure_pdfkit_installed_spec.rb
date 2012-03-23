require "spec_helper"

describe "PDFKit configuration" do
  it "has a binary at '/usr/bin/wkhtmltopdf'" do
    File.exists?('/usr/bin/wkhtmltopdf').should be_true
  end
  it "its binary at '/usr/bin/wkhtmltopdf' is runnable by current user" do
    File.executable?('/usr/bin/wkhtmltopdf').should be_true
  end
  it "has installed the 'pdfkit' gem" do
    expect { require 'pdfkit' }.to_not raise_error
  end
end
