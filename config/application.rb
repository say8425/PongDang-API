# frozen_string_literal: true

Jets.application.configure do
  config.project_name = 'PongDang'
  config.mode = 'api'

  config.prewarm.enable = true # default is true
  # config.prewarm.rate = '30 minutes' # default is '30 minutes'
  # config.prewarm.concurrency = 2 # default is 2
  # config.prewarm.public_ratio = 3 # default is 3

  # config.env_extra = 2 # can also set this with JETS_ENV_EXTRA
  config.autoload_paths = []
  # config.asset_base_url = 'https://cloudfront.domain.com/assets' # example

  # config.cors = true # for '*'' # defaults to false
  # config.cors = '*.mydomain.com' # for specific domain

  # config.function.timeout = 30 # defaults to 30
  # config.function.role = "arn:aws:iam::#{Jets.aws.account}:role/service-role/pre-created"
  # config.function.memory_size = 1536

  # config.api.endpoint_type = 'PRIVATE' # Default is 'EDGE' (https://docs.aws.amazon.com/apigateway/api-reference/link-relation/restapi-create/#endpointConfiguration)

  # config.function.environment = {
  #   global_app_key1: "global_app_value1",
  #   global_app_key2: "global_app_value2",
  # }
  # More examples:
  # config.function.dead_letter_config = { target_arn: "arn" }
  # config.function.vpc_config = {
  #   security_group_ids: %w[sg-1 sg-2],
  #   subnet_ids: %w[subnet-1 subnet-2],
  # }
  # The config.function settings to the CloudFormation Lambda Function properties.
  # http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-function.html
  # Underscored format can be used for keys to make it look more ruby-ish.

  # Assets settings
  # The config.assets.folders are folders within the public folder that will be set
  # to public-read on s3 and served directly. IE: public/assets public/images public/packs
  # config.assets.folders = %w[assets images packs]
  # config.assets.max_age = 3600 # when to expire assets
  # config.assets.cache_control = nil # IE: "public, max-age=3600" # override max_age for more fine-grain control.
  # config.assets.base_url = nil # IE: https://cloudfront.com/my/base/path, defaults to the s3 bucket url
  #                                IE: https://s3-us-west-2.amazonaws.com/demo-dev-s3bucket-1inlzkvujq8zb

  # config.api.endpoint_type = 'PRIVATE' # Default is 'EDGE' https://amzn.to/2r0Iu2L
  # config.api.authorization_type = "AWS_IAM" # default is 'NONE' https://amzn.to/2qZ7zLh

  # More info: http://rubyonjets.com/docs/routing/custom-domain/
  # config.domain.name = 'api.pongdang.be'
  # config.domain.hosted_zone_name = 'pongdang.be'
  # config.domain.cert_arn = ENV['ROUTE53_CERT_ARN']
  # config.domain.endpoint_type = "EDGE"

  # By default logger needs to log to $stderr for CloudWatch to receive Lambda messages, but for
  # local testing environment you may want to log these messages to 'test.log' file to keep your
  # testing suite output readable.
  # config.logger = Jets::Logger.new($strerr)
  config.controllers.default_protect_from_forgery = false

  # Redis settings
  $redis = ConnectionPool.new(size: 5, timeout: 5) do
    Redis.new(host: ENV['REDIS_HOST'],
              port: ENV['REDIS_PORT'],
              db: ENV['REDIS_DB'],
              password: ENV['REDIS_PASSWORD'])
  end
end
