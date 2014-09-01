require 'fileutils'
require 'thor'
require 'zip'

module Rezip
  class CLI < Thor
    default_task :rezip

    desc 'rezip [FILE]', 'Undo the unzipping of [FILE] in the current directory'
    def rezip(file)
      unless File.exists? file
        puts "rezip: #{file}: no such file"
        exit
      end

      Zip::File.open file do |archive|
        # Delete files
        archive.each do |entry|
          FileUtils.rm entry.name
        end

        # Delete directories
        directories = archive.select { |e| e.name.include? '/' }.map { |e| e.name.split('/').first }.uniq
        directories.each do |entry|
          FileUtils.rm_rf entry
        end
      end
    rescue Zip::Error
      puts "rezip: #{file}: invalid zip archive"
    end

    # A hack to get `default_task` to work with an argument
    def method_missing(method, *args, &block)
      rezip method.to_s
    end
  end
end

