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
Bignum.html
Binding.html
Class.html
Comparable.html
Complex.html
Continuation.html
Data.html
Dir.html
ENV.html
EOFError.html
Encoding.html
Encoding/CompatibilityError.html
Encoding/Converter.html
Encoding/ConverterNotFoundError.html
Encoding/InvalidByteSequenceError.html
Encoding/UndefinedConversionError.html
EncodingError.html
Enumerable.html
Enumerator.html
Enumerator/Generator.html
Enumerator/Yielder.html
Errno.html
Exception.html
FalseClass.html
Fiber.html
FiberError.html
File.html
File/Constants.html
File/Stat.html
FileTest.html
Fixnum.html
Float.html
FloatDomainError.html
GC.html
GC/Profiler.html
Hash.html
IO.html
IO/WaitReadable.html
IO/WaitWritable.html
IOError.html
IndexError.html
Integer.html
Interrupt.html
Kernel.html
KeyError.html
LoadError.html
LocalJumpError.html
Marshal.html
MatchData.html
Math.html
Math/DomainError.html
Method.html
Module.html
Mutex.html
NameError.html
NilClass.html
NoMemoryError.html
NoMethodError.html
NotImplementedError.html
Numeric.html
Object.html
ObjectSpace.html
Proc.html
Process.html
Process/GID.html
Process/Status.html
Process/Sys.html
Process/UID.html
Random.html
Range.html
RangeError.html
Rational.html
Regexp.html
RegexpError.html
RubyVM.html
RubyVM/Env.html
RubyVM/InstructionSequence.html
RuntimeError.html
ScriptError.html
SecurityError.html
Signal.html
SignalException.html
StandardError.html
StopIteration.html
String.html
Struct.html
Symbol.html
SyntaxError.html
SystemCallError.html
SystemExit.html
SystemStackError.html
Thread.html
ThreadError.html
ThreadGroup.html
Time.html
TrueClass.html
TypeError.html
UnboundMethod.html
ZeroDivisionError.html
fatal.html)
config[:urls] = config[:urls].map { |u| 'http://www.ruby-doc.org/core-1.9.3/' + u }
config[:savedir] = '~/Tech/Ruby/DOCUMENTATION'
config[:css] = 'http://www.ruby-doc.org/core-1.9.3/css/obf.css'
config[:remove_css_files] = false
config[:savename] = 'Ruby_Core_docs.pdf'

HtmlsToPdf.new(config).create_pdf
