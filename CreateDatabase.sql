-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema datamanagementproject
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `datamanagementproject` ;

-- -----------------------------------------------------
-- Schema datamanagementproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `datamanagementproject` DEFAULT CHARACTER SET utf8mb3 ;
USE `datamanagementproject` ;

-- -----------------------------------------------------
-- Table `datamanagementproject`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`user` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`user` (
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `pwd_hash` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `pwd_hash_UNIQUE` (`pwd_hash` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`ai_query`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`ai_query` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`ai_query` (
  `query_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `context` TEXT NULL DEFAULT NULL,
  `response` TEXT NULL DEFAULT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE INDEX `query_id_UNIQUE` (`query_id` ASC) VISIBLE,
  INDEX `user_query_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_query_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`calendar_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`calendar_event` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`calendar_event` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `event_name` VARCHAR(45) NULL DEFAULT 'null',
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE INDEX `event_id_UNIQUE` (`event_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`course` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`course_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`course_resource` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`course_resource` (
  `resource_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `resource_name` VARCHAR(80) NULL DEFAULT NULL,
  `file_url` VARCHAR(200) NULL DEFAULT NULL,
  `file_type` VARCHAR(45) NULL DEFAULT NULL,
  `last_update_time` DATETIME NOT NULL,
  PRIMARY KEY (`resource_id`),
  UNIQUE INDEX `resource_id_UNIQUE` (`resource_id` ASC) VISIBLE,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `course_resource_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `course_resource_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`course` (`course_id`),
  CONSTRAINT `course_resource_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`course_work`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`course_work` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`course_work` (
  `cw_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `cw_title` VARCHAR(100) NULL DEFAULT NULL,
  `cw_type` VARCHAR(80) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `due_date` DATETIME NULL DEFAULT NULL,
  `grade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cw_id`),
  UNIQUE INDEX `assignment_id_UNIQUE` (`cw_id` ASC) VISIBLE,
  INDEX `assignment_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `assignment_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`course` (`course_id`),
  CONSTRAINT `assignment_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`event_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`event_tag` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`event_tag` (
  `tag_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `tag_name` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE INDEX `tag_id_UNIQUE` (`tag_id` ASC) VISIBLE,
  INDEX `tag_event_id_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `tag_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `datamanagementproject`.`calendar_event` (`event_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`performance_stat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`performance_stat` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`performance_stat` (
  `stat_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `metric_type` VARCHAR(45) NOT NULL,
  `value` INT NOT NULL,
  `record_time` DATETIME NOT NULL,
  PRIMARY KEY (`stat_id`),
  INDEX `user_performance_stat_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_performance_stat`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`quiz` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`quiz` (
  `quiz_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `time_spent` TIME NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `quiz_course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `quiz_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`),
  CONSTRAINT `quiz_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`quiz_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`quiz_question` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`quiz_question` (
  `question_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `question` TEXT NULL DEFAULT NULL,
  `user_answer` TEXT NULL DEFAULT NULL,
  `correct_answer` TEXT NULL DEFAULT NULL,
  `full_mark` INT NULL DEFAULT NULL,
  `grade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE INDEX `question_id_UNIQUE` (`question_id` ASC) VISIBLE,
  INDEX `quiz_id_idx` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `quiz_question_id`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `datamanagementproject`.`quiz` (`quiz_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`student_notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`student_notes` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`student_notes` (
  `note_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `created_date` DATETIME NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE INDEX `note_id_UNIQUE` (`note_id` ASC) VISIBLE,
  INDEX `student_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `course_note_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `course_note_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`course` (`course_id`),
  CONSTRAINT `user_note_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`study_section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`study_section` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`study_section` (
  `section_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE INDEX `section_id_UNIQUE` (`section_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_study_section_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`summary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`summary` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`summary` (
  `sum_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date_created` DATETIME NULL DEFAULT NULL,
  `file_url` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`sum_id`),
  UNIQUE INDEX `sum_id_UNIQUE` (`sum_id` ASC) VISIBLE,
  INDEX `summary_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `summary_course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `summary_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`course` (`course_id`),
  CONSTRAINT `summary_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
