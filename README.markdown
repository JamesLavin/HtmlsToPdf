# HtmlsToPdf

## DESCRIPTION

HtmlsToPdf enables you to package one or more (ordered) HTML pages as a PDF.

## USEFULNESS

I created HtmlsToPdf because I often see multi-page websites with content I would rather have in a single PDF file, so I can view it offline and search through it. The Ruby on Rails Guides is one example. RSpec documentation is another.

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

You will find 16 example scripts in the /examples directory. Each creates a PDF from a website:

- Adam Wiggins' The 12 Factor App
- Greg Wooledge's Bash Guide
- http://adamjspooner.github.com/coffeescript-meet-backbonejs/
- Coffeescript Cookbook
- Coffeescript official documentation
- Exploring Coffeescript (ElegantCode.com)
- Advanced Rails (Jumpstart Labs)
- The Little Book on Coffeescript
- Natural Language Processing for the Working Programmer
- Learn Python the Hard Way
- Rails 3.1 release notes
- Ruby on Rails Guides
- RSpec-Rails documentation
- RSpec documentation
- Learn Ruby the Hard Way
- RubyGems User Guide

After you install HtmlsToPdf and its dependencies, you can write an ordinary Ruby script to save multiple ordered HTML pages as a single PDF.

### EXAMPLE 1

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

### EXAMPLE 2

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

### EXAMPLE 3

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

## LEGAL DISCLAIMER

Please use at your own risk. I guarantee nothing about this program.

