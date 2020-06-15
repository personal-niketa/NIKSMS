module ExamsHelper

  def get_class_name(class_id)
    school_class = ' '
    school_class = SchoolClass.find_by_id(class_id).class_name
  end

  def get_batch_name(batch_id)
    batch_name = ' '
    batch_name = Batch.find_by_id(batch_id).batch_name
  end

end
