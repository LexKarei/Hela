.PHONY: up down logs install check

up:        ## start the local stack
	docker compose up -d

down:      ## stop the local stack
	docker compose down

logs:      ## follow logs
	docker compose logs -f

install:   ## install JS dependencies
	pnpm install

check:     ## run the same checks CI runs for the web side
	pnpm lint && pnpm typecheck && pnpm test && pnpm build
