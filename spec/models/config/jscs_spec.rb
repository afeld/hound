require "spec_helper"
require "app/models/config/base"
require "app/models/config/jscs"
require "app/models/config/parser"

describe Config::Jscs do
  describe "#content" do
    it "parses the configuration using YAML" do
      raw_config = <<-EOS.strip_heredoc
        { "disallowKeywordsInComments": true }
      EOS
      commit = stubbed_commit("config/.jscsrc" => raw_config)
      config = build_config(commit)

      expect(config.content).to eq Config::Parser.yaml(raw_config)
    end
  end

  def build_config(commit)
    hound_config = double(
      "HoundConfig",
      commit: commit,
      content: {
        "jscs" => { "enabled": true, "config_file" => "config/.jscsrc" },
      },
    )

    Config::Jscs.new(
      hound_config: hound_config,
      repo: double("Repo"),
      linter_name: "jscs",
    )
  end
end
