from blacksheep import Request, ok
from blacksheep.server.controllers import APIController, Controller, get

from howblox_lib.database import redis
from resources.howblox import howblox


class Health(APIController):
    """Results in a path of <URL>/api/health/.."""

    @get("/")
    async def check_health(self, _request: Request):
        """Endpoint to check if the service is alive and healthy"""

        # These will raise exceptions if they fail.
        await howblox.rest.fetch_application()
        await redis.ping()

        return ok("OK. Service is healthy")