ActiveAdmin.register Product do

  ####<$ Scope List $>####
  scope :all, :default => true

  scope :published do |products|
    products.where('is_published  =?', true)
  end

  permit_params :category_id, :name, :description, :image, :price, :available_start_date, :available_end_date


  index do
    selectable_column
    column auto_link :name
    column 'Image' do |product|
      image_tag(product.image_url(:list)) if product.image.present?
    end
    column :price
    column :available_start_date
    column :available_end_date
    column :is_published
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :available_start_date
      row :available_end_date
      row 'Image' do |product|
        image_tag(product.image_url(:list)) if product.image.present?
      end
      row :is_published
      row :created_at
    end
  end

  # Product Form
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :available_start_date
      f.input :available_end_date
      f.input :is_published
      f.input :image, as: :file, :hint => image_tag(f.object.image.url(:list))
      f.actions
    end
  end

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row('Total Sold')  { Order.find_with_product(resource).count }
      row('Value'){ Order.find_with_product(resource).sum(:total) }
    end
  end

  sidebar :recent_orders, :only => :show do
    Order.find_with_product(resource).limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag('br')).html_safe
  end


  ####<$ filter options $>####
  filter :name, as: :string
  filter :is_published, as: :radio


end
