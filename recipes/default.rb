include_recipe "libexpat"
include_recipe "libfreetype"
include_recipe "fontconfig-config"

packages = Array.new

case node[:lsb][:codename]
when "lucid", "precise"
  packages |= %w/
    libfontconfig1
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
