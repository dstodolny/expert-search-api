class ApplicationSerializer < ActiveModel::Serializer
  def transform_key key
    key.to_s.dasherize.to_sym
  end

  def attributes *args
    Hash[super.map do |key, value|
      [key.to_s.dasherize.to_sym, value]
    end]
  end

  def each_association &block
    super do |key, association, opts|
      if block_given?
        block.call transform_key(key), association, opts
      end
    end
  end
end
