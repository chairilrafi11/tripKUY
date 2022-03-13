import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:nav_router/nav_router.dart';
import 'package:pintupay/core/database/core_database.dart';
import 'package:pintupay/core/pintupay/pintupay_utility.dart';
import 'package:pintupay/core/util/util.dart';
import 'package:pintupay/ui/component/component_dialog.dart';
import 'package:pointycastle/export.dart';
import 'package:flutter/material.dart' as prefix;

class PintuPayCrypt {
  final int keySize = 256;
  var iteration = pow(2, 16);

  //? key atoz
  static const String token = 'Q1BB34N789EWSDUS';

  Uint8List aesCbcEncrypt(
      Uint8List key, Uint8List iv, Uint8List paddedPlaintext) {
    if (![128, 192, 256].contains(key.length * 8)) {
      throw ArgumentError.value(key, 'key', 'invalid key length for AES');
    }
    if (iv.length * 8 != 128) {
      throw ArgumentError.value(iv, 'iv', 'invalid IV length for AES');
    }
    if (paddedPlaintext.length * 8 % 128 != 0) {
      throw ArgumentError.value(
          paddedPlaintext, 'paddedPlaintext', 'invalid length for AES');
    }

    //? Create a CBC block cipher with AES, and initialize with key and IV

    final cbc = BlockCipher('AES/CBC')
      ..init(true, ParametersWithIV(KeyParameter(key), iv)); // true=encrypt

    //? Encrypt the plaintext block-by-block

    final cipherText = Uint8List(paddedPlaintext.length); // allocate space

    var offset = 0;
    while (offset < paddedPlaintext.length) {
      offset += cbc.processBlock(paddedPlaintext, offset, cipherText, offset);
    }
    assert(offset == paddedPlaintext.length);

    return cipherText;
  }

//----------------------------------------------------------------

  Uint8List aesCbcDecrypt(Uint8List key, Uint8List iv, Uint8List cipherText) {
    if (![128, 192, 256].contains(key.length * 8)) {
      throw ArgumentError.value(key, 'key', 'invalid key length for AES');
    }
    if (iv.length * 8 != 128) {
      throw ArgumentError.value(iv, 'iv', 'invalid IV length for AES');
    }
    if (cipherText.length * 8 % 128 != 0) {
      throw ArgumentError.value(
          cipherText, 'cipherText', 'invalid length for AES');
    }

    final cbc = BlockCipher('AES/CBC')
      ..init(false, ParametersWithIV(KeyParameter(key), iv)); // false=decrypt

    final paddedPlainText = Uint8List(cipherText.length); // allocate space

    var offset = 0;
    while (offset < cipherText.length) {
      offset += cbc.processBlock(cipherText, offset, paddedPlainText, offset);
    }
    assert(offset == cipherText.length);

    return paddedPlainText;
  }

//----------------------------------------------------------------
  /// Added padding
  Uint8List pad(Uint8List bytes, int blockSize) {
    final padLength = blockSize - (bytes.length % blockSize);

    final padded = Uint8List(bytes.length + padLength)..setAll(0, bytes);
    Padding('PKCS7').addPadding(padded, bytes.length);

    return padded;
  }

//----------------------------------------------------------------
  /// Remove padding
  Uint8List unpad(Uint8List padded) =>
      padded.sublist(0, padded.length - Padding('PKCS7').padCount(padded));

//----------------------------------------------------------------
  /// Derive a key from a passphrase.
  ///
  /// The [passPhrase] is an arbitrary length secret string.
  ///
  /// The [bitLength] is the length of key produced. It determines whether
  /// AES-128, AES-192, or AES-256 will be used. It must be one of those values.
  Uint8List passphraseToKey(String passPhrase,
      {String salt = '', int iterations = 30000, int bitLength = 265}) {
    if (![128, 192, 256].contains(bitLength)) {
      throw ArgumentError.value(bitLength, 'bitLength', 'invalid for AES');
    }
    final numBytes = bitLength ~/ 8;

    final kd = KeyDerivator('SHA-1/HMAC/PBKDF2')
      ..init(Pbkdf2Parameters(
          utf8.encode(salt) as Uint8List, iterations, numBytes));

    return kd.process(utf8.encode(passPhrase) as Uint8List);
  }

  String encrypt(String input, Uint8List passKey) {
    CoreFunction.logPrint('Encrypt', input);
    String? param;
    var initialVector = DateTime.now().millisecondsSinceEpoch * 1000;
    var iv = utf8.encode(initialVector.toString()) as Uint8List;
    var dataSource = pad(utf8.encode(input) as Uint8List, 16);
    CoreFunction.logPrint('before', DateTime.now().millisecondsSinceEpoch);
    var data = aesCbcEncrypt(passKey, iv, dataSource);
    CoreFunction.logPrint('after', DateTime.now().millisecondsSinceEpoch);
    param = base64.encode(data) + '--' + base64.encode(iv);
    return param;
  }

  Uint8List getPassKey() {
    return passphraseToKey(
      CoreVariable.password,
      iterations: iteration.toInt(),
      salt: CoreVariable.salt,
      bitLength: keySize
    );
  }

  Future setPassKey() async {
    var utilityBox = await CoreDatabase.openBoxDatabase(PintuPayutilityBox.tabelName);
    if(utilityBox.get(PintuPayutilityBox.passkey) == null){
      var passKey = getPassKey();
      utilityBox.put(PintuPayutilityBox.passkey, base64.encode(passKey));
      CoreFunction.logPrint('Set Key', 'complete');
    }
  }

  Future<Uint8List> getPassKeyPref() async {
    var utilityBox = await CoreDatabase.openBoxDatabase(PintuPayutilityBox.tabelName);
    String? passKey;
    var passKeyDB = await utilityBox.get(PintuPayutilityBox.passkey);
    if (passKeyDB == null) {
      ComponentDialog.dialogLoading();
      passKeyDB = base64.encode(getPassKey());
      utilityBox.put(PintuPayutilityBox.passkey, passKeyDB);
      passKey = passKeyDB;
      prefix.Navigator.of(navGK.currentContext!).pop();
    } else {
      passKey = passKeyDB;
    }
    return base64.decode(passKey ?? '');
  }

  String decrypt(String input, Uint8List passKey) {
    String? result;
    var inputData = input.split('--');
    var iv = base64.decode(inputData[1]);
    var dataSource = base64.decode(inputData[0]);
    var data = aesCbcDecrypt(passKey, iv, dataSource);
    var decryptedBytes = unpad(data);
    result = utf8.decode(decryptedBytes);
    return result;
  }
}
