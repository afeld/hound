class ConfigBuilder
  def self.for(repo:, hound_config:, linter_name:)
    config_class =
      begin
        "Config::#{linter_name.classify}".constantize
      rescue
        Config::Unsupported
      end

    config_class.new(
      repo: repo,
      hound_config: hound_config,
      linter_name: linter_name,
    )
  end
end
