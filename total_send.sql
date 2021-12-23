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

 Date: 22/10/2021 13:04:18
*/

CREATE DATABASE IF NOT EXISTS `mytestdb`;
USE `mytestdb`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for total
-- ----------------------------
DROP TABLE IF EXISTS `total_send`;
CREATE TABLE `total_send`  (
  `time` int(20) UNSIGNED NOT NULL,
  `totalBytes` double(20, 2) UNSIGNED NULL DEFAULT NULL,
  `totalPkts` double(20, 2) UNSIGNED NULL DEFAULT NULL,
  `data_time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
