class UsersController < ApplicationController
	skip_before_filter :require_user, :only => [:new, :create]
  skip_before_filter :admin_check, :except => [:index, :addCourse, :removeCourse]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def classmates
    userCourses = User.find(session[:user_id]).courses
    userPeers = User.all

    userPeers = userPeers.clear

    userCourses.each do |course|
      course.users.each do |user|
        userPeers.push(user) unless userPeers.include?(user)
      end
    end

    @users = userPeers

    @partialIndicator = "classmates"
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.role = "student"

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id

        format.html { redirect_to courses_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def addCourse
    @user = User.find(params[:user])
    course = Course.find(params[:course])

    @user.courses << course unless course.users.include?(@user)

    redirect_to addStudents_course_path(course)
  end

  def removeCourse
    @user = User.find(params[:user])
    course = Course.find(params[:course])

    @user.courses.delete(course) if course.users.include?(@user)

    redirect_to addStudents_course_path(course)
  end
end
