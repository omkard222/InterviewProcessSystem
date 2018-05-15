class InterviewInfoMailer < ApplicationMailer




    default from: "from@example.com"

    def candidate_information(scheduler)

     @scheduler = scheduler
     attachments['Candidate Resume'] = File.read(scheduler.candidate.resume.file.path)
    attachments.inline['ig-logo.png'] = File.read("#{Rails.root}/app/assets/images/ig-logo.png")
     mail(to: @scheduler.user.email, subject: 'Interview Details')
    end


end
