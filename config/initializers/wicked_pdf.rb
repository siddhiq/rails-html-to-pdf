if Rails.env.production?
  #wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  puts "================ Running on Production ================"
  wkhtmltopdf_path = 'wkhtmltopdf-x86/wkhtmltopdf-i386'
else
  # Linux (check your processor for Intel x86 or AMD x64)
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-i386"
  # OS X
  #wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf"            
  # Windows
  # wkhtmltopdf_path = 'C:\Program Files/wkhtmltopdf/wkhtmltopdf.exe'
  
	if RUBY_PLATFORM =~ /linux/
		puts "================ Running on LINUX ================"
	
		wkhtmltopdf_path = 'wkhtmltopdf-x86/wkhtmltopdf-i386'
	elsif RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
		puts "================ Running on WIN ================"
	
		wkhtmltopdf_path = 'wkhtmltopdf-win/bin/wkhtmltopdf.exe'
	else
		puts "================ Running on UNKnown ================"
		
		raise "Unsupported. Unknown OS."
	end
end

WickedPdf.config = {
	#:wkhtmltopdf => Rails.root.join('vendor', wkhtmltopdf_path).to_s,
    #:exe_path => Rails.root.join('vendor', wkhtmltopdf_path).to_s
}