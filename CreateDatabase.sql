-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DataManagementProject
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `DataManagementProject` ;

-- -----------------------------------------------------
-- Schema DataManagementProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DataManagementProject` DEFAULT CHARACTER SET utf8 ;
USE `DataManagementProject` ;

-- -----------------------------------------------------
-- Table `DataManagementProject`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`User` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`User` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `mid_name` VARCHAR(45) NULL DEFAULT 'null',
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(150) NULL,
  `role` VARCHAR(45) NULL,
  `pwd_hash` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Course` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Course Resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Course Resource` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Course Resource` (
  `resource_id` INT NOT NULL,
  `course_id` INT NULL,
  `resource_name` VARCHAR(80) NULL,
  `file_url` VARCHAR(200) NULL,
  `type` VARCHAR(45) NULL,
  `last_update_time` TIME NULL,
  PRIMARY KEY (`resource_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `course_resource_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `DataManagementProject`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Section` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Section` (
  `section_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `instructor_id` INT NULL,
  PRIMARY KEY (`section_id`, `course_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `instructor_id_idx` (`instructor_id` ASC) VISIBLE,
  UNIQUE INDEX `section_id_UNIQUE` (`section_id` ASC) VISIBLE,
  CONSTRAINT `course_section_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `DataManagementProject`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `section_instructor_id`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Quiz`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Quiz` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Quiz` (
  `quiz_id` INT NOT NULL,
  `section_id` INT NULL,
  `start_time` TIME NULL,
  `due_time` TIME NULL,
  PRIMARY KEY (`quiz_id`),
  INDEX `section_id_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `quiz_section_course_id`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Quiz_Submission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Quiz_Submission` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Quiz_Submission` (
  `q_submission_id` INT NOT NULL,
  `quiz_id` INT NULL,
  `student_id` INT NULL,
  `grade` INT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`q_submission_id`),
  INDEX `quiz_id_idx` (`quiz_id` ASC) VISIBLE,
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `quiz_sub_id`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `DataManagementProject`.`Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student_quiz_sub_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Quiz_Question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Quiz_Question` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Quiz_Question` (
  `question_id` INT NOT NULL,
  `quiz_id` INT NULL,
  `context` TEXT NULL,
  `full_mark` INT NULL,
  `correct_answer` TEXT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `quiz_id_idx` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `quiz_question_id`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `DataManagementProject`.`Quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Question_Submission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Question_Submission` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Question_Submission` (
  `submission_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `answer` TEXT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`submission_id`, `question_id`),
  INDEX `question_id_idx` (`question_id` ASC) VISIBLE,
  CONSTRAINT `assi_submission_id `
    FOREIGN KEY (`submission_id`)
    REFERENCES `DataManagementProject`.`Quiz_Submission` (`q_submission_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `question_sub_id`
    FOREIGN KEY (`question_id`)
    REFERENCES `DataManagementProject`.`Quiz_Question` (`question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Assignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Assignment` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Assignment` (
  `assignment_id` INT NOT NULL,
  `section_id` INT NULL,
  `assignment_title` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `due_date` DATE NULL,
  `available_date` DATE NULL,
  PRIMARY KEY (`assignment_id`),
  INDEX `secrtion_id_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `assi_section_id`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Assignment_Submission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Assignment_Submission` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Assignment_Submission` (
  `assignment_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `submission_time` TIME NOT NULL,
  `status` VARCHAR(50) NULL DEFAULT 'null',
  `grade` INT NULL DEFAULT NULL,
  PRIMARY KEY (`assignment_id`, `student_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `assignment_sub_id`
    FOREIGN KEY (`assignment_id`)
    REFERENCES `DataManagementProject`.`Assignment` (`assignment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assi_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Announcement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Announcement` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Announcement` (
  `announcement_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `recipient` VARCHAR(45) NOT NULL,
  `publish_time` TIME NOT NULL,
  `title` TEXT NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`announcement_id`),
  INDEX `author_id_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `author_id`
    FOREIGN KEY (`author_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Enrolls_in`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Enrolls_in` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Enrolls_in` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `section_id_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `enroll_section_id`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `enroll_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Study_Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Study_Section` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Study_Section` (
  `section_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `topic` VARCHAR(45) NULL,
  `ai_summary` TEXT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `user_id_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `user_study_section_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `study_section_section`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Student_Notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Student_Notes` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Student_Notes` (
  `note_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `content` TEXT NULL,
  `create_date` DATE NOT NULL,
  `last_update` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `section_id_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `student_note_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `section_note_id`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Calendar_Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Calendar_Event` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Calendar_Event` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `event_name` VARCHAR(45) NULL DEFAULT 'null',
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`AI_Query`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`AI_Query` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`AI_Query` (
  `query_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `context` TEXT NULL,
  `response` TEXT NULL,
  PRIMARY KEY (`query_id`),
  INDEX `user_query_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_query_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Performance_Stat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Performance_Stat` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Performance_Stat` (
  `stat_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `metric_type` VARCHAR(45) NOT NULL,
  `value` INT NOT NULL,
  `record_time` TIME NOT NULL,
  PRIMARY KEY (`stat_id`),
  INDEX `user_performance_stat_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_performance_stat`
    FOREIGN KEY (`user_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DataManagementProject`.`Teach`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DataManagementProject`.`Teach` ;

CREATE TABLE IF NOT EXISTS `DataManagementProject`.`Teach` (
  `staff_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  `course_id` INT NULL,
  PRIMARY KEY (`staff_id`, `section_id`),
  INDEX `teach_section_id_idx` (`section_id` ASC) VISIBLE,
  INDEX `teach_course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `teach_section_id`
    FOREIGN KEY (`section_id`)
    REFERENCES `DataManagementProject`.`Section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teach_staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `DataManagementProject`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teach_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `DataManagementProject`.`Course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
