json.array! @wells.each do |well|
  json.partial! 'nd_well.json.jbuilder', well: well
end