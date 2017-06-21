class StudentsController < ApplicationController

  #show all students
  get '/students' do
    if logged_in?
      erb :'/students/students'
    else
      redirect to '/'
    end
  end

  #create new student
  get '/students/new' do
    if logged_in?
      erb :'/students/new_student'
    else
      redirect to '/'
    end
  end

  #post route for a new student
  post '/students/new' do
    if !params[:student][:name].empty?
      binding.pry
      @student = Student.create(params[:student])
      @student.save
      redirect to "/students/#{@student.slug}"
    else
      redirect to '/students/new'
    end
  end

  #show single students
  get '/students/:slug' do
    if logged_in?
      @student = Student.find_by_slug(params[:slug])
      erb :'/students/show_student'
    else
      redirect to '/'
    end
  end


  #post route for an edited student
  post '/students/:slug' do
    @student = Student.find_by_slug(params[:slug])
    if params[:student][:name].empty?
      redirect to "/students/#{@student.slug}/edit"
    else
      @student.update(params[:student])
      @student.save
      redirect to "/students/#{@student.slug}"
    end
  end

  #edit single student
  get '/students/:slug/edit' do
    if logged_in?
      #only allow if instructor to edit students
      @student = Student.find_by_slug(params[:slug])
      erb :'/students/edit_student'
    else
      redirect to '/'
    end
  end

  #delete student
  get '/tweets/:slug/delete' do
    if logged_in?
      @student = Student.find_by_slug(params[:slug])
      #check if user is Instructor
      @student.delete
      redirect to '/students'
    else
      redirect to '/'
    end
  end
end
