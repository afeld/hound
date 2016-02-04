module Config
  class Scss < Base
    def serialize(data = content)
      data.to_yaml
    end

    private

    def parse(file_content)
      Parser.yaml(file_content)
    end
  end
end
