.PHONY: get_pinggy_token install

get_pinggy_token:
	@echo "Enter your Pinggy Token (press Enter to skip):"
	@read PINGGY_TOKEN; \
	if [ -z "$$PINGGY_TOKEN" ]; then \
	  echo "No token entered — use localhost"; \
	else \
	  echo "PINGGY_TOKEN=$$PINGGY_TOKEN" >> .env; \
	  echo "Token saved."; \
	fi



install: get_pinggy_token
