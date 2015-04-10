#
class grafana (
  $download_url       = "https://grafanarel.s3.amazonaws.com/builds/grafana-${grafana::version}-1.x86_64.rpm",
  $version            = '2.0.0_beta1',
) {
  package { 'grafana':
    ensure   => installed,
    source   => $grafana::download_url,
    provider => 'rpm',
  }

  service {'grafana':
    ensure  => running,
    enable  => true,
    require => Package['grafana'],
  }
}
