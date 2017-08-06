//
//  ViewController.swift
//  Home Getter
//
//  Created by nicole ruduss on 06/08/2017.
//  Copyright © 2017 nicole ruduss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var hourText: UITextField!
    @IBOutlet weak var minuteText: UITextField!
    @IBOutlet weak var colonLabel: UILabel!
    
    // MARK: - Properties
    var customTimer: Timer!
    var selectedTime: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    @IBAction func setTimePressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        guard let hour = self.hourText.text,
            let minute = self.minuteText.text,
            let enteredTime = formatter.date(from: "\(hour):\(minute)") else {
            print("error with enteredTime")
            return
        }
        
        selectedTime = combineDateWithTime(Date(), time: enteredTime)
        customTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer() {
        colonLabel.isHidden = !colonLabel.isHidden
        guard let selectedTime = self.selectedTime else {
            return
        }
        
        if selectedTime.compare(Date()) == .orderedAscending {
            customTimer.invalidate()
            print("Stopping timer")
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        customTimer.invalidate()
    }
    
    func combineDateWithTime(_ date: Date, time: Date) -> Date? {
        let calendar = Calendar.current
        //calendar.timeZone = date.toTimeZone
        
        let dateComponents = (calendar as NSCalendar).components([.year, .month, .day], from: date)
        let timeComponents = (calendar as NSCalendar).components([.hour, .minute, .second], from: time)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year
        mergedComponments.month = dateComponents.month
        mergedComponments.day = dateComponents.day
        mergedComponments.hour = timeComponents.hour
        mergedComponments.minute = timeComponents.minute
        mergedComponments.second = timeComponents.second
        
        return calendar.date(from: mergedComponments)
    }
}

