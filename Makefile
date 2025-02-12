SERVER          = server
SERVER_SRC      = server.c
SERVER_OBJS     = $(SERVER_SRC:.c=.o)

CLIENT          = client
CLIENT_SRC      = client.c
CLIENT_OBJS     = $(CLIENT_SRC:.c=.o)

BONUS_SRC       = client_bonus.c server_bonus.c
BONUS_OBJS      = $(BONUS_SRC:.c=.o)

SERVER_BONUS    = server_bonus
CLIENT_BONUS    = client_bonus

BONUS_SERVER_SRC = server_bonus.c
BONUS_CLIENT_SRC = client_bonus.c

BONUS_SERVER_OBJS = $(BONUS_SERVER_SRC:.c=.o)
BONUS_CLIENT_OBJS = $(BONUS_CLIENT_SRC:.c=.o)

CC              = cc
RM              = rm -rf
FLAGS           = -Wall -Werror -Wextra

all: $(SERVER) $(CLIENT)

$(SERVER): $(SERVER_OBJS)
	$(CC) $(FLAGS) $(SERVER_OBJS) -o $(SERVER)

$(CLIENT): $(CLIENT_OBJS)
	$(CC) $(FLAGS) $(CLIENT_OBJS) -o $(CLIENT)

bonus: $(SERVER_BONUS) $(CLIENT_BONUS)

$(SERVER_BONUS): $(BONUS_SERVER_OBJS)
	$(CC) $(FLAGS) $(BONUS_SERVER_OBJS) -o $(SERVER_BONUS)

$(CLIENT_BONUS): $(BONUS_CLIENT_OBJS)
	$(CC) $(FLAGS) $(BONUS_CLIENT_OBJS) -o $(CLIENT_BONUS)

%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@

clean:
	$(RM) $(CLIENT_OBJS) $(SERVER_OBJS) $(BONUS_SERVER_OBJS) $(BONUS_CLIENT_OBJS)

fclean: clean
	$(RM) $(SERVER) $(CLIENT) $(SERVER_BONUS) $(CLIENT_BONUS)

re: fclean all

.PHONY: all clean fclean re bonus
