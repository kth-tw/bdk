/**
 * @requires name - [string] chaincode 的名稱
 * @requires version - [string] chaincode 的版本
 * @requires path - [string] chaincode 的路徑位置
 */
export interface ChaincodePackageType {
  name: string
  version: number
  path: string
}

/**
 * @requires channelId - [string] channel 的名稱
 * @requires chaincodeName - [string] chaincode 的名稱
 * @requires chaincodeVersion - [number] chaincode 的版本號碼
 * @requires initRequired - [boolean] 使否需要初始化
 * @requires orderer - [string] orderer 的 address 和 port
 */
export interface ChaincodeApproveType {
  channelId: string
  chaincodeName: string
  chaincodeVersion: number
  initRequired: boolean
  orderer: string
}

/**
 * @requires chaincodeLabel - [string] chaincode 的名稱
 */
export interface ChaincodeInstallType {
  chaincodeLabel: string
}

/**
 * @ignore
 */
export interface ChaincodeInstallStepSavePackageIdType extends ChaincodeInstallType {
  packageId: string
}

/**
 * @requires channelId - [string] channel 的名稱
 * @requires chaincodeName - [string] chaincode 的名稱
 * @requires chaincodeVersion - [number] chaincode 的版本號碼
 * @requires initRequired - [boolean] 使否需要初始化
 * @requires orderer - [string] orderer 的 address 和 port
 * @requires peerAddresses - [string array] peer address 和 port 的 array
 */
export interface ChaincodeCommitType {
  channelId: string
  chaincodeName: string
  chaincodeVersion: number
  initRequired: boolean
  orderer: string
  peerAddresses: string[]
}

/**
 * @requires channelId - [string] channel 的名稱
 * @requires chaincodeName - [string] chaincode 的名稱
 * @requires chaincodeFunction - [string] chaincode function 的名稱
 * @requires args - [any array] chaincode function 需要的參數
 */
export interface ChaincodeQueryType {
  channelId: string
  chaincodeName: string
  chaincodeFunction: string
  args: any[]
}

/**
 * @requires isInit - [boolean] 是否要初始化 chaincode
 * @requires orderer - [string] orderer 的 address 和 port
 * @requires peerAddresses - [string array] peer address 和 port 的 array
 */
export interface ChaincodeInvokeType extends ChaincodeQueryType {
  isInit: boolean
  orderer: string
  peerAddresses: string[]
}
