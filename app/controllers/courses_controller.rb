class CoursesController < ApplicationController
    before_action :set_course , only: [:show, :edit, :update, :destroy]

    # GET /courses
    # GET /courses.json
    def index
        params_hash = params.to_enum.to_h
        if params_hash.length() < 3
            @courses = Course.all.includes(:school)
        else
            location_hash = params_hash.select{ |k,v| k.include? "location"}
            time_hash = params_hash.select{ |k,v| k.include? "time"}
            sort_hash = params_hash.select{ |k,v| k.include? "sort"}
            duration_hash = params_hash.select{ |k,v| k.include? "duration"}

            location_array = []
            location_hash.map{|k,v| location_array.push(k) }
            location_array = location_array.map { |e| e.to_s[9..-1] }.map { |e| e.prepend('%') }.map { |e| e << '%' }

            time_array = []
            time_hash.map{|k,v| time_array.push(k) }
            time_array = time_array.map { |e| e.to_s[5..-1] }.map { |e| e.prepend('%') }.map { |e| e << '%' }

            duration_array = []
            duration_hash.map{|k,v| duration_array.push(k) }
            duration_array = duration_array.map { |e| e.to_s[9..-1] }.map { |e| e.prepend('%') }.map { |e| e << '%' }

            # SQL query logic
            if location_array.length() == 0
                if time_array.length() == 0 
                    if duration_array.length() == 0
                        @courses = Course.all.includes(:school)
                    else
                        @courses = Course.includes(:school).joins(:school).where('LOWER(coursetag) LIKE ANY (array[?])', duration_array)
                    end
                else
                    if duration_array.length() == 0
                        @courses = Course.includes(:school).joins(:school).where('LOWER(coursetag) LIKE ANY (array[?])', time_array)
                    else
                        @courses = Course.includes(:school).joins(:school).where('LOWER(coursetag) LIKE ANY (array[?])', time_array).where('LOWER(coursetag) LIKE ANY (array[?])', duration_array)
                    end
                end
            else
                if time_array.length() == 0
                    if duration_array.length() == 0
                        @courses = Course.includes(:school).joins(:school).where('LOWER(schooltag) LIKE ANY (array[?])', location_array)
                    else
                        @courses = Course.includes(:school).joins(:school).where('LOWER(schooltag) LIKE ANY (array[?])', location_array).where('LOWER(coursetag) LIKE ANY (array[?])', duration_array)
                    end
                else
                    if duration_array.length() == 0
                        @courses = Course.includes(:school).joins(:school).where('LOWER(schooltag) LIKE ANY (array[?])', location_array).where('LOWER(coursetag) LIKE ANY (array[?])', time_array)
                    else
                        @courses = Course.includes(:school).joins(:school).where('LOWER(schooltag) LIKE ANY (array[?])', location_array).where('LOWER(coursetag) LIKE ANY (array[?])', time_array).where('LOWER(coursetag) LIKE ANY (array[?])', duration_array)
                    end
                end
            end

            unless sort_hash.empty?
                if sort_hash['sort'] == 'min'
                    puts 'min'
                    @courses = @courses.order('price')
                elsif sort_hash['sort'] == 'max'
                    puts 'max'
                    @courses = @courses.order('price DESC')
                end  
            end

        end
    end

    # GET /courses/1
    # GET /courses/1.json
    def show
    end

    # GET /courses/new
    def new
        @course = Course.new
    end

    # GET /courses/1/edit
    def edit
    end

    # POST /courses
    # POST /courses.json
    def create
        @course = Course.new(course_params)
        respond_to do |format|
            if @course.save
                format.html { redirect_to @course, notice: 'Course was successfully created.' }
                format.json { render :show, status: :created, location: @course }
            else
                format.html { render :new }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /courses/1
    # PATCH/PUT /courses/1.json
    def update
        respond_to do |format|
            if @course.update(course_params)
                format.html { redirect_to @course, notice: 'Course was successfully updated.' }
                format.json { render :show, status: :ok, location: @course }
            else
                format.html { render :edit }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
        @course.destroy
        respond_to do |format|
            format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_course
            @course = Course.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def course_params
            myParams = params.require(:course).permit(:name, :price, :specialprice, :specialdue, :description, :admintext, :school)
            myParams[:school] = School.find(myParams[:school])
            myParams
        end
end
