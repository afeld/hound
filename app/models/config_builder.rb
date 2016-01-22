class ConfigBuilder
  def self.for(hound_config, name)
    config_class =
      begin
        "Config::#{name.classify}".constantize
      rescue
        Config::Unsupported
      end

    config_class.new(hound_config, name)
  end
end
