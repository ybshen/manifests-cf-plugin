require "manifests-cf-plugin/loader/builder"
require "manifests-cf-plugin/loader/normalizer"
require "manifests-cf-plugin/loader/resolver"

module CFManifests
  class Loader
    include Builder
    include Normalizer
    include Resolver

    def initialize(file, resolver)
      @file = file
      @resolver = resolver
    end

    def manifest
      info = build(@file)
      normalize! info
      resolve info, @resolver
    end

    private

    # expand a path relative to the manifest file's directory
    def from_manifest(path)
      return path unless @file

      File.expand_path(path, File.dirname(@file))
    end
  end
end
