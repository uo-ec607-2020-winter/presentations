#'GPA Needed Function
#'
#'This function determines the minimum term GPA a student needs to get in order to ensure that their cumulative GPA meets
#'some goal at the end of the term. If the cumulative GPA goal is unreachable in one term, the function returns a message
#'to that effect
#'@param current_gpa The student's current cumulative GPA
#'@param gpa_wanted The cumulative GPA goal for the end of the term
#'@param terms The number of terms the student has been in college. This includes the current term
#'@param plusminus Whether or not the grading scale is the normal plus/minus scale
#'@export
#'@examples
#'

gpa_needed=function(current_gpa,gpa_wanted,terms, plusminus=T){
  gpa_needed_primitive=gpa_wanted*terms-(current_gpa*(terms-1))
  if (plusminus==T){
    answer=ifelse(gpa_needed_primitive>4.3, "Not possible this term", gpa_needed_primitive)
  } else{
    answer=ifelse(gpa_needed_primitive>4, "Not possible this term", gpa_needed_primitive)
  }
  return(answer)
}
