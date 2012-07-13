maintainer        "Millisami"
maintainer_email  "millisami@gmail.com"
license           "Apache 2.0"
description       "Configures unicorn"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "unicorn", "Configures RACK apps to serve using unicorn"

depends "bluepill"
