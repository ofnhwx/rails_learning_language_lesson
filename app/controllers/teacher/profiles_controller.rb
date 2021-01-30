class Teacher::ProfilesController < Teacher::ApplicationController
  before_action :set_teacher

  def edit; end

  def update
    if @teacher.update(teacher_params)
      redirect_to edit_teacher_profile_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private

  def set_teacher
    @teacher = current_teacher
  end

  def teacher_params
    params.require(:teacher)
          .permit(:image, :name, :profile, language_ids: [])
  end
end
