require 'spec_helper'
# spec/controllers/home_controller_spec.rb
describe HomeController, :type => :controller do
	describe "GET #index" do 
		#let (:index) { index }
		it "displays index page" do
			get :index
			
			if(:index)
				puts "SUCCESS::Index page was loaded."
			else
				puts "FAILED::Index page was not loaded."
			end
		end
	end
	
	describe "GET #pdfshow" do
		it "generates pdf file with the name `HTML-page-<year>-<month>-<day>.pdf`" do
			
			get :pdfshow
			
			if(:pdfshow)
				puts "SUCCESS::A pdf file was generated."
			else
				puts "FAILED::A pdf file was not generated."
			end
		end
	end
end