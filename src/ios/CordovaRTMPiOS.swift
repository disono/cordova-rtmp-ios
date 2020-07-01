/**
 * Author: Archie, Disono (webmonsph@gmail.com)
 * Website: https://www.webmons.com
 *
 * Created at: 1/11/2019
 */

@objc(CordovaRTMPiOS) class CordovaRTMPiOS : CDVPlugin {
  func echo(_ command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let msg = command.arguments[0] as? String ?? ""

    if msg.characters.count > 0 {
      /* UIAlertController is iOS 8 or newer only. */
      let toastController: UIAlertController = 
        UIAlertController(
          title: "", 
          message: msg, 
          preferredStyle: .alert
        )

      self.viewController?.present(
        toastController, 
        animated: true, 
        completion: nil
      )

        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(10)
        mainQueue.asyncAfter(deadline: deadline) {
            toastController.dismiss(
                animated: true,
                completion: nil
            )
        }

      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: msg
      )
    }

    self.commandDelegate!.send(
      pluginResult, 
      callbackId: command.callbackId
    )
  }

  func streamRTMPAuth(_ command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let uri = command.arguments[0] as? String ?? ""
    let username = command.arguments[1] as? String ?? ""
    let password = command.arguments[2] as? String ?? ""

    pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: "Streaming to \(uri)"
    )

    self.commandDelegate!.send(
        pluginResult, 
        callbackId: command.callbackId
    )
  }
}
