import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:openwrt_manager/Model/Identity.dart';
import 'package:openwrt_manager/Model/device.dart';
import 'package:openwrt_manager/OpenWrt/Model/AuthenticateReply.dart';
import 'package:openwrt_manager/OpenWrt/Model/CommandReplyBase.dart';
import 'package:openwrt_manager/OpenWrt/Model/ReplyBase.dart';
import 'package:openwrt_manager/OpenWrt/Model/DeleteClientReply.dart';
import 'package:openwrt_manager/OpenWrt/Model/RestartInterfaceReply.dart';
import 'package:openwrt_manager/OpenWrt/Model/RRDNSReply.dart';
import 'package:openwrt_manager/Utils.dart';
import 'Model/SystemInfoReply.dart';

class ConnectionBetweenSlaves{
  Identity _identity;
  Device _device;

  static const int Timeout = 3;

  String get _baseURL {
    String url;
    if (_device.useSecureConnection)
      url = "https://${_device.address}";
    else
      url = "http://${_device.address}";
    if (_device.port.length > 0) url += ":" + _device.port;
    return url;
  }
  ConnectionBetweenSlaves(Device d, Identity i) {
    _identity = i;
    _device = d;
  }

  HttpClient _getClient() {
    var cli = HttpClient();
    if (_device.ignoreBadCertificate)
      cli.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    return cli;
  }
}