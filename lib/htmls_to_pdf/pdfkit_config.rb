# encoding : utf-8

require 'pdfkit'

PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/bin/wkhtmltopdf'
end

