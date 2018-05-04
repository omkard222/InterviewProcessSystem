class InterviewInfoMailer < ApplicationMailer




    default from: "from@example.com"

    def candidate_information(scheduler)

     @scheduler = scheduler
     attachments['Candidate Resume'] = File.read(scheduler.candidate.resume.file.path)
     mail(to: @scheduler.user.email, subject: 'InterviewInfo')
    end


end
