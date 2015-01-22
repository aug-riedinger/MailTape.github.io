require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
  class LessConverter < JekyllAssetPipeline::Converter
    require 'less'

    def self.filetype
      '.less'
    end

    def convert
      begin
        return Less::Parser.new(:paths => ["_assets/stylesheets"]).parse(@content).to_css
      rescue Less::Error => e
        puts "Error processing Less File: #{e}"
        throw e
      end
    end
  end
end