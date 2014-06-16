if Rails.env.production?
  wkhtmltopdf_path = 'wkhtmltopdf-x86/wkhtmltopdf-i386'
else
	if RUBY_PLATFORM =~ /linux/	
		wkhtmltopdf_path = 'wkhtmltopdf-x86/wkhtmltopdf-i386'
	elsif RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
		wkhtmltopdf_path = 'wkhtmltopdf-win/bin/wkhtmltopdf.exe'
	else		
		raise "Unsupported. Unknown OS."
	end
end

WickedPdf.config = {
	#:wkhtmltopdf => Rails.root.join('vendor', wkhtmltopdf_path).to_s,
	
	# If running on WINDOWS, uncomment below.
    #:exe_path => Rails.root.join('vendor', wkhtmltopdf_path).to_s
}