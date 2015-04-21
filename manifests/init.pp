#
class grafana (
  $download_url = 'https://grafanarel.s3.amazonaws.com/builds/grafana-2.0.1-1.x86_64.rpm',
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
