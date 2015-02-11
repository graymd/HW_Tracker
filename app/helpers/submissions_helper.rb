module SubmissionsHelper

  def workflow_state_helper(submission)
    if submission.workflow_state == "new"
      "New submission"
    elsif submission.workflow_state == "reviewing"
      "Reviewing Submission"
    elsif submission.workflow_state == "completed"
      "Completed submission"
    elsif submission.workflow_state == "incompleted"
      "Incomplete submission"
    end
  end



end
