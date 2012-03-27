# HtmlsToPdf

## DESCRIPTION

HtmlsToPdf enables you to package one or more (ordered) HTML pages as a PDF.

## USEFULNESS

I created HtmlsToPdf because I often see multi-page websites with content I would rather have in a single PDF file for searching and offline viewing. Examples include: The Ruby on Rails Guides and RSpec documentation.

## REQUIREMENTS

HtmlsToPdf uses the PDFKit gem, which itself uses the [wkhtmltopdf](http://madalgo.au.dk/~jakobt/wkhtmltoxdoc/wkhtmltopdf-0.9.9-doc.html) program, which uses qtwebkit.

Dependence chain summary: HtmlsToPdf -> PDFKit -> wkhtmltopdf -> qtwebkit -> webkit

For information on qtwebkit:

- [Installing on Linux](http://trac.webkit.org/wiki/BuildingQtOnLinux)

- [Installing on MacOS](http://trac.webkit.org/wiki/BuildingQtOnOSX)

- [Installing on Windows](http://trac.webkit.org/wiki/BuildingQtOnWindows)

For information on wkhtmltopdf:

- [Installation guide from PDFKit author](https://github.com/pdfkit/PDFKit/wiki/Installing-WKHTMLTOPDF)

- [code.google.com](http://code.google.com/p/wkhtmltopdf/)

For information on PDFKit:

- [Github](https://github.com/pdfkit/PDFKit)

- [Railscasts](http://railscasts.com/episodes/220-pdfkit)

## BASIC USAGE

To use HtmlsToPdf, you create a new HtmlsToPdf object and pass in all your configuration options. You then call create_pdf on the new object:

    require 'rubygems'
    require 'htmls_to_pdf'

    config = {}
    config[:urls] = ['http://.../url1.htm', 'https://.../url2.html']
    config[:savedir] = '~/my/savedir'
    config[:savename] = 'Name_to_save_file_as.pdf'

    HtmlsToPdf.new(config).create_pdf

## OPTIONS

`config[:css]` takes an array of CSS files to apply during PDF rendering. (You can also pass a single CSS file as a string.)

`config[:overwrite_existing_pdf]` (default: false) determines whether the program can overwrite a previously generated PDF file

`config[:options]` takes a hash of options that are passed through to PdfKit

`config[:remove_css_files]` (default: true) determines whether CSS files used to generate the PDF file are deleted or retained. You probably want to set this to false if you want to modify the CSS file(s).

`config[:remove_html_files]` (default: true) determines whether HTML files downloaded from websites and used to generate the PDF file are deleted or retained. You probably want to set this to false if you think you may want to regenerate the PDF again, perhaps because you're tweaking the CSS file to adjust rendering.

`config[:remove_tmp_pdf_files]` (default: true) determines whether temporary PDF files (one per HTML file) created during the PDF generation process are deleted or retained. You probably want to accept the default and always regenerate the temporary PDFs.

`config[:remove_temp_files]` sets `:remove_css_files`, `:remove_html_files`, and `:remove_tmp_pdf_files` all to true

## EXAMPLES

You will find 17 example scripts in the /examples directory. Each creates a PDF from a website:

- [The 12 Factor App](http://www.12factor.net) (Adam Wiggins)
- [Bash Guide](http://mywiki.wooledge.org/BashGuide) (Greg Wooledge)
- [Coffeescript Meet Backbone.js](http://adamjspooner.github.com/coffeescript-meet-backbonejs/) (Adam J. Spooner)
- [Coffeescript Cookbook](http://coffeescriptcookbook.com) ([Various authors](http://coffeescriptcookbook.com/authors))
- [Coffeescript official documentation](http://coffeescript.org/)
- [Exploring Coffeescript](http://elegantcode.com/2011/08/09/exploring-coffeescript-part-6-show-me-the-goodies/) (ElegantCode.com)
- [Advanced Rails - Five-Day](http://tutorials.jumpstartlab.com/paths/advanced_rails_five_day.html) (Jumpstart Labs)
- [The Little Book on Coffeescript](http://arcturo.github.com/library/coffeescript/) (Alex MacCaw)
- [Natural Language Processing for the Working Programmer](nlpwp.org/book/) (Daniël de Kok)
- [Learn Python the Hard Way](http://learnpythonthehardway.org) (Zed A. Shaw)
- [Practicing Ruby Vol 2](http://community.mendicantuniversity.org/articles/practicing-ruby-volume-2-now-freely-avai) (Gregory Brown)
- Rails 3.1 release notes
- [Ruby on Rails Guides](http://guides.rubyonrails.org)
- [RSpec-Rails documentation](https://www.relishapp.com/rspec/rspec-rails/docs)
- [RSpec documentation](https://www.relishapp.com/rspec/rspec-rails/docs)
- [Learn Ruby the Hard Way](http://ruby.learncodethehardway.org) (Zed A. Shaw)
- [RubyGems User Guide](http://docs.rubygems.org/read/book/1)

After you install HtmlsToPdf and its dependencies, you can write an ordinary Ruby script to save multiple ordered HTML pages as a single PDF.

### EXAMPLE 1: Single HTML page without CSS

Annotated version of /examples/get\_rails\_3\_1\_release\_notes.rb:

    # require the gem
    require 'rubygems'
    require 'htmls_to_pdf'

    # Get 'Rails 3.1 Release Notes' as pdf file
    # Source: 'http://guides.rubyonrails.org/3_1_release_notes.html'

    # create an empty hash to hold your configuration options
    config = {}
    config[:urls] = ['http://guides.rubyonrails.org/3_1_release_notes.html']

    # set a :savedir key with a string value indicating the directory to create
    # your PDF file in. If the directory does not exist, it will be created
    config[:savedir] = '~/Tech/Rails/3.1'

    # set a :savename key with a string value indicating the name of the PDF file
    config[:savename] = 'Rails_3.1_Release_Notes.pdf'

    # create a new HtmlsToPdf object, passing in your hash, and then call create_pdf
    # on the new object
    HtmlsToPdf.new(config).create_pdf

### EXAMPLE 2: Multiple HTML pages without CSS

Annotated version of /examples/get\_rubygems\_user\_guide.rb:

    # require the gem
    require 'rubygems'
    require 'htmls_to_pdf'

    # Get 'RubyGems User Guide' as pdf file
    # Source: 'http://docs.rubygems.org/read/book/1'

    # create an empty hash to hold your configuration options
    config = {}

    # set a :urls key with a value of an array containing all the 
    # urls you want in your PDF (in the order you want them)
    config[:urls] = ['http://docs.rubygems.org/read/book/1']
    # I have no idea why these chapters are numbered as they are!
    [1,2,3,4,16,7,5,6,21].each do |val|
      config[:urls] << 'http://docs.rubygems.org/read/chapter/' + val.to_s
    end

    # set a :savedir key with a string value indicating the directory to create
    # your PDF file in. If the directory does not exist, it will be created
    config[:savedir] = '~/Tech/Ruby/GEMS/DOCUMENTATION'

    # set a :savename key with a string value indicating the name of the PDF file
    config[:savename] = 'RubyGems_User_Guide.pdf'

    # create a new HtmlsToPdf object, passing in your hash, and then call create_pdf
    # on the new object
    HtmlsToPdf.new(config).create_pdf

### EXAMPLE 3: Multiple HTML pages with CSS & PdfKit formatting options

Annotated version of /examples/get\_coffeescript\_meet\_backbone.rb:

    require 'rubygems'
    require 'htmls_to_pdf'

    # Get 'CoffeeScript, Meet Backbone.js' as pdf file
    # Source: 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/'

    config = {}
    config[:urls] = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/']
    (1..5).each do |val|
      config[:urls] << 'http://adamjspooner.github.com/coffeescript-meet-backbonejs/0' + val.to_s + '/docs/script.html'
    end
    config[:savedir] = '~/Tech/Javascript/COFFEESCRIPT/BACKBONE.JS'
    config[:savename] = 'CoffeeScript_Meet_Backbone.js.pdf'

    # If a :css key is given with an array value, the CSS files in the array will be used to generate
    # the PDF document. This allows you to modify the CSS file(s) to, for example, hide HTML headers,
    # sidebars and footers you do not wish to appear in your PDF.
    config[:css] = ['http://adamjspooner.github.com/coffeescript-meet-backbonejs/05/docs/docco.css']

    # If a :options key is passed with a hash value, that hash will be passed to wkhtmltopdf.
    # Many options are available through wkhtmltopdf; see: [the wkhtmltopdf documentation](http://madalgo.au.dk/~jakobt/wkhtmltoxdoc/wkhtmltopdf-0.9.9-doc.html).
    config[:options] = {:page_size => 'Letter', :orientation => 'Landscape'}

    HtmlsToPdf.new(config).create_pdf

### EXAMPLE 4: Multiple HTML pages with hand-modified CSS file to adjust rendering

Annotated version of /examples/get\_ruby\_core\_docs.rb:

    require 'rubygems'
    require 'htmls_to_pdf'

    # Get 'Ruby Core documentation' as pdf file
    # Source: 'http://www.ruby-doc.org/core-1.9.3/'

    config = {}

    config[:urls] = %w(
    ARGF.html
    ArgumentError.html
    Array.html
    BasicObject.html
    ...
    ZeroDivisionError.html
    fatal.html)

    config[:urls] = config[:urls].map { |u| 'http://www.ruby-doc.org/core-1.9.3/' + u }
    config[:savedir] = '~/Tech/Ruby/DOCUMENTATION'
    config[:savename] = 'Ruby_Core_docs.pdf'

    # Specify a CSS file
    config[:css] = 'http://www.ruby-doc.org/core-1.9.3/css/obf.css'

    # Tell HtmlsToPdf not to remove the CSS file
    config[:remove_css_files] = false

    # You are now free to create a "obf.css" file in the directory
    # and edit it however you choose. It will not be overwritten.
    # (Alternatively, you can run the program once and then modify
    # the downloaded CSS file.)
    #
    # I added the following to the CSS file to suppress unwanted output:
    #
    # .info, noscript, #footer, #metadata, #actionbar, .dsq-brlink {
    #   display: none;
    #   width: 0;
    # }
    # .class #documentation, .file #documentation, .module #documentation {
    #   margin: 2em 1em 5em 1em;
    # }
    #
    # If you're playing around with CSS to optimize the display in your
    # PDF, I recommend you set config[:remove_html_files] = false to
    # avoid repeatedly downloading the HTML files from the server.

    HtmlsToPdf.new(config).create_pdf

## LEGAL DISCLAIMER

Please use at your own risk. I guarantee nothing about this program.

