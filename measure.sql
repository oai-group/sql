/*
 Navicat Premium Data Transfer

 Source Server         : enb2
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 192.168.31.50:3306
 Source Schema         : mytestdb

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 22/10/2021 13:04:02
*/

CREATE DATABASE IF NOT EXISTS `mytestdb`;
USE `mytestdb`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for measure
-- ----------------------------
DROP TABLE IF EXISTS `measure`;
CREATE TABLE `measure`  (
  `srcIP` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `dstIP` bigint(20) UNSIGNED NOT NULL,
  `srcPort` smallint(6) UNSIGNED NOT NULL,
  `dstPort` smallint(6) UNSIGNED NOT NULL,
  `protocol` tinyint(4) UNSIGNED NOT NULL,
  `averBytes` double(20, 1) NULL DEFAULT NULL,
  `averPkts` double(20, 1) NULL DEFAULT NULL,
  `flowType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`srcIP`, `dstIP`, `srcPort`, `dstPort`, `protocol`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
