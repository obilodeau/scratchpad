#!/usr/bin/python

import time

from logbook import Logger, FileHandler, GroupHandler, StderrHandler
logger = Logger('TestingLogbook')

def substitute_loggers():
    logger.info("This should be printed on the screen")

    with FileHandler('logging.log'):
        logger.info("This should be printed in a file")

    logger.info("This should also be printed on the screen")

def substitute_loggers_different_levels():
    logger.info("This should be printed on the screen")

    with FileHandler('logging.log', level='ERROR'):
        logger.error("in with: This should be printed in a file")
        logger.info("in with: This should be printed on the screen")

    logger.info("This should also be printed on the screen")

def grouphandlers_basic():
    logger.info("out of group")

    with GroupHandler(StderrHandler()):
        logger.info("line1")
        time.sleep(5)
        logger.info("line2")

def grouphandlers_levels():
    logger.info("out of group")

    #with GroupHandler(StderrHandler(level='ERROR')):
    with GroupHandler(StderrHandler(level='ERROR', bubble=True)):
        logger.info("started processing")
        logger.error("we failed before we started")
        time.sleep(5)
        logger.error("we failed when we ended")

def log_dict():
    d = {'key1': 'value1', 'key2': 'value2'}

    # the following doesn't work, not of string type
    #logger.info("dictionary logged: " + d)

    # but these do: !r is for an explicit repr() call
    logger.info("dictionary logged: {!r}".format(d))
    # and str() also yields the same results
    logger.info("dictionary logged: {}".format(str(d)))
    # and !s adds an explicit str() call
    logger.info("dictionary logged: {!s}".format(d))

if __name__ == '__main__':
    #substitute_loggers()
    #substitute_loggers_different_levels()
    #grouphandlers_basic()
    #grouphandlers_levels()
    log_dict()
