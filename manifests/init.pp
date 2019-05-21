# Install Python36 from EPEL
#
# @summary Install Python36 from EPEL
#
# @example
#   include python3
class python3 (
  Array[String] $old_files,
  Array[String] $old_packages,
  Array[String] $packages,
  Hash $pip_packages,
  Hash $symlinks,
)
{

#  $old_packages.each | Integer $index, $value |
#  {
#    exec { "remove misc $value packages":
#      command => "yum -y remove $value",
#      path    => '/usr/bin:/usr/sbin:/bin',
#      onlyif  => "yum list installed $value",
#    }
#  }
  ## DOES THIS NOT WORK?
  ensure_packages($old_packages, {'ensure' => 'absent', })

  file { $old_files:
    ensure => absent,
    force  => true,
  }

  ensure_packages($packages, {'ensure' => 'present', })

  ensure_resources('file', lookup('python3::symlinks'), {'ensure' => 'link'})

  ## LIKELY VERY SPECIFIC TO RHEL/CENTOS
  exec { 'reinstall pip binary if missing':
    creates => '/usr/bin/pip3.6',
    command => 'yum -y reinstall python36-pip',
    path    => ['/bin', '/usr/bin', '/usr/sbin',],
  }

  ensure_resources('package', lookup('python3::pip_packages'), {'provider' => 'pip3', })
#  ensure_packages($pip_packages, {'provider' => 'pip3', })

}
