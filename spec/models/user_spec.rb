require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        user = build(:user)
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "is valid with a family_name, first_name, family_name_kana,first_name_kana" do
        @user = User.new(
          family_name:" ",
          first_name: " ",
          family_name_kana:" ",
          first_name_kana: " ",
         )
        expect(user).to be_valid
      end  
        it "誕生日が記入されていれば登録できる" do
        @user.birthday = 2000/01/01
        expect(@user).to be_valid
      end 
    end

    # context '新規登録がうまくいかないとき' do
    #   it "nicknameが空だと登録できない" do
    #     @user.nickname = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    #   end
    #   it "emailが空では登録できない" do
    #     @user.email = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("E-mail cant't be blank")
    #   end
    #   it "重複したemailが存在する場合登録できない" do
    #     @user.save
    #     another_user = FactoryBot.build(:user)
    #     another_user.email = @user.email
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include("Email has already been taken")
    #   end
    #   it "passwordが空では登録できない" do
    #     @user.password = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("password cant't be blank")
    #   end
    #   it "passwordが5文字以下であれば登録できない" do
    #     @user.password = "00000"
    #     @user.password_confirmation = "00000"
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("(Password is too short(minium is 6 characters)")
    #   end
    #   it "passwordが存在してもpassword_confirmationが空では登録できない" do
    #     @user.password_confirmation = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("(password_confirmation  doesn't match Password")
    #   end
    #   it "苗字・名前が空では登録できない"
    #     @user.family_name = " "
    #     @user.first_name  = " "
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include(" family_name or first_name  cant't be blank")
    #   end
    #   it "苗字・名前(カナ)が空では登録できない"
    #     @user.family_name_kana = " "
    #     @user.first_name_kana, = " "
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include(" family_name_kana or first_name_kana  cant't be blank")
    #   end

    #   it "誕生日が空では登録できない"do
    #    @user.birthday = " "
    #    @user.valid?
    #    expect(@user.errors.full_messages).to include(" birthday  cant't be blank")
    #   end 
    # end
  end
end       