// 全局变量
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:vaani/router/router.dart';

late String appName;
const String appScheme = "vaani";
late String appVersion;
const String appAuthor = "rang";
late String appBuildNumber;

Uri githubRepo = Uri.parse('https://github.com/rangdl/Vaani');

Future<void> initialize() async {
  final packageInfo = await PackageInfo.fromPlatform();
  appName = packageInfo.appName;
  appVersion = packageInfo.version;
  appBuildNumber = packageInfo.buildNumber;
  deviceData = await _getDeviceData(DeviceInfoPlugin());
  deviceName = getDeviceName(deviceData);
  deviceModel = getDeviceModel(deviceData);
  deviceSdkVersion = getDeviceSdkVersion(deviceData);
  deviceManufacturer = getDeviceManufacturer(deviceData);
  appLogger = Logger(appName);
  final dirDocuments = await getApplicationDocumentsDirectory();
  appDocumentsDir = Directory(p.join(dirDocuments.path, appName));
  await appDocumentsDir.create(recursive: true);
  appSupportDir = await getApplicationSupportDirectory();
}

late Map<String, dynamic> deviceData;

late String deviceName;
late String deviceModel;
late String deviceSdkVersion;
late String deviceManufacturer;

late Logger appLogger;

/// 文档目录 getApplicationDocumentsDirectory
/// 存放用户生成的、不可重建的持久化数据。在iOS端，此目录可能会通过iCloud自动同步。
late Directory appDocumentsDir;

/// 应用支持目录 getApplicationSupportDirectory
/// 存放应用程序的支持文件。在iOS上，此目录是持久性的，且会备份到iCloud。
late Directory appSupportDir;

const double playerMinHeight = 70;

var routerConfig = const MyAppRouter().config;

String getDeviceName(data) {
  // try different keys to get the device name
  return // android
  data['product'] ??
      // ios
      data['name'] ??
      // linux
      data['name'] ??
      // windows
      data['computerName'] ??
      // macos
      data['model'] ??
      // web
      data['browserName'] ??
      'Unknown name';
}

String getDeviceModel(data) {
  // try different keys to get the device model
  return
  // android, eg: Google Pixel 4
  data['model'] ??
      // ios, eg: iPhone 12 Pro
      data['name'] ??
      // linux, eg: Linux Mint 20.1
      data['name'] ??
      // windows, eg: Surface Pro 7
      data['productId'] ??
      // macos, eg: MacBook Pro (13-inch, M1, 2020)
      data['model'] ??
      // web, eg: Chrome 87.0.4280.88
      data['browserName'] ??
      'Unknown model';
}

String getDeviceSdkVersion(data) {
  // try different keys to get the device sdk version
  return
  // android, eg: 30
  data['version.sdkInt']?.toString() ??
      // ios, eg: 14.4
      data['systemVersion'] ??
      // linux, eg: 5.4.0-66-generic
      data['version'] ??
      // windows, eg: 10.0.19042
      data['displayVersion'] ??
      // macos, eg: 11.2.1
      data['osRelease'] ??
      // web, eg: 87.0.4280.88
      data['appVersion'] ??
      'Unknown sdk version';
}

String getDeviceManufacturer(data) {
  // try different keys to get the device manufacturer
  return
  // android, eg: Google
  data['manufacturer'] ??
      // ios, eg: Apple
      data['manufacturer'] ??
      // linux, eg: Linux
      data['idLike'] ??
      // windows, eg: Microsoft
      data['productName'] ??
      // macos, eg: Apple
      data['manufacturer'] ??
      // web, eg: Google Inc.
      data['vendor'] ??
      'Unknown manufacturer';
}

// copied from https://pub.dev/packages/device_info_plus/example
Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'fingerprint': build.fingerprint,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'supported32BitAbis': build.supported32BitAbis,
    'supported64BitAbis': build.supported64BitAbis,
    'supportedAbis': build.supportedAbis,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'systemFeatures': build.systemFeatures,
    'serialNumber': build.serialNumber,
    'isLowRamDevice': build.isLowRamDevice,
  };
}

Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'systemName': data.systemName,
    'systemVersion': data.systemVersion,
    'model': data.model,
    'localizedModel': data.localizedModel,
    'identifierForVendor': data.identifierForVendor,
    'isPhysicalDevice': data.isPhysicalDevice,
    'utsname.sysname:': data.utsname.sysname,
    'utsname.nodename:': data.utsname.nodename,
    'utsname.release:': data.utsname.release,
    'utsname.version:': data.utsname.version,
    'utsname.machine:': data.utsname.machine,
  };
}

Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  return <String, dynamic>{
    'name': data.name,
    'version': data.version,
    'id': data.id,
    'idLike': data.idLike,
    'versionCodename': data.versionCodename,
    'versionId': data.versionId,
    'prettyName': data.prettyName,
    'buildId': data.buildId,
    'variant': data.variant,
    'variantId': data.variantId,
    'machineId': data.machineId,
  };
}

Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  return <String, dynamic>{
    'browserName': data.browserName.name,
    'appCodeName': data.appCodeName,
    'appName': data.appName,
    'appVersion': data.appVersion,
    'deviceMemory': data.deviceMemory,
    'language': data.language,
    'languages': data.languages,
    'platform': data.platform,
    'product': data.product,
    'productSub': data.productSub,
    'userAgent': data.userAgent,
    'vendor': data.vendor,
    'vendorSub': data.vendorSub,
    'hardwareConcurrency': data.hardwareConcurrency,
    'maxTouchPoints': data.maxTouchPoints,
  };
}

Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  return <String, dynamic>{
    'computerName': data.computerName,
    'hostName': data.hostName,
    'arch': data.arch,
    'model': data.model,
    'kernelVersion': data.kernelVersion,
    'majorVersion': data.majorVersion,
    'minorVersion': data.minorVersion,
    'patchVersion': data.patchVersion,
    'osRelease': data.osRelease,
    'activeCPUs': data.activeCPUs,
    'memorySize': data.memorySize,
    'cpuFrequency': data.cpuFrequency,
    'systemGUID': data.systemGUID,
  };
}

Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  return <String, dynamic>{
    'numberOfCores': data.numberOfCores,
    'computerName': data.computerName,
    'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    'userName': data.userName,
    'majorVersion': data.majorVersion,
    'minorVersion': data.minorVersion,
    'buildNumber': data.buildNumber,
    'platformId': data.platformId,
    'csdVersion': data.csdVersion,
    'servicePackMajor': data.servicePackMajor,
    'servicePackMinor': data.servicePackMinor,
    'suitMask': data.suitMask,
    'productType': data.productType,
    'reserved': data.reserved,
    'buildLab': data.buildLab,
    'buildLabEx': data.buildLabEx,
    'digitalProductId': data.digitalProductId,
    'displayVersion': data.displayVersion,
    'editionId': data.editionId,
    'installDate': data.installDate,
    'productId': data.productId,
    'productName': data.productName,
    'registeredOwner': data.registeredOwner,
    'releaseId': data.releaseId,
    'deviceId': data.deviceId,
  };
}

Future<Map<String, dynamic>> _getDeviceData(
  DeviceInfoPlugin deviceInfoPlugin,
) async {
  Map<String, dynamic> deviceData;
  try {
    if (kIsWeb) {
      deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {
      deviceData = switch (defaultTargetPlatform) {
        TargetPlatform.android => _readAndroidBuildData(
          await deviceInfoPlugin.androidInfo,
        ),
        TargetPlatform.iOS => _readIosDeviceInfo(
          await deviceInfoPlugin.iosInfo,
        ),
        TargetPlatform.linux => _readLinuxDeviceInfo(
          await deviceInfoPlugin.linuxInfo,
        ),
        TargetPlatform.windows => _readWindowsDeviceInfo(
          await deviceInfoPlugin.windowsInfo,
        ),
        TargetPlatform.macOS => _readMacOsDeviceInfo(
          await deviceInfoPlugin.macOsInfo,
        ),
        TargetPlatform.fuchsia => <String, dynamic>{
          errorKey: 'Fuchsia platform isn\'t supported',
        },
      };
    }
  } on PlatformException {
    deviceData = <String, dynamic>{errorKey: 'Failed to get platform version.'};
  }
  return deviceData;
}

const errorKey = 'Error:';
