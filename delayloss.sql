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
DROP TABLE IF EXISTS `delayloss`;
CREATE TABLE `delayloss`  (
  `srcIP` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `dstIP` bigint(20) UNSIGNED NOT NULL,
  `srcPort` smallint(6) UNSIGNED NOT NULL,
  `dstPort` smallint(6) UNSIGNED NOT NULL,
  `protocol` tinyint(4) UNSIGNED NOT NULL,
  `delay` double(20, 2) NULL DEFAULT NULL,
  `loss` double(20, 2) NULL DEFAULT NULL,
  `data_time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
