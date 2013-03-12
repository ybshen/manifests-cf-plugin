module VMCManifests
  class InvalidManifest < RuntimeError
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def to_s
      "Manifest file '#{@file}' is malformed."
    end
  end

  class CircularDependency < RuntimeError
    def initialize(app)
      @app = app
    end

    def to_s
      "Circular dependency in application '#@app'"
    end
  end

  class UnknownSymbol < RuntimeError
    def initialize(sym)
      @sym = sym
    end

    def to_s
      "Undefined symbol in manifest: '#@sym'"
    end
  end
end
