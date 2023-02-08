# hash-diff

![Build Status](https://github.com/kachick/hash-diff/actions/workflows/spec.yml/badge.svg?branch=main)
[![Gem Version](https://badge.fury.io/rb/hash-diff.svg)](http://badge.fury.io/rb/hash-diff)

## Usage

Get difference in 2 Hash

```ruby
require 'hash/diff'

old = { updated: :bye, kept: :same, deleted: :bye }
new = { updated: :hi,  kept: :same, appended: :hi }

diff = Hash::Diff old, new
diff.dirty #=> {:updated=>:hi, :deleted=>:bye, :appended=>:hi}
diff.deleted #=> {:deleted=>:bye}
diff.appended #=> {:appended=>:hi}
diff.kept #=> {:kept=>:same}
diff.value_updated #=> {:updated=>:hi}
```

## Links

* [Repository](https://github.com/kachick/hash-diff)
