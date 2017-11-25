hash-diff
===========

[![Build Status](https://secure.travis-ci.org/kachick/hash-diff.png)](http://travis-ci.org/kachick/hash-diff)
[![Gem Version](https://badge.fury.io/rb/hash-diff.png)](http://badge.fury.io/rb/hash-diff)

Description
-----------

Get difference in 2 Hash

Example
-----

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

Requirements
-------------

* Ruby - [2.2 or later](http://travis-ci.org/#!/kachick/hash-diff)

Install
-------

```bash
gem install hash-diff
```

Link
----

* [repository](https://github.com/kachick/hash-diff)
* [API](http://www.rubydoc.info/github/kachick/hash-diff)

License
--------

The MIT X11 License  
Copyright (c) 2017 Kenichi Kamiya  
See MIT-LICENSE for further details.
