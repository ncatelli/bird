name 'build_cookbook'
maintainer 'Nate Catelli'
maintainer_email 'ncatelli@packetfire.org'
license 'all_rights'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
