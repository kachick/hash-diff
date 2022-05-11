hash-diff
===========

![Build Status](https://github.com/kachick/hash-diff/actions/workflows/spec.yml/badge.svg?branch=main)
[![Gem Version](https://badge.fury.io/rb/hash-diff.png)](http://badge.fury.io/rb/hash-diff)

Description
-----------

Get difference in 2 Hash

Usage
-----

Require Ruby 3.0 or later

```console
$ gem install hash-diff
Latest version will be installed!
```


```ruby
require 'hash/diff'

old = { updated: :bye, kept: :same, deleted: :bye }
new = { updated: :hi,  kept: :same, appended: :hi }

diff = Hash::Diff old, new
diff.updated #=> {:updated=>:hi, :deleted=>:bye, :appended=>:hi}
diff.deleted #=> {:deleted=>:bye}
diff.appended #=> {:appended=>:hi}
diff.kept #=> {:kept=>:same}
diff.value_updated #=> {:updated=>:hi}
```

License
--------

The MIT X11 License  
Copyright (c) 2017 Kenichi Kamiya  
See MIT-LICENSE for further details.
