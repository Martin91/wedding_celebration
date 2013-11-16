# encoding: utf-8

ActiveAdmin.register Blessing do
  menu label: "祝福"

  index do
    selectable_column
    column "小老", :editor
    column "祝福" do |blessing|
      raw blessing.content
    end
    column "留言时间", :created_at
    column "更新时间", :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :editor
      row :content do
        raw blessing.content
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :editor, label: "留言人姓名"
      f.input :content, as: :html_editor, label: "留下您的祝福"
    end

    f.buttons
  end
end
