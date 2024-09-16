from howblox_lib.exceptions import *

class HowbloxForbidden(HowbloxException):
    """Raised when a user is forbidden from using a command or
    Howblox does not have the proper permissions.
    """

class PromptException(HowbloxException):
    """Base exception for prompts."""

class CancelPrompt(PromptException):
    """Raised when a prompt is cancelled."""

class PageNotFound(PromptException):
    """Raised when a page is not found."""

class CancelCommand(HowbloxException):
    """Raised when a command is cancelled. This silently cancels the command."""

class PremiumRequired(CancelCommand):
    """Raised when a command requires premium."""

class BadArgument(HowbloxException):
    """Raised when a command argument is invalid."""

class CommandException(HowbloxException):
    """Base exception for commands."""

class AlreadyResponded(CommandException):
    """Raised when a command has already responded."""

class BindException(HowbloxException):
    """Base exception for binds."""

class BindConflictError(BindException):
    """Raised when a bind conflicts with another bind."""