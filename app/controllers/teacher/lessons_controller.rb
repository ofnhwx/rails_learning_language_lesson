class Teacher::LessonsController < Teacher::ApplicationController
  before_action :set_lesson, only: %i[show edit update destroy]

  def index
    @lessons = current_teacher.lessons.default_order
  end

  def show; end

  def new
    @lesson = current_teacher.lessons.build
  end

  def create
    @lesson = current_teacher.lessons.build(lesson_params)
    if @lesson.save
      redirect_to teacher_lesson_path(@lesson), notice: 'レッスンを登録しました'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to teacher_lesson_path(@lesson), notice: 'レッスンを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @lesson.destroy!
    redirect_to teacher_lessons_path, notice: 'レッスンを削除しました'
  end

  private

  def set_lesson
    @lesson = current_teacher.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson)
          .permit(:started_at, :zoom_url, :language_id)
  end
end
