module Config
  class Eslint < Base
    def content
      super || default_content
    end

    def serialize(data = content)
      ActiveSupport::JSON.encode(data)
    end

    private

    def parse(file_content)
      Config::Parser.yaml(file_content)
    end

    def default_content
      {}
    end
  end
end
