############################require 'highlight'

#TODO - Autosave functionality
def open_file filename
  file = File.open filename, 'r'
  #Create new window
  window title: File.basename(filename), width: 500, height: 500, resizable: false do
    background black
    #Create buttons
    @save = button "Save File"
    @close = button "Close file" 
    #Create text field
    text_area = edit_box File.read(file), margin: 2, width: 500, height: 470 do
      ####################highlight
      @close.click do
        save_file File.absolute_path(file), text_area
        close
      end
    end
    #Handle button clicks
    @save.click do
      filename, saved = save_file File.absolute_path(file), text_area
      if saved
        close
        open_file File.basename(filename)
      end
    end
    @close.click do
      close
    end
  end
end


def save_file filename, text_area
  if confirm "Do you want to save changes to #{File.basename(File.open(filename, 'r'))}?"
    if File.basename(File.open filename, 'r') == "Untitled"
      filename = ask_save_file
    end
    File.open(filename, 'w+') do |f|
      f.write text_area.text
    end
    [filename, true]
  else
    [filename, false]
  end
end


Shoes.app title: "RubyDoo", width: 340, height: 100, resizable: false do
  background black..red
  every
  @f = flow do
    button "New File", left: 20, top: 35 do
      file = File.new("Untitled", 'w')
      open_file file.path
    end
    button "Open File", left: 130, top: 35 do
      filename = ask_open_file
      open_file filename
    end
    button "Quit", left: 250, top: 35 do
      close
    end
  end
end


#Make buttons for New, Open, Close file. Clicking these should execute a block that opens a file and loads its contents or closes the file.