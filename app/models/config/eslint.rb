module Config
  class Eslint < Base
    DEFAULT_CONTENT = {}.freeze

    def content
      super || DEFAULT_CONTENT
    end

    def serialize(data = content)
      data.to_yaml
    end

    private

    def parse(file_content)
      Config::Parser.yaml(file_content)
    end
  end
end
