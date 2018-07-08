if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_4ml0acn7JHHVksBQetzoI6Cc',
    secret_key: 'ssk_test_PbBq396PijKrrUfLV5RdGita'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
