

-- BEGIN generate DDL --

DROP DATABASE IF EXISTS it;

CREATE DATABASE it;

USE it;

CREATE TABLE ad_materials (
  id BIGINT NOT NULL,
  adPeriodId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  imageId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  weight BIGINT NOT NULL,
  endAt VARCHAR(10) NOT NULL,
  geo VARCHAR(32) NOT NULL,
  startAt VARCHAR(10) NOT NULL,
  tags VARCHAR(100) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE ad_periods (
  id BIGINT NOT NULL,
  adSlotId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  displayOrder BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  endAt VARCHAR(10) NOT NULL,
  startAt VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE ad_slots (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  height BIGINT NOT NULL,
  numAutoFill BIGINT NOT NULL,
  numSlots BIGINT NOT NULL,
  price BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  width BIGINT NOT NULL,
  alias VARCHAR(32) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  adAutoFill TEXT NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE articles (
  id BIGINT NOT NULL,
  categoryId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  imageId BIGINT NOT NULL,
  publishAt BIGINT NOT NULL,
  textId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  views BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  tags VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  INDEX IDX_CAT_PUB (categoryId,publishAt),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE attachments (
  id BIGINT NOT NULL,
  height INTEGER NOT NULL,
  width INTEGER NOT NULL,
  createdAt BIGINT NOT NULL,
  resourceId BIGINT NOT NULL,
  size BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  mime VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE boards (
  id BIGINT NOT NULL,
  locked BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  displayOrder BIGINT NOT NULL,
  topicNumber BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  tag VARCHAR(32) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  CONSTRAINT UNI_TAG UNIQUE (tag),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE categories (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  displayOrder BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  tag VARCHAR(32) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE eth_auths (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  expiresAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  address VARCHAR(42) NOT NULL,
  CONSTRAINT UNI_ADDR UNIQUE (address),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE headlines (
  id BIGINT NOT NULL,
  published BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  publishAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  INDEX IDX_PUB (published,publishAt),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE links (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE local_auths (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  passwd VARCHAR(64) NOT NULL,
  salt VARCHAR(64) NOT NULL,
  CONSTRAINT UNI_UID UNIQUE (userId),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE navigations (
  id BIGINT NOT NULL,
  blank BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  displayOrder BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  icon VARCHAR(32) NOT NULL,
  name VARCHAR(100) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE oauths (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  expiresAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  authProviderId VARCHAR(32) NOT NULL,
  authId VARCHAR(255) NOT NULL,
  authToken VARCHAR(255) NOT NULL,
  CONSTRAINT UNI_AUTH UNIQUE (authProviderId, authId),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE passkey_auths (
  id BIGINT NOT NULL,
  alg INTEGER NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  credentialId VARCHAR(32) NOT NULL,
  device VARCHAR(100) NOT NULL,
  pubKey VARCHAR(255) NOT NULL,
  transports VARCHAR(100) NOT NULL,
  CONSTRAINT UNI_PUBKEY UNIQUE (pubKey),
  INDEX IDX_UID (userId),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE passkey_challenges (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  expiresAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  challenge VARCHAR(255) NOT NULL,
  CONSTRAINT UNI_CLG UNIQUE (challenge),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE replies (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  topicId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  userName VARCHAR(100) NOT NULL,
  userImageUrl VARCHAR(1000) NOT NULL,
  content TEXT NOT NULL,
  INDEX IDX_TOPICID (topicId),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE resources (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  encoding VARCHAR(50) NOT NULL,
  hash VARCHAR(64) NOT NULL,
  content MEDIUMTEXT NOT NULL,
  CONSTRAINT UNI_HASH UNIQUE (hash),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE settings (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  settingGroup VARCHAR(32) NOT NULL,
  settingKey VARCHAR(32) NOT NULL,
  settingValue TEXT NOT NULL,
  CONSTRAINT UNI_GRP_KEY UNIQUE (settingGroup, settingKey),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE single_pages (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  publishAt BIGINT NOT NULL,
  textId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  tags VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE texts (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  hash VARCHAR(64) NOT NULL,
  content TEXT NOT NULL,
  CONSTRAINT UNI_HASH UNIQUE (hash),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE topics (
  id BIGINT NOT NULL,
  locked BOOL NOT NULL,
  boardId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  refId BIGINT NOT NULL,
  replyNumber BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  refType VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  userName VARCHAR(100) NOT NULL,
  userImageUrl VARCHAR(1000) NOT NULL,
  content TEXT NOT NULL,
  INDEX IDX_BOARDID (boardId),
  INDEX IDX_REFID (refId),
  INDEX IDX_UPDATEDAT (updatedAt),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE users (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  lockedUntil BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  role VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  imageUrl VARCHAR(1000) NOT NULL,
  CONSTRAINT UNI_EMAIL UNIQUE (email),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE wiki_pages (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  displayOrder BIGINT NOT NULL,
  parentId BIGINT NOT NULL,
  publishAt BIGINT NOT NULL,
  textId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  views BIGINT NOT NULL,
  wikiId BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  INDEX IDX_WIKIID (wikiId),
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE wikis (
  id BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  imageId BIGINT NOT NULL,
  publishAt BIGINT NOT NULL,
  textId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  views BIGINT NOT NULL,
  tag VARCHAR(32) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB DEFAULT CHARSET=UTF8MB4;


-- END generate DDL --
