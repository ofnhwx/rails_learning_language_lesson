class Admin::TeachersController < Admin::ApplicationController
  before_action :set_teacher, only: %i[edit update destroy masquerade]

  def index
    @teachers = Teacher.default_order.decorate
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teachers_path, notice: "講師「#{@teacher.name}」を登録しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teachers_path, notice: "講師「#{@teacher.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy!
    redirect_to admin_teachers_path, notice: "講師「#{@teacher.name}」を削除しました"
  end

  def masquerade
    bypass_sign_in(@teacher)
    redirect_to teacher_root_path, notice: "「#{@teacher.name}」としてログインしました"
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher)
          .permit(:image, :name, :profile, :email, :password, :password_confirmation, language_ids: [])
  end
end
