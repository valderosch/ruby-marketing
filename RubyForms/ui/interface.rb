require 'tk'

class RFormsController
  def initialize
    @root = TkRoot.new { title "RForms Controller" }
    @root.width = 1280
    @root.height = 720
    @root.resizable(false, false)

    @frame = TkFrame.new(@root) { background 'white' }.place(relx: 0, rely: 0, relwidth: 1, relheight: 1)

    buttons = ["Bot", "Stats", "Input Data", "Output Data", "Clients"]
    buttons.each_with_index do |button_name, index|
      TkButton.new(@frame) do
        text button_name
        command proc { change_content(button_name) }
      end.place(relx: 0.1 + (index * 0.15), rely: 0.05, relwidth: 0.1, relheight: 0.1)
    end

    TkButton.new(@root) do
      text "Exit"
      command proc { exit }
    end.place(relx: 0.85, rely: 0.05, relwidth: 0.1, relheight: 0.1)
  end

  def change_content(content)
    @content_frame.destroy if defined? @content_frame
    @content_frame = TkFrame.new(@root) { background 'white' }.place(relx: 0.1, rely: 0.2, relwidth: 0.8, relheight: 0.7)

    case content
    when "Bot"
      TkLabel.new(@content_frame) { text "Запуск певного файлу" }.place(relx: 0.1, rely: 0.1, relwidth: 0.8, relheight: 0.1)
    when "Stats"
      TkLabel.new(@content_frame) { text "Статистика" }.place(relx: 0.1, rely: 0.1, relwidth: 0.8, relheight: 0.1)
    when "Input Data"
      TkLabel.new(@content_frame) { text "Вхідні данні" }.place(relx: 0.1, rely: 0.1, relwidth: 0.8, relheight: 0.1)
    when "Output Data"
      TkLabel.new(@content_frame) { text "Вихідні данні" }.place(relx: 0.1, rely: 0.1, relwidth: 0.8, relheight: 0.1)
    when "Clients"
      TkLabel.new(@content_frame) { text "База клієнтів" }.place(relx: 0.1, rely: 0.1, relwidth: 0.8, relheight: 0.1)
    end
  end

  def run
    Tk.mainloop
  end
end

RFormsController.new.run