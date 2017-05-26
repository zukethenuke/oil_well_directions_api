json.array! @well.each do |well|
  json.partial! 'nd_well.json.jbuilder', well: well
end