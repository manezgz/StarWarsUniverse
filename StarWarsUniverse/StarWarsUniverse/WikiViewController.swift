//
//  WikiViewController.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 11/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    var model:CROCharacter!
    var canLoadRequest:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"characterSelected:", name: Constants.Notification.NotificationName, object: nil)
        self.syncModelAndView()
        // Do any additional setup after loading the view.
        self.webView.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRequest(){
        let request = NSURLRequest(URL: model.wikiURL)
        webView.loadRequest(request)
    }
    
    func syncModelAndView(){
        canLoadRequest=true
        self.title=model.alias+" Wiki"
        self.loadRequest()
    }
    
    func characterSelected(notification:NSNotification){
        self.model=notification.userInfo![Constants.Notification.UserInfoKey] as! CROCharacter
        self.syncModelAndView()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.canLoadRequest
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityView.stopAnimating()
        self.activityView.hidden=true
        canLoadRequest=false
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityView.hidden=false
        self.activityView.startAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
