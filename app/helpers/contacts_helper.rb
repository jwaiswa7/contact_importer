module ContactsHelper

  def decrypt_credit_card(credit_card)
  	encryption_key = "ee3f718c0acbba82d7113cf07c6064f4670641243e1005d3d0b86d7fb208e2e9"

    cryptor = ActiveSupport::MessageEncryptor.new(encryption_key[0..31], encryption_key)

    "...#{cryptor.decrypt_and_verify(credit_card).last(4)}"
  end
end
