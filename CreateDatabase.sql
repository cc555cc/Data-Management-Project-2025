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
-- Table `datamanagementproject`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`User` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`User` (
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
  INDEX `user_query_id_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `query_id_UNIQUE` (`query_id` ASC) VISIBLE,
  CONSTRAINT `user_query_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`Course` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`Course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`assignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`assignment` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`assignment` (
  `assignment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `assignment_title` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `due_date` DATETIME NULL DEFAULT NULL,
  `grade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  UNIQUE INDEX `assignment_id_UNIQUE` (`assignment_id` ASC) VISIBLE,
  INDEX `assignment_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `assignment_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assignment_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `event_id_UNIQUE` (`event_id` ASC) VISIBLE,
  CONSTRAINT `event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`Course_Resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`Course_Resource` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`Course_Resource` (
  `resource_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `resource_name` VARCHAR(80) NULL,
  `file_url` VARCHAR(200) NULL,
  `file_type` VARCHAR(45) NULL,
  `last_update_time` DATETIME NOT NULL,
  PRIMARY KEY (`resource_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `resource_id_UNIQUE` (`resource_id` ASC) VISIBLE,
  CONSTRAINT `course_resource_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`Course` (`course_id`))
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
    REFERENCES `datamanagementproject`.`User` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`Quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`Quiz` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`Quiz` (
  `quiz_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `time_spent` TIME NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`quiz_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `quiz_id_UNIQUE` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`Quiz_Question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`Quiz_Question` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`Quiz_Question` (
  `question_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `question` TEXT NULL,
  `user_answer` TEXT NULL,
  `correct_answer` TEXT NULL DEFAULT NULL,
  `full_mark` INT NULL DEFAULT NULL,
  `grade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `quiz_id_idx` (`quiz_id` ASC) VISIBLE,
  UNIQUE INDEX `question_id_UNIQUE` (`question_id` ASC) VISIBLE,
  CONSTRAINT `quiz_question_id`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `datamanagementproject`.`Quiz` (`quiz_id`))
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
  `last_update` DATETIME NULL,
  PRIMARY KEY (`note_id`),
  INDEX `student_id_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `note_id_UNIQUE` (`note_id` ASC) VISIBLE,
  INDEX `course_note_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `user_note_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`),
  CONSTRAINT `course_note_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `datamanagementproject`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`section_id`),
  UNIQUE INDEX `section_id_UNIQUE` (`section_id` ASC) VISIBLE,
  CONSTRAINT `user_study_section_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `datamanagementproject`.`User` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `datamanagementproject`.`Summary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamanagementproject`.`Summary` ;

CREATE TABLE IF NOT EXISTS `datamanagementproject`.`Summary` (
  `sum_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date_created` DATETIME NULL,
  `file_url` VARCHAR(80) NULL,
  PRIMARY KEY (`sum_id`),
  UNIQUE INDEX `sum_id_UNIQUE` (`sum_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
