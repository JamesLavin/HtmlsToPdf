require "spec_helper"
require 'htmls_to_pdf'

describe "initialization" do
  context "without argument" do
    let(:in_config) {  }
    subject { HtmlsToPdf.new }
    it "should initialize" do
      subject.should be_true
    end
    its(:overwrite_existing_pdf) { should be_false }
    its(:remove_temp_files) { should be_false }
    its(:remove_css_files) { should be_true }
    its(:remove_html_files) { should be_true }
    its(:remove_tmp_pdf_files) { should be_true }
    its(:cssarray) { should be_empty }
    its(:urls) { should be_empty }
    its(:savedir) { should == File.expand_path("~") }
    its(:savename) { should == 'htmls_to_pdf.pdf' }
    its(:options) { should be_kind_of Hash }
    its(:options) { should be_empty }
  end
  context "with basic config" do
    let(:url_arr) { %w(http://www.fakeurl.com/adfsdafds.html https://anotherfakedomain.com/blog/posts/143.htm) }
    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr }
                    }
    subject { HtmlsToPdf.new(in_config) }
    #subject { HtmlsToPdf.new(attributes_for(:config)) }
    it "should initialize" do
      subject.should be_true
    end
    its(:overwrite_existing_pdf) { should be_false }
    its(:remove_temp_files) { should be_false }
    its(:remove_css_files) { should be_true }
    its(:remove_html_files) { should be_true }
    its(:remove_tmp_pdf_files) { should be_true }
    its(:cssarray) { should be_empty }
    its(:urls) { should == url_arr }
    its(:savedir) { should == File.expand_path("~/my/savedir") }
    its(:savename) { should == 'Name_to_save_file_as.pdf' }
    its(:options) { should be_kind_of Hash }
    its(:options) { should be_empty }
    it "should call all subfunctions of create_pdf" do
      subject.should_receive(:clean_temp_files).twice.and_return('Temp files cleaned')
      subject.should_receive(:download_files).once.and_return('HTML files downloaded')
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      subject.create_pdf
    end
  end
  context "with more complicated config" do
    let(:url_arr) { %w(http://www.fakeurl.com/adfsdafds.html https://anotherfakedomain.com/blog/posts/143.htm) }
    let(:css_arr) { %w(http://fakeurl.com/assets/cssfile.css https://www.anotherfakedomain.com/public/css/CSS-file.css) }
    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr,
                       css: css_arr,
                       remove_css_files: false,
                       remove_html_files: false,
                       overwrite_existing_pdf: true }
                    }
    subject { HtmlsToPdf.new(in_config) }
    #subject { HtmlsToPdf.new(attributes_for(:config)) }
    it "should initialize" do
      subject.should be_true
    end
    its(:overwrite_existing_pdf) { should be_true }
    its(:remove_temp_files) { should be_false }
    its(:remove_css_files) { should be_false }
    its(:remove_html_files) { should be_false }
    its(:remove_tmp_pdf_files) { should be_true }
    its(:cssarray) { should == css_arr }
    its(:urls) { should == url_arr }
    its(:savedir) { should == File.expand_path("~/my/savedir") }
    its(:savename) { should == 'Name_to_save_file_as.pdf' }
    its(:options) { should be_kind_of Hash }
    its(:options) { should be_empty }
    it "should call all subfunctions of create_pdf" do
      subject.should_receive(:clean_temp_files).twice.and_return('Temp files cleaned')
      subject.should_receive(:download_files).once.and_return('HTML files downloaded')
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      subject.create_pdf
    end
    it "should not delete html or css files" do
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://anotherfakedomain.com:443/blog/posts/143.htm").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://fakeurl.com/assets/cssfile.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://www.anotherfakedomain.com:443/public/css/CSS-file.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      subject.should_not_receive(:delete_html_files)
      subject.should_not_receive(:delete_css_files)
      subject.create_pdf
    end
    it "should request the HTML files" do
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://anotherfakedomain.com:443/blog/posts/143.htm").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://fakeurl.com/assets/cssfile.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://www.anotherfakedomain.com:443/public/css/CSS-file.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      subject.create_pdf
      a_request(:get, "www.fakeurl.com/adfsdafds.html").should have_been_made
    end

  end
end
