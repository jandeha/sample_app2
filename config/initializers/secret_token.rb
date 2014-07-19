# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# SampleApp::Application.config.secret_key_base = '190fe2410b56e0945d682277d7cd512f9b42f7032d37d5d0764175787f8fde7f33d81829f80f6dc594ef26f927e2457918ca9ae96d47c8adb7a3d9abc9b2e3fa'

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        # Use the existing token.
        File.read(token_file).chomp
    else
        # Generate a new token and store it in token_file
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

SampleApp::Application.config.secret_key_base = secure_token
