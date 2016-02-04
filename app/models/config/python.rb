module Config
  class Python < Base
    def content
      @content ||= super.presence || default_content
    end

    def serialize(data = content)
      IniFile.new(content: data).to_s
    end

    private

    def parse(file_content)
      Config::Parser.ini(file_content)
    end

    def default_content
      ""
    end
  end
end
