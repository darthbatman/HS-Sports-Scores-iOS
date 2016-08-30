//
//  getData.swift
//  MyFirstApp
//
//  Created by Rishi Masand on 10/20/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

import UIKit

class getDataViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    var distanceFromTop: CGFloat = 50
    
    var scrollViewSize: CGFloat = 0;
    
    override func viewDidLoad() {
 
        var reloadButton: UIButton = UIButton(frame: CGRectMake(30, distanceFromTop + 60, 160, 64))
        reloadButton.backgroundColor = UIColor.blueColor()
        reloadButton.addTarget(self, action: "pressed", forControlEvents: .TouchUpInside)
        self.scrollView.addSubview(reloadButton)
        
        var refresh = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, selector: "refresh", userInfo: nil, repeats: true)

    }
    
    func pressed(){
        
//        let url = NSURL(string: "http://25edc5de.ngrok.io/getinfo")
//        let request = NSURLRequest(URL: url!)
//        
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
//            println(NSString(data: data, encoding: NSUTF8StringEncoding))
//        }
        var jsonData: NSData = getJSON("http://localhost:8888/getinfo")
        var jsonDict: NSDictionary = parseJSON(jsonData)
        print(jsonDict)
        print(jsonDict["tOne"]!)
        

        
        drawBoxes(jsonDict["tOne"] as! String, teamTwo: jsonDict["tTwo"] as! String, tOneScore: jsonDict["tOneS"] as! String, tTwoScore: jsonDict["tTwoS"] as! String)
        
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func parseJSON(inputData: NSData) -> NSDictionary{
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
        
        return boardsDictionary
    }
    
    func drawBoxes(teamOne: String, teamTwo: String, tOneScore: String, tTwoScore: String) {
        
        print(teamOne)
        print(teamTwo)
        print(tOneScore)
        print(tTwoScore)
        
        
        scrollView.frame.size.height = scrollViewSize
        
        for var i = 0; i < 1; i++ {
            var gameView: UIView = UIView(frame: CGRectMake(30, distanceFromTop - 15, 50, 150))
            gameView.backgroundColor = UIColor.blackColor()
            var teamOneView: UIView = UIView(frame: CGRectMake(0,0, (0.67 * 250),75))
            teamOneView.backgroundColor = UIColor.redColor()
            gameView.addSubview(teamOneView)
            var teamOneScoreView: UIView = UIView(frame: CGRectMake((0.67 * 250),0,(0.33 * 250),75))
            teamOneScoreView.backgroundColor = UIColor.blueColor()
            gameView.addSubview(teamOneScoreView)
            var teamTwoView: UIView = UIView(frame: CGRectMake(0,75, (0.67 * 250),75))
            teamTwoView.backgroundColor = UIColor.brownColor()
            gameView.addSubview(teamTwoView)
            var teamTwoScoreView: UIView = UIView(frame: CGRectMake((0.67 * 250),75,(0.33 * 250),75))
            teamTwoScoreView.backgroundColor = UIColor.yellowColor()
            gameView.addSubview(teamTwoScoreView)
            var teamOneLabel: UILabel = UILabel(frame: CGRectMake(teamOneView.center.x, 0, (0.67*250), 75))
            teamOneLabel.text = teamOne
            teamOneView.addSubview(teamOneLabel)
            var teamOneScoreLabel: UILabel = UILabel(frame: CGRectMake(0,0, (0.67 * 250),75))
            teamOneScoreLabel.text = tOneScore
            teamOneScoreView.addSubview(teamOneScoreLabel)
            var teamTwoLabel: UILabel = UILabel(frame: CGRectMake(teamTwoView.center.x, 0, (0.67*250), 75))
            teamTwoLabel.text = teamTwo
            teamTwoView.addSubview(teamTwoLabel)
            var teamTwoScoreLabel: UILabel = UILabel(frame: CGRectMake(0,0,(0.33 * 250),75))
            teamTwoScoreLabel.text = tTwoScore
            teamTwoScoreView.addSubview(teamTwoScoreLabel)
            
            self.scrollView.addSubview(gameView)
            
            
            
            scrollViewSize += 180
            
            self.scrollView.contentSize = CGSizeMake(self.view.frame.width, scrollViewSize + 30)
            
            distanceFromTop += 180
        }
        
        scrollViewSize += 180
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width, scrollViewSize + 30)
        
        var reloadButton: UIButton = UIButton(frame: CGRectMake(30, distanceFromTop + 60, 160, 64))
        reloadButton.backgroundColor = UIColor.blueColor()
        reloadButton.addTarget(self, action: "pressed", forControlEvents: .TouchUpInside)
        self.scrollView.addSubview(reloadButton)

    }
    
    func refresh () {
        var jsonData: NSData = getJSON("http://localhost:8888/getinfo")
        var jsonDict: NSDictionary = parseJSON(jsonData)
        print(jsonDict)
        print(jsonDict["tOne"]!)
        
        drawBoxes(jsonDict["tOne"] as! String, teamTwo: jsonDict["tTwo"] as! String, tOneScore: jsonDict["tOneS"] as! String, tTwoScore: jsonDict["tTwoS"] as! String)

    }
    
}
