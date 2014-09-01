# Rezip

It's happened to all of us: you unzip a ZIP file into the current directory
thinking you'd end up with a single directory of the contents, but surprise!
Instead you just littered your current directory with a bajillion assorted new
files and directories. And that's *no good*.

![Sonic agrees, that's no good.](http://i.imgur.com/88vN4xl.jpg)

The solution: run `rezip` on the original ZIP file. It will look at the contents
of the file and delete all of the matching contents in the current directory,
effectively undoing the unzip.

## Installation

    $ gem install rezip

## Usage

    $ unzip some-dumb-archive.zip  # uh oh, we made a mistake
    $ rezip some-dumb-archive.zip  # all better!

## FAQ

##### Couldn't this just be a bash one-liner?

Probably.

## Contributing

1. Fork it ( https://github.com/brianokeefe/rezip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

