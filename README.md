# Fiddler

Fiddler is a super tiny (80 LOC) for [fiddle](http://www.ruby-doc.org/stdlib-2.0/libdoc/fiddle/rdoc/Fiddle.html)
of **RUBY 2.+**.

## Installation

Add this line to your application's Gemfile:

    gem 'fiddler-rb', require: 'fiddler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fiddler-rb

## Usage

You can wrap your library like:

```rb
require 'fiddler'

module LevelDB
  module C
    include Fiddler

    prefix 'leveldb_'
    dlload 'libleveldb'

    cdef :open, VOIDP, options: VOIDP, name: VOIDP, errptr: VOIDP
    cdef :put, VOID, db: VOIDP, options: VOIDP, key: VOIDP, keylen: ULONG, val: VOIDP, vallen: ULONG, errptr: VOIDP
    cdef :get, VOIDP, db: VOIDP, options: VOIDP, key: VOIDP, keylen: ULONG, vallen: VOIDP, errptr: VOIDP
    cdef :delete, VOID, db: VOIDP, options: VOIDP, key: VOIDP, keylen: ULONG, errptr: VOIDP
  end
end
```

And then use the wrapper:

```
errors  = C::Pointer.malloc(C::SIZEOF_VOIDP)
options = C.struct ['char c', 'long n']

db = C.open options, './path', errors
db.free = C[:release_db]

C.put db, 'a', 1 ...
C.get db, 'a', ...
C.delete db, 'a', ...
```

## Examples

* [leveldb](https://github.com/DAddYE/leveldb/blob/master/lib/leveldb/db.rb)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
