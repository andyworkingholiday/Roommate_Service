class MypageController < ApplicationController
  
  #마이페이지 첫화면
  def index
    @u_info = UserInfo.all
    
    @user = User.all
    
    @m_propose = Propose.where(:user_id => current_user.id)
    
    @other_propose = Propose.where(:other_id => current_user.id)
    #@chat = Conversation.all
      
     # if  @chat.where(:sender_id => current_user.id).take.nil?
         # @chat1=[]
      #else 
       #   @chat1 = @chat.where(:sender_id => current_user.id)
      #end
      
      #if @chat.where(:recipient_id => current_user.id).take.nil?
       #   @chat2=[]
      #else 
       #   @chat2 = @chat.where(:recipient_id => current_user.id)
      #end 
  end
  
  #여기서 create로 넘어감
  def type_index
  end
  
    #회원가입하면서 처음 넘어갈 때 성향 저장하는 곳
  def create
    something = UserInfo.where(:user_id => current_user.id).take
    something.aa = params[:a]
    something.ab = params[:b]
    something.ac = params[:c]
    something.ad = params[:d]
    something.one_time = true
    something.save
    redirect_to "/mypage/type_index2"
  end
  #처음 상황에따른 유형검사
  def type_index2
  end
  #처음 상황에따른 유형검사 create하는 곳
  def create2
    something = UserInfo.where(:user_id => current_user.id).take
    
    something.one_time = true
    something.save
    redirect_to "/mypage/index/#{current_user.id}"
  end
  
  
  #유형검사 수정, 타입 업데이트로 넘어감
  def type_edit
    
  end
  #나중에 성향 수정하는 거
  def type_update
    something = UserInfo.where(:user_id => current_user.id).take
    something.aa = params[:a]
    something.ab = params[:b]
    something.ac = params[:c]
    something.ad = params[:d]
    something.save
    redirect_to "/mypage/type_edit2"
    
  end
  #상황에 따른 유형검사 수정, 타입 업데이트2로 넘어감
  def type_edit2
    
  end
  
  #ㅅ수정함
  def type_update2
    something = UserInfo.where(:user_id => current_user.id).take
    something.aa = params[:a]
    something.save
    redirect_to "/mypage/index/#{current_user.id}"
    
  end
  
  
  
  

  
  def profile
    # parsed_db = Noticetitle.where("link" => each_notice.link).take
    newimage = User.where(:id => current_user.id).take
    newimage.image = params[:image]
    newimage.save
    # Post.create(content: params[:content].
    #                     image: params[:image])
    redirect_to :back
  end
  
  #기본적인 인적사항 입력하는 창
  def core_index
    
  end
  # 기본 인적사항 생성하는 거 
  def core_create
    corenew = UserInfo.new
    corenew.user_id = current_user.id
    corenew.gender = params[:gender]
    corenew.age = params[:age]
    corenew.school_name = params[:school]
    corenew.save
    redirect_to '/main/home'
    
  end
  # 기본 인적사항 업뎃
  def core_update
    
  end
  
  # 업뎃 넘어간다.
  def core_edit
    coreedit = UserInfo.where(:user_id => current_user.id).take
    coreedit.gender = params[:gender]
    coreedit.age = params[:age]
    coreedit.school_name = params[:school]
    coreedit.save
    redirect_to "/mypage/index/#{current_user.id}"
  
  end
  
 #룸메 신청 관련 액션
  def my_propose
        @user = User.all
        @u_info = UserInfo.all
           
        if Propose.where(:user_id => current_user.id) == nil
            @nothing = "등록한 룸메이트가 없습니다."
        else
            @m_propose = Propose.where(:user_id => current_user.id)
        end
      respond_to do |format|
          format.js
      end
      
  end
  
  
  def propose_cancel
    
      one_cancel = Propose.where(:user_id => current_user.id, :other_id => params[:other_id]).take
      one_cancel.destroy

       redirect_to :back
  end
  
  def other_propose
      @user = User.all
      @u_info = UserInfo.all
      
      @other_propose = Propose.where(:other_id => current_user.id)
      
      respond_to do |format|
          #format.html { redirect_to "/mypage/index/#{current_user.id}" }
          format.js
      end
  end
  
  def propose_reject
      one_reject = Propose.where(:user_id => params[:user_id], :other_id => current_user.id).take
      one_reject.destroy
      redirect_to :back
  end
  
  def propose_success
      one_success = Propose.where(:user_id => params[:user_id], :other_id => current_user.id).take
      one_success.okay = true
      one_success.save
      redirect_to :back
  end
  
  
  def all_chat
    @u_info = UserInfo.all
    @school_info = School.all
    @user = User.all
    
    @chat = Conversation.all
      
      if  @chat.where(:sender_id => current_user.id).take.nil?
          @chat1=[]
      else 
          @chat1 = @chat.where(:sender_id => current_user.id)
      end
      
      if @chat.where(:recipient_id => current_user.id).take.nil?
          @chat2=[]
      else 
          @chat2 = @chat.where(:recipient_id => current_user.id)
      end 
      
      respond_to do |format|
          #format.html { redirect_to "/mypage/index/#{current_user.id}" }
          format.js
      end
  end
  
    
    
    
  def chat
     @users = User.where(:id => params[:user_id]).take
      
      
         if Conversation.between(current_user.id, params[:user_id]).present?
         
            @conversation = Conversation.between(current_user.id, params[:user_id]).take
            @messages = @conversation.messages 
            @messages1 = @messages.where(:user_id => current_user.id)
            @messages2 = @messages.where(:user_id => params[:user_id])
         else 
            @messages1 = []
            @messages2 = []
         end 
            
         #else
          #  @conversation = Conversation.new
           # @conversation.sender_id = current_user.id
           # @conversation.recipient_id = @users.id 
            #@conversation.save
         #end
      #@conversation = Conversation.between(current_user.id, params[:user_id]).take
      #@id = Conversation.between(current_user.id, params[:user_id]).take.id
      #@message = Message.where(:message_id => @id).take
      #@message = @conversation.messages.new(message_params)
      #@message.body = params[:body]
      
      #@messages = @conversation.messages
      
      #@messages1 = @messages.where(:user_id => current_user.id)
      #@messages2 = @messages.where(:user_id => params[:user_id])
      
            
      
           
  end
 
    
    
  def message
     
         @users = User.where(:id => params[:user_id]).take
         
          # if Conversation.all.where('(sender_id = ? AND  recipient_id= ?) OR (sender_id = ? AND  recipient_id= ?)' , current_user.id, params[:user_id], params[:user_id], current_user.id).nil?
           #where('(conversations.sender_id = ? AND  conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)', sender_id,recipient_id, recipient_id, sender_id)
           #if Conversation.nil?
             # @conversations = Conversation.new 
             # @conversations.sender_id = current_user.id
             # @conversations.recipient_id = @users.id
             # @conversations.save
          # else 
             # @result = Conversation.all.where('(sender_id = ? AND  recipient_id= ?) OR (sender_id = ? AND  recipient_id= ?)', current_user.id, params[:user_id], params[:user_id], current_user.id).take
           #end 
         #redirect_to "/conversation"
         if Conversation.between(current_user.id, params[:user_id]).present?
         
            @conversation = Conversation.between(current_user.id, params[:user_id]).first
             
         else
            @conversation = Conversation.new
            @conversation.sender_id = current_user.id
            @conversation.recipient_id = @users.id 
            @conversation.save
         end
         
         @conversation = Conversation.between(current_user.id, params[:user_id]).take
         
             @message = @conversation.messages.new(message_params)
             @message.body = params[:body]
             @message.user_id = current_user.id
             @message.save
             
             @messages = @conversation.messages
             
             #"orders_count = ?", params[:orders]
            
            
            @messages1 = @messages.where(:user_id => current_user.id)
            
            
            
            @messages2 = @messages.where(:user_id => params[:user_id])
            
         redirect_to "/chat/#{current_user.id}"    
          
          
         
  end
  
  def receipt
      
      if Conversation.between(current_user.id, params[:user_id]).present?
         
            @conversation = Conversation.between(current_user.id, params[:user_id]).first
            @messages = @conversation.messages
            @receipt = @messages.where(:user_id => params[:user_id]).take 
         else
            @receipt = []
      end
     
      
      respond_to do |format|
            #format.html { redirect_to upload_create_paths }
            format.js
      end
  end 
  
  def sendmessage
      
      if Conversation.between(current_user.id, params[:user_id]).present?
         
            @conversation = Conversation.between(current_user.id, params[:user_id]).first
            @messages = @conversation.messages
            @send = @messages.where(:user_id => current_user.id).take 
         else
            @send = []
      end
      
      
      respond_to do |format|
            #format.html { redirect_to upload_create_paths }
            format.js
      end
  end
  
  private
     
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
    
    def message_params
      params.permit(:body, :user_id)
    end
    
end
