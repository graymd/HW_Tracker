Planning:

6 FEB 2015:

Requirements:

-User authentication to control homework submissions

-user will submit many hw assignments

-format of data will be based on TIY location

-able to make as many TIY locations as want

-able to create as many locations as want

-user should be able to select multiple locations/cohorts when signing up.

-instructor/TA needs to sign up;

-instructor/TA will have to select locations/cohorts

-Should be an admin interface.

-admin can make pre-existing user admin

-when instructor/TA views cohort, be able to see all students and hw's for the cohorts they are assigned to.

-when instructor/TA opens HW assignment should be able to vew the comments stream and add whatever deems necessary.

-If student views cohort should only see HW assignment only - not submission. see gem cancan  
-instructor/TA able to create new HW assignments.

-students submit to that specific HW assignment

-students can only submit ONCE.

-students can edit their submissions.

-student can fill out all necessary information as well as add any links deemed necessary

-student can edit if requires additional info.

-only instructor has the ability to change workflow state

-when viewing the hw assignment or submission, should be a comment stream.

-student and instructor can communicate with comment stream.

-students should be able to make general comments for all others to see.

-when comment is created an email needs to be sent to opposite user.  if instructor posts message in HW all users should receive email.  If instructor posts to students hw, student should get email.  vice versa.  email must contain comment.








gems required:
-https://github.com/ryanb/cancan
-https://github.com/ryanb/nested_form
-https://coderwall.com/p/qwx3qa
-devise
haml-rails




