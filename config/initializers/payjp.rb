# Pay.jp gemのSSL通信設定を直接上書きし、証明書エラーを解決する

# システムの正しいCA証明書ファイルのパス
ca_path = '/etc/ssl/certs/ca-certificates.crt'

# Pay.jp gemが使用する証明書ファイルのパスとして設定する
Payjp.ssl_ca_file = ca_path if File.exist?(ca_path)