# encoding: utf-8

ActiveAdmin.register Blessing do
  form do |f|
    f.inputs do
      f.input :editor, label: "留言人姓名"
      f.input :content, as: :html_editor, label: "留下您的祝福"
    end

    f.buttons
  end
end
