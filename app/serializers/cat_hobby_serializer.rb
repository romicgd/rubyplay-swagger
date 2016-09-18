class CatHobbySerializer < ActiveModel::Serializer
  attributes :id
  has_one :cat
  has_one :hobby
end
