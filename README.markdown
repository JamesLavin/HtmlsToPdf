# HtmlsToPdf

## DESCRIPTION

HtmlsToPdf enables you to package one or more (ordered) HTML pages as a PDF.

## REQUIREMENTS

HtmlsToPdf uses the PDFKit gem, which itself uses the [wkhtmltopdf](http://madalgo.au.dk/~jakobt/wkhtmltoxdoc/wkhtmltopdf-0.9.9-doc.html) program, which uses qtwebkit.

Dependence chain summary: HtmlsToPdf -> PDFKit -> wkhtmltopdf -> qtwebkit -> webkit

For information on qtwebkit:

- [Installing on Linux](http://trac.webkit.org/wiki/BuildingQtOnLinux)

- [Installing on MacOS](http://trac.webkit.org/wiki/BuildingQtOnOSX)

- [Installing on Windows](http://trac.webkit.org/wiki/BuildingQtOnWindows)

For information on wkhtmltopdf:

- [Installation guide from PDFKit author](https://github.com/jdpace/PDFKit/wiki/Installing-WKHTMLTOPDF)

- [code.google.com](http://code.google.com/p/wkhtmltopdf/)

For information on PDFKit:

- [Github](https://github.com/jdpace/PDFKit)

- [Railscasts](http://railscasts.com/episodes/220-pdfkit)

## BASIC USAGE

You will find six example scripts in the /examples directory.

After you install HtmlsToPdf and its dependencies, you can write an ordinary Ruby script with the following features:

### EXAMPLE 1

Annotated version of /examples/get_rubygems_user_guide.rb:

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

### EXAMPLE 2

Annotated version of /examples/get_coffeescript_meet_backbone.rb:

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

Please use at your own risk. I do not guarantee anything about this program.
