CREATE DATABASE wordpress
  DEFAULT CHAR SET utf8mb4
  COLLATE utf8mb4_general_ci;

CREATE TABLE wp_commentmeta
(
  meta_id    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  comment_id BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  meta_key   VARCHAR(255)                NULL,
  meta_value LONGTEXT                    NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX comment_id
  ON wp_commentmeta (comment_id);

CREATE INDEX meta_key
  ON wp_commentmeta (meta_key);

CREATE TABLE wp_comments
(
  comment_ID           BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  comment_post_ID      BIGINT UNSIGNED DEFAULT '0'            NOT NULL,
  comment_author       TINYTEXT                               NOT NULL,
  comment_author_email VARCHAR(100) DEFAULT ''                NOT NULL,
  comment_author_url   VARCHAR(200) DEFAULT ''                NOT NULL,
  comment_author_IP    VARCHAR(100) DEFAULT ''                NOT NULL,
  comment_date         DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  comment_date_gmt     DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  comment_content      TEXT                                   NOT NULL,
  comment_karma        INT DEFAULT '0'                        NOT NULL,
  comment_approved     VARCHAR(20) DEFAULT '1'                NOT NULL,
  comment_agent        VARCHAR(255) DEFAULT ''                NOT NULL,
  comment_type         VARCHAR(20) DEFAULT ''                 NOT NULL,
  comment_parent       BIGINT UNSIGNED DEFAULT '0'            NOT NULL,
  user_id              BIGINT UNSIGNED DEFAULT '0'            NOT NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX comment_post_ID
  ON wp_comments (comment_post_ID);

CREATE INDEX comment_author_email
  ON wp_comments (comment_author_email);

CREATE INDEX comment_date_gmt
  ON wp_comments (comment_date_gmt);

CREATE INDEX comment_approved_date_gmt
  ON wp_comments (comment_approved, comment_date_gmt);

CREATE INDEX comment_parent
  ON wp_comments (comment_parent);

CREATE TABLE wp_links
(
  link_id          BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  link_url         VARCHAR(255) DEFAULT ''                NOT NULL,
  link_name        VARCHAR(255) DEFAULT ''                NOT NULL,
  link_image       VARCHAR(255) DEFAULT ''                NOT NULL,
  link_target      VARCHAR(25) DEFAULT ''                 NOT NULL,
  link_description VARCHAR(255) DEFAULT ''                NOT NULL,
  link_visible     VARCHAR(20) DEFAULT 'Y'                NOT NULL,
  link_owner       BIGINT UNSIGNED DEFAULT '1'            NOT NULL,
  link_rating      INT DEFAULT '0'                        NOT NULL,
  link_updated     DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  link_rel         VARCHAR(255) DEFAULT ''                NOT NULL,
  link_notes       MEDIUMTEXT                             NOT NULL,
  link_rss         VARCHAR(255) DEFAULT ''                NOT NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX link_visible
  ON wp_links (link_visible);

CREATE TABLE wp_options
(
  option_id    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  option_name  VARCHAR(191) DEFAULT ''   NOT NULL,
  option_value LONGTEXT                  NOT NULL,
  autoload     VARCHAR(20) DEFAULT 'yes' NOT NULL,
  CONSTRAINT option_name
  UNIQUE (option_name)
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE TABLE wp_postmeta
(
  meta_id    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  post_id    BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  meta_key   VARCHAR(255)                NULL,
  meta_value LONGTEXT                    NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX post_id
  ON wp_postmeta (post_id);

CREATE INDEX meta_key
  ON wp_postmeta (meta_key);

CREATE TABLE wp_posts
(
  ID                    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  post_author           BIGINT UNSIGNED DEFAULT '0'            NOT NULL,
  post_date             DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_date_gmt         DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_content          LONGTEXT                               NOT NULL,
  post_title            TEXT                                   NOT NULL,
  post_excerpt          TEXT                                   NOT NULL,
  post_status           VARCHAR(20) DEFAULT 'publish'          NOT NULL,
  comment_status        VARCHAR(20) DEFAULT 'open'             NOT NULL,
  ping_status           VARCHAR(20) DEFAULT 'open'             NOT NULL,
  post_password         VARCHAR(255) DEFAULT ''                NOT NULL,
  post_name             VARCHAR(200) DEFAULT ''                NOT NULL,
  to_ping               TEXT                                   NOT NULL,
  pinged                TEXT                                   NOT NULL,
  post_modified         DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_modified_gmt     DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  post_content_filtered LONGTEXT                               NOT NULL,
  post_parent           BIGINT UNSIGNED DEFAULT '0'            NOT NULL,
  guid                  VARCHAR(255) DEFAULT ''                NOT NULL,
  menu_order            INT DEFAULT '0'                        NOT NULL,
  post_type             VARCHAR(20) DEFAULT 'post'             NOT NULL,
  post_mime_type        VARCHAR(100) DEFAULT ''                NOT NULL,
  comment_count         BIGINT DEFAULT '0'                     NOT NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX post_author
  ON wp_posts (post_author);

CREATE INDEX post_name
  ON wp_posts (post_name);

CREATE INDEX post_parent
  ON wp_posts (post_parent);

CREATE INDEX type_status_date
  ON wp_posts (post_type, post_status, post_date, ID);

CREATE TABLE wp_term_relationships
(
  object_id        BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  term_taxonomy_id BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  term_order       INT DEFAULT '0'             NOT NULL,
  PRIMARY KEY (object_id, term_taxonomy_id)
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX term_taxonomy_id
  ON wp_term_relationships (term_taxonomy_id);

CREATE TABLE wp_term_taxonomy
(
  term_taxonomy_id BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  term_id          BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  taxonomy         VARCHAR(32) DEFAULT ''      NOT NULL,
  description      LONGTEXT                    NOT NULL,
  parent           BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  count            BIGINT DEFAULT '0'          NOT NULL,
  CONSTRAINT term_id_taxonomy
  UNIQUE (term_id, taxonomy)
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX taxonomy
  ON wp_term_taxonomy (taxonomy);

CREATE TABLE wp_termmeta
(
  meta_id    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  term_id    BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  meta_key   VARCHAR(255)                NULL,
  meta_value LONGTEXT                    NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX term_id
  ON wp_termmeta (term_id);

CREATE INDEX meta_key
  ON wp_termmeta (meta_key);

CREATE TABLE wp_terms
(
  term_id    BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  name       VARCHAR(200) DEFAULT '' NOT NULL,
  slug       VARCHAR(200) DEFAULT '' NOT NULL,
  term_group BIGINT(10) DEFAULT '0'  NOT NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX name
  ON wp_terms (name);

CREATE INDEX slug
  ON wp_terms (slug);

CREATE TABLE wp_usermeta
(
  umeta_id   BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  user_id    BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  meta_key   VARCHAR(255)                NULL,
  meta_value LONGTEXT                    NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX user_id
  ON wp_usermeta (user_id);

CREATE INDEX meta_key
  ON wp_usermeta (meta_key);

CREATE TABLE wp_users
(
  ID                  BIGINT UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  user_login          VARCHAR(60) DEFAULT ''                 NOT NULL,
  user_pass           VARCHAR(255) DEFAULT ''                NOT NULL,
  user_nicename       VARCHAR(50) DEFAULT ''                 NOT NULL,
  user_email          VARCHAR(100) DEFAULT ''                NOT NULL,
  user_url            VARCHAR(100) DEFAULT ''                NOT NULL,
  user_registered     DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
  user_activation_key VARCHAR(255) DEFAULT ''                NOT NULL,
  user_status         INT DEFAULT '0'                        NOT NULL,
  display_name        VARCHAR(250) DEFAULT ''                NOT NULL
)
  ENGINE = InnoDB
  COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX user_login_key
  ON wp_users (user_login);

CREATE INDEX user_nicename
  ON wp_users (user_nicename);

CREATE INDEX user_email
  ON wp_users (user_email);

