#
# Commerce API
#
class EbayAPI
  scope :commerce do
    path "commerce"

    require_relative "commerce/catalog"
  end
end
