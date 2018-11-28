# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jle-quel <jle-quel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/07 09:40:00 by ysan-seb          #+#    #+#              #
#    Updated: 2018/11/28 21:27:45 by jle-quel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a

CC = gcc

FLAG = -Wall -Werror -Wextra

SRC =	ft_bzero.s	\
		ft_puts.s	\

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

%.o: %.s
	nasm -g -f macho64 -o $@ $< 

clean:
	@rm -rf $(OBJ)

fclean: clean
	@rm -rf $(NAME)

re: fclean
	make

.PHONY: all clean fclean re