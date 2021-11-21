//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

final class ___VARIABLE_sceneName___Coordenator: CoordenetorProtocol {
  let sender: UIResponder?
  let display: ___VARIABLE_sceneName___DisplayLogic & UIViewController
  let interactor: ___VARIABLE_sceneName___BusinessLogic & ___VARIABLE_sceneName___DataStore
  let presenter: ___VARIABLE_sceneName___PresentationLogic
  let interactionDelegate: ___VARIABLE_sceneName___InteractorDelegate?
  
  init(sender: UIResponder?,
       display: ___VARIABLE_sceneName___DisplayLogic & UIViewController,
       interactor: ___VARIABLE_sceneName___BusinessLogic & ___VARIABLE_sceneName___DataStore,
       presenter: ___VARIABLE_sceneName___PresentationLogic,
       delegate: ___VARIABLE_sceneName___InteractorDelegate?) {
    self.sender = sender
    self.display = display
    self.interactor = interactor
    self.presenter = presenter
    self.interactionDelegate = delegate
  }
  
  func start() {
    guard let viewController = sender as? UIViewController else {
      guard let window = sender as? UIWindow else { return }
      window.rootViewController = display
      return window.makeKeyAndVisible()
    }
    viewController.show(display, sender: nil)
  }
}

public enum ___VARIABLE_sceneName___CoordenatorFactory {
  public static func make(sender: UIResponder?, delegate: ___VARIABLE_sceneName___InteractorDelegate?) -> CoordenetorProtocol {
    let display: ___VARIABLE_sceneName___ViewController = ___VARIABLE_sceneName___ViewController(nibName: nil, bundle: nil)
    let interactor: ___VARIABLE_sceneName___Interactor = ___VARIABLE_sceneName___Interactor()
    let presenter: ___VARIABLE_sceneName___Presenter = ___VARIABLE_sceneName___Presenter()
    interactor.presenter = presenter
    presenter.viewController = display
    display.interactor = interactor
    
    return ___VARIABLE_sceneName___Coordenator(sender: sender,
                                  display: display,
                                  interactor: interactor,
                                  presenter: presenter,
                                  delegate: delegate)
  }
}
