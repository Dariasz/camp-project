class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    render layout: false
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(last_name: :asc).page(params[:page]).per(12).uniq
  end

  def show
    @user = current_user
    @my_editions = @user.editions
    @my_solutions = @user.solutions
    # @my_activities
    # @my_feedbacks
    # @received_feedbacks
  end

  def new; end

  def edit; end

  def create
    @user.save
    respond_with(@user, location: [:admin, :users])
  end

  def update
    @user.update(user_params)
    respond_with(@user, location: [:admin, :users])
  end

  def destroy
    @user.destroy
    respond_with(@user, location: [:admin, :users])
  end

  def others
    @q = User.where(role: "Camper").ransack(params[:q])
    @users = @q.result(distinct: true).order(last_name: :asc).page(params[:page]).per(12).uniq
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :username, :password, :email, :nationality, :avatar, :age)
  end
end
