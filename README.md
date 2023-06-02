# hash-diff

- _**This repository is archived**_
- _**No longer maintained**_
- _**All versions have been removed from <https://rubygems.org> to free up valuable namespace for other developers**_.

![Build Status](https://github.com/kachick/hash-diff/actions/workflows/spec.yml/badge.svg?branch=main)

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

- [Repository](https://github.com/kachick/hash-diff)
