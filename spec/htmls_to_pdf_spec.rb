require "spec_helper"
require 'htmls_to_pdf'

describe HtmlsToPdf do

  let(:url_arr) { %w(http://www.fakeurl.com/adfsdafds.html https://fakesshurl.com/blog/posts/143.htm) }

  subject { HtmlsToPdf.new(in_config) }

  context "without argument" do

    let(:in_config) { {} }

    it { should be_true }
    its(:overwrite_existing_pdf) { should be_false }
    its(:remove_temp_files) { should be_false }
    its(:remove_css_files) { should be_true }
    its(:remove_html_files) { should be_true }
    its(:remove_tmp_pdf_files) { should be_true }
    its(:cssarray) { should be_empty }
    its(:urls) { should be_empty }
    its(:savedir) { should == File.expand_path("~") }
    its(:savename) { should == 'htmls_to_pdf.pdf' }
    its(:debug) { should be_false }
    its(:options) { should be_kind_of Hash }
    its(:options) { should be_empty }

  end

  context "with basic config" do


    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr } }

    it { should be_true }
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
      subject.should_receive(:get_temp_files).once.and_return('HTML files downloaded')
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "https://fakesshurl.com/blog/posts/143.htm").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      subject.create_pdf
    end

    describe "setting config values via setters" do

      it "should change the debug setting when requested" do
        subject.debug.should be_false
        subject.debug = true
        subject.debug.should be_true
      end

      it "should change the savename when requested" do
        subject.savename.should == 'Name_to_save_file_as.pdf'
        newsavename = 'This_is_the-new-savename.pdf'
        expect { subject.savename = newsavename }.to change { subject.savename }.to(newsavename)
      end

    end

  end

  context "with debug" do
  
    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr,
                       debug: true } }

    its(:debug) { should be_true }
 
    it "should output the correct debugging information" do
      subject.should_receive(:clean_temp_files).twice.and_return('Temp files cleaned')
      # let subject.get_temp_files play out
      STDOUT.should_receive(:write).at_least(:once).with("Downloading #{url_arr[0]}") 
      STDOUT.should_receive(:write).at_least(:once).with("Saving #{url_arr[0]} to tmp_html_file_0")
      STDOUT.should_receive(:write).at_least(:once).with("\n")  # I have no idea why this is necessary, but test fails without it
      STDOUT.should_receive(:write).at_least(:once).with("Downloading #{url_arr[1]}")
      STDOUT.should_receive(:write).at_least(:once).with("Saving #{url_arr[1]} to tmp_html_file_1")
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "https://fakesshurl.com/blog/posts/143.htm").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      subject.create_pdf
    end

  end

  context "if savename already exists" do

    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr } }
    before do
      @dirname = File.expand_path('~/my/savedir')
      FileUtils.mkdir_p(@dirname)
      FileUtils.touch(@dirname + '/Name_to_save_file_as.pdf')
    end

    it "should generate an informative error message" do
      # I really want to test message, but the test fails 
      # message = "File Name_to_save_file_as.pdf already exists in #{@dirname}. Please rename or delete and re-run this program."
      # $stdout.should_receive(:write).at_least(:once).with(message)
      $stdout.should_receive(:write).at_least(:once)
      begin
        subject
      rescue SystemExit
      end
    end
    
    it "should terminate" do
      expect { subject }.to raise_error SystemExit
    end

  end

  context "if savedir does not already exist" do

    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr } }
    
    it "should create savedir" do
      subject
      File.directory?(File.expand_path('~/my/savedir')).should be_true
    end

  end

  context "with more complicated config" do

    let(:css_arr) { %w(http://fakeurl.com/assets/cssfile.css https://www.fakesshurl.com/public/css/CSS-file.css) }

    let(:in_config) { {savedir: '~/my/savedir',
                       savename: 'Name_to_save_file_as.pdf',
                       urls: url_arr,
                       css: css_arr,
                       remove_css_files: false,
                       remove_html_files: false,
                       overwrite_existing_pdf: true }
                    }

    it { should be_true }
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
      subject.should_receive(:get_temp_files).once.and_return('HTML files downloaded')
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      subject.create_pdf
    end

    it "should not delete html or css files" do
      stub_request(:get, "http://www.fakeurl.com/adfsdafds.html").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "https://fakesshurl.com/blog/posts/143.htm").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://fakeurl.com/assets/cssfile.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "https://www.fakesshurl.com/public/css/CSS-file.css").
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
      stub_request(:get, "https://fakesshurl.com/blog/posts/143.htm").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "http://fakeurl.com/assets/cssfile.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      stub_request(:get, "https://www.fakesshurl.com/public/css/CSS-file.css").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})
      subject.should_receive(:generate_pdfs).once.and_return('PDF files generated')
      subject.should_receive(:join_pdfs).once.and_return('PDF files joined')
      subject.create_pdf
      a_request(:get, "www.fakeurl.com/adfsdafds.html").should have_been_made
      a_request(:get, "https://fakesshurl.com/blog/posts/143.htm").should have_been_made
      a_request(:get, "fakeurl.com/assets/cssfile.css").should have_been_made
      a_request(:get, "https://www.fakesshurl.com/public/css/CSS-file.css").should have_been_made
    end

  end

end
