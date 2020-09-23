class MainController < ApplicationController
    #메인화면
    
    def home
        
    end
    #방이 있는 사람이 룸메이트 찾는 거
    def haveroom
   
  
        # @search = UserInfo.where("aa LIKE ?", "%#{params[:search]}%")
        # @user = User.all
        # @allsearch = UserInfo.all
        
    #   @posts = Model.all
    #   @books = Book.all
    #else
    #  @posts = Model.where("title LIKE ?", "%#{params[:query]}%")
    # end
        @user = User.all
        @users = User.where(:id => params[:user_id]).take
        @serach = UserInfo.all
        
        if params[:search]
            @search = UserInfo.search(params[:search]).order("created_at DESC")
        else
            @search = UserInfo.all.order(("created_at DESC"))
        end
    end
    #방이 없는 사람이 방을 찾는 거
    def nhaveroom
    end
    #기숙사 룸메 찾는 거 
    
    def school
        @user = User.all
        @u_info = UserInfo.all
        @select  = @u_info.where('school_name = ? AND gender = ? AND age >= ? AND age <= ?', params[:school], params[:gender], params[:minage], params[:maxage])
    end
    
    #작성한 글 올리고, 내리고
    def expose
        something = UserInfo.where(:user_id => current_user.id).take
        something.category = params[:category]
        something.expose = true
        something.save
        redirect_to "/main/school"
    end
    
    def un_expose
        something = UserInfo.where(:user_id => current_user.id).take 
        something.expose = false
        something.save
        redirect_to "/main/school"
    end
    
    def propose
        new_propose = Propose.new
        # 룸메 신청 숫자 제한되게 만들어야함
        new_propose.user_id = current_user.id
        new_propose.other_id = params[:other_id]
        new_propose.save
        redirect_to :back
    end
    
    #확인 버튼 누르면 자세한 정보 뜨는 것
    def detail_button
        @detail_id = params[:detail_id]
        @user = User.all
        @u_info = UserInfo.all
        @comment = Comment.all
    end
    
    def comment_create
        one_comment = Comment.create(content: params[:content], user_id: current_user.id)
        redirect_to :back
    end
    
    def destroy
        one_comment = Comment.find(params[:id])
        one_comment.destroy 
        redirect_to :back
    end
        
        # @select = Array.new
        # unless UserInfo.where("gender LIKE ?", "%#{params[:gender]}%").nil?
        #     g_search = UserInfo.where("gender LIKE ?", "%#{params[:gender]}%")     
        #         g_search.each do |y|
        #             if y.school_name = params[:school]
        #                 @select.push(y)
        #             end
        #         end
        # end
        
          
        # if params[:gender] == "남성"
        #     u_id = @user.where(:gender => "남성").take.id
            
        #     search(@u_info.where(:user_id => u_id).take.school_name).order("created_at DESC")
            
        #     UserInfo.where("school_name LIKE ?", "%#{params[:school]}%")
        
        #  unless UserInfo.where("school_name LIKE ?", "%#{params[:school]}%").nil? && User.where("gender LIKE ?", "%#{params[:gender]}%").nil?
        #     @select = UserInfo.search(params[:school]).order("created_at DESC")
        #  end
         
      
            
            
        #스쿨로 한 번 돌리고 그중에서 gender가 특정인 놈 찾는 쪽으로 코드 짜기
        # unless School.where("school_name LIKE ?", "%#{params[:school]}%").nil?
        # s_search = School.where("school_name LIKE ?", "%#{params[:school]}%")
        #     s_search.each do |meet|
        #         if @user.where(:id => meet.user_id).take.gender == params[:gender]
        #             @rselect = meet
        #         end
        #     end
        # end
        #         #s_Search의 gender가 params[:gnerder이냐?]
        #         @user.where(:gender => params[:gender])
        #  unless School.where("school_name LIKE ?", "%#{params[:school]}%").nil? && User.where("gender LIKE ?", "%#{params[:gender]}%").nil?
        #     @select = School.search(params[:school]).order("created_at DESC")
        #  end
            
        # @select = UserInfo.search(params[:school]).order("created_at DESC") && User.search(params[:gender]).order("created_at DESC") 
    
        
        # @select = UserInfo.where(:school_name => params[:school]).take


    
#     def index
#   @recipes = Recipe.all
#   if params[:search]
#     @recipes = Recipe.search(params[:search]).order("created_at DESC")
#   else
#     @recipes = Recipe.all.order("created_at DESC")
#   end
# end
   
end
