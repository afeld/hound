module Config
  class Python < Base
    def content
      @content ||= super || default_content
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
