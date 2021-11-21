//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_sceneName___PresentationLogic
{
  func presentLoading(response: ___VARIABLE_sceneName___.Loading.Response)
}

class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic
{
  weak var viewController: ___VARIABLE_sceneName___DisplayLogic?
  
  // MARK: Do Loading
  
  func presentLoading(response: ___VARIABLE_sceneName___.Loading.Response)
  {
    let viewModel = ___VARIABLE_sceneName___.Loading.ViewModel()
    viewController?.displayLoading(viewModel: viewModel)
  }
}
