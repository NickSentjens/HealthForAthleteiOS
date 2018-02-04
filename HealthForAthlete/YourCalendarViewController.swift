//
//  SchedulesViewController.swift
//  HealthForAthlete
//
//  Created by Nick Sentjens on 2017-03-30.
//  Copyright © 2017 NickSentjens. All rights reserved.
//

import UIKit
import JTAppleCalendar

class YourCalendarViewController: UIViewController, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource, UITableViewDelegate, UITableViewDataSource {
    let nandoRed: UIColor = UIColor(colorLiteralRed: 188/255, green: 23/255, blue: 23/255, alpha: 1.0)
    let lightRed: UIColor = UIColor(colorLiteralRed: 247/255, green: 212/255, blue: 216/255, alpha: 1.0)
    
    let formatter = DateFormatter()
    
    @IBOutlet weak var schedulesNavigationBar: UINavigationBar!
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var dateAndYearView: UIView!

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var warningIcon: UIImageView!
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var warningView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedDates: [Date] = []
    
    var calendarGradient: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        schedulesNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName: nandoRed]
        setUpGradients()
        addBorders()
        setUpFirstDate()
        selectedDates = []
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.contentSize.height = 500
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        calendarGradient?.frame = calendarView.bounds
        calendarView.layer.insertSublayer(calendarGradient!, at: 0)
    }
    
    func setUpGradients() {
        calendarGradient = CAGradientLayer()
        calendarGradient?.colors = [lightRed.cgColor, nandoRed.cgColor]
        calendarGradient?.frame = calendarGradient!.bounds
        calendarGradient?.startPoint = CGPoint(x: 0, y: 0)
        calendarGradient?.endPoint = CGPoint(x: 1, y: 1)
        calendarView.layer.insertSublayer(calendarGradient!, at: 0)
    }
    
    func addBorders() {
        dateAndYearView.layer.addBorder(edge: UIRectEdge.top, color: UIColor.white, thickness: 1)
        dateAndYearView.layer.addBorder(edge: UIRectEdge.left, color: UIColor.white, thickness: 1)
        dateAndYearView.layer.addBorder(edge: UIRectEdge.right, color: UIColor.white, thickness: 1)
    }
    
    func setUpFirstDate() {
        let now = Date()
        yearLabel.text = getYearFrom(date: now)
        monthLabel.text = getMonthFrom(date: now)
    }
    
    func getDayFrom(date: Date) -> String {
        formatter.dateFormat = "dd"
        return formatter.string(from: date)
    }
    
    func getMonthFrom(date: Date) -> String {
        formatter.dateFormat = "MMMM"
        return formatter.string(from: date)
    }
    
    func getYearFrom(date: Date) -> String {
        formatter.dateFormat = "YYYY"
        return formatter.string(from: date)
    }
    
    func dateIsInSelctedDates(date: Date) -> Bool {
        for dateInArray in selectedDates {
            if datesAreEqual(firstDate: date, secondDate: dateInArray) {
                return true
            }
        }
        return false
    }
    
    func handleCellChange(cell: JTAppleCell?, state: CellState, cellShouldBeSelected: Bool) {
        guard let cell = cell as? CustomCell else {
            return
        }
        if cellShouldBeSelected {
            cell.dateLabel.textColor = UIColor.black
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
            handleCellColor(cell: cell, state: state, cellShouldBeSelected: cellShouldBeSelected)
        }
    
    }
    
    func handleCellColor(cell: CustomCell, state: CellState, cellShouldBeSelected: Bool) -> CustomCell {
        if cellShouldBeSelected {
            cell.dateLabel.textColor = UIColor.black
        } else {
            if state.dateBelongsTo == .thisMonth {
                cell.dateLabel.textColor = UIColor.white
            } else {
                cell.dateLabel.textColor = UIColor.darkGray
            }
        }
        return cell
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let firstDateOfMonth = Date().getThisMonthStart()
        let lastDayOfMonth = Date().endOfNextMonth()
        
        let parameters = ConfigurationParameters(startDate: (firstDateOfMonth as Date), endDate: (lastDayOfMonth as Date))
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        var cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        if dateIsInSelctedDates(date: date) {
            cell.selectedView.isHidden = false
            cell = handleCellColor(cell: cell, state: cellState, cellShouldBeSelected: true)
        } else {
            cell.selectedView.isHidden = true
            cell = handleCellColor(cell: cell, state: cellState, cellShouldBeSelected: false)
        }
        
        if isDateToday(date: date) {
            cell.currentDayView.isHidden = false
        } else {
            cell.currentDayView.isHidden = true
        }
        
        return cell
    
    }
    
    func isDateToday(date: Date) -> Bool {
        let now = Date()
        
        let currentMonth = getMonthFrom(date: now)
        let dateMonth = getMonthFrom(date: date)
        let currentDay = getDayFrom(date: now)
        let dateDay = getDayFrom(date: date)
        
        if currentMonth == dateMonth && currentDay == dateDay {
            return true
        } else {
            return false
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CustomCell
        cell.dateLabel.text = cellState.text
        
        var count = 0
        for dateInArray in selectedDates {
            if datesAreEqual(firstDate: date, secondDate: dateInArray) {
                cell.selectedView.isHidden = false
            }
            count += 1
        }

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        if let customCell = cell as? CustomCell {
            if customCell.selectedView.isHidden == true {
                //handleCellSelected(cell: cell, state: cellState, )
                //handleCellSelected(cell: cell, state: cellState, cellShouldBeSelected: true)
                handleCellChange(cell: cell, state: cellState, cellShouldBeSelected: true)
                selectedDates.append(date)
                if selectedDates.count == 1 {
                    //warningView.isHidden = true
                    warningIcon.isHidden = true
                }
            } else {
                var count = 0
                for dateInArray in selectedDates {
                    if datesAreEqual(firstDate: date, secondDate: dateInArray) {
                        selectedDates.remove(at: count)
                    }
                    count += 1
                }
                handleCellChange(cell: cell, state: cellState, cellShouldBeSelected: false)
                //handleCellSelected(cell: cell, state: cellState)
                
                if selectedDates.count == 0 {
                    //warningView.isHidden = false
                    warningIcon.isHidden = true
                }
            }
        }

    }
 
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        /*if let customCell = cell as? CustomCell {
            if customCell.selectedView.isHidden == false {
                var count = 0
                for dateInArray in selectedDates! {
                    if datesAreEqual(firstDate: date, secondDate: dateInArray) {
                        selectedDates?.remove(at: count)
                    }
                    count += 1
                }
            }
        }
        
        handleCellSelected(cell: cell, state: cellState)
        
        if selectedDates?.count == 0 {
            warningIcon.isHidden = false
            warningText.isHidden = false
        }*/
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CalendarTableViewCell()
    }
    
    func datesAreEqual(firstDate: Date, secondDate: Date) -> Bool {
        let firstMonth = getMonthFrom(date: firstDate)
        let firstDay = getDayFrom(date: firstDate)
        let secondMonth = getMonthFrom(date: secondDate)
        let secondDay = getDayFrom(date: secondDate)
        
        if firstDay == secondDay && firstMonth == secondMonth {
            return true
        } else {
            return false
        }
    }
    
    func calendarDidScroll(_ calendar: JTAppleCalendarView) {
        calendarView.layer.insertSublayer(calendarGradient!, at: 0)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        
        guard let date = visibleDates.monthDates.first?.date else {
            return
        }
        
        yearLabel.text = getYearFrom(date: date)
        monthLabel.text = getMonthFrom(date: date)
        
    }

}

extension CALayer {
    var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}

extension Date {
    func getThisMonthStart() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
    
    func endOfNextMonth() -> Date {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 2
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}
