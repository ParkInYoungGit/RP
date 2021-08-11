//
//  ViewController.swift
//  NetworkAPI
//
//  Created by YOUNG on 2021/08/06.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin
import Alamofire


class ViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {

    var weatherMain: String = ""
    var userName: String = ""
    
    @IBOutlet weak var btnWeather: UIButton!
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnWeather.layer.cornerRadius = 10
        self.lblName.text = "비회원"
        loginInstance?.delegate = self
    }

    
    
    //MARK: - 카카오
    @IBAction func kakaoLogout(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                self.lblName.text = "비회원"
            }
        }
    }
    
    
    
    @IBAction func onKakaoLoginByAppTouched(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    self.setUserInfo()
                }
            }
    }

    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")

                //do something
                _ = user
                let gender = user?.kakaoAccount?.gender
                var nickName = user?.kakaoAccount?.profile?.nickname
                self.lblName.text = "환영합니다. \(nickName!)님!"
                self.userName = nickName!
            }
        }
       }
    
    //MARK: - 네이버
    @IBAction func naverLogin(_ sender: Any) {
        loginInstance?.requestThirdPartyLogin()


    }
    @IBAction func naverLogout(_ sender: Any) {
        loginInstance?.requestDeleteToken()
    }
    
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("[Success] : Success Naver Login")
        getNaverInfo()
        
        let alramAlert = UIAlertController(title: "알림", message: "네이버 ID 로그인 성공하였습니다.!", preferredStyle: UIAlertController.Style.alert)
        alramAlert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
                        let alretAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                        
                        alramAlert.addAction(alretAction)
                        present(alramAlert, animated: true, completion: nil)
            }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        let alramAlert = UIAlertController(title: "알림", message: "네이버 ID 로그아웃 성공하였습니다.!", preferredStyle: UIAlertController.Style.alert)
                            alramAlert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
                        let alretAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                        
                        alramAlert.addAction(alretAction)
                        present(alramAlert, animated: true, completion: nil)
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("[Error] :", error.localizedDescription)
    }
    
    
    private func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        print("왜안되는1")
        if !isValidAccessToken {
          return
        }
        print("왜안되는2")
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
          
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        print("왜안되는3")
        req.responseJSON { response in
            print("왜안되는4")
          guard let result = response.value as? [String: Any] else { return }
            print("왜안되는5")
          guard let object = result["response"] as? [String: Any] else { return }
          guard let name = object["name"] as? String else { return }
            print("\(name)")
            self.lblName.text = "환영합니다. \(name)님!"
            self.userName = name
          guard let email = object["email"] as? String else { return }
          guard let id = object["id"] as? String else {return}
          
        print("왜안되는6")
        print(email)
          
        print("\(name + email + id)")
       

        }
      }
    
    //MARK: -weather
 
    
    
    func didSuccess(_ response: WeatherResponse) {
        
        weatherMain = response.weather[0].main
        print("날씨정보\(weatherMain)")
        guard let WeatherVC = storyboard?.instantiateViewController(identifier: "weatherVC") as? WeatherViewController else { return }
        
        //WeatherVC.Weather = weatherMain
        self.navigationController?.pushViewController(WeatherVC, animated: true)
    }
    
    @IBAction func btnShowWeather(_ sender: Any) {
        
        guard let WeatherVC = storyboard?.instantiateViewController(identifier: "weatherVC") as? WeatherViewController else { return }
        
        WeatherVC.name = userName
        self.navigationController?.pushViewController(WeatherVC, animated: true)
        
    }
    
}
