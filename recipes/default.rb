include_package "libexpat"
include_package "libfreetype"
include_package "fontconfig-config"

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
