class HomeController < ApplicationController
	# Index page
	#
	# @param request [Request] the request object
	# @return [String] the resulting webpage
	def index
		
	end
  
	# Generates pdf file from index html
	#
	# @param request [Request] the request object
	# @return [String] the object converted into the pdf format.
	def pdfshow
		time = Time.now
		file_name =  "HTML-page-" + time.year.to_s + "-" + time.month.to_s + "-" + time.day.to_s + ".pdf"
		
		html = render_to_string(:action => :index) 
		pdf = WickedPdf.new.pdf_from_string(html) 
		send_data(pdf, 
			:filename    => file_name, 
			:disposition => 'attachment') 
	

	end
	
	# Generates pdf file from string
	#
	# @param request [Request] the request object
	# @return [String] the object converted into the pdf format.
	def pdfme
		pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
		
		time = Time.now
		
		file_name = "Sample-" + time.year.to_s + "-" + time.month.to_s + "-" + time.day.to_s + ".pdf"
		
		#save to /public dir
		save_path = Rails.root.join('public', file_name)
		File.open(save_path, 'wb') do |file|
			file << pdf
		end
		
		send_file "#{Rails.root}/public/" + file_name, :type=>"application/pdf", :x_sendfile=>true
	end
end
