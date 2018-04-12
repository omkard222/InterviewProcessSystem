class InterviewInfoMailer < ApplicationMailer




    default from: "from@example.com"

    def candidate_information(scheduler)

     @scheduler = scheduler

     mail(to: @scheduler.employee.emp_mail, subject: 'InterviewInfo')
    end


end
