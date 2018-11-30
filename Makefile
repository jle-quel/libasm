# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jle-quel <jle-quel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/07 09:40:00 by ysan-seb          #+#    #+#              #
#    Updated: 2018/11/30 16:12:39 by jle-quel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
### INIT 
################################################################################

.PHONY:			all, clean, fclean, re

CC			=	nasm

CFLAG		=	-f macho64

NAME		=	libfts.a

SRC_PATH	=	./src/

OBJ_PATH	=	./obj/

INC_PATH	=	./inc/

SRC_NAME	=	ft_bzero.s		\
				ft_isalnum.s	\
				ft_isalpha.s	\
				ft_isascii.s	\
				ft_isdigit.s	\
				ft_isprint.s	\
				ft_puts.s		\
				ft_strcat.s		\
				ft_strncat.s	\
				ft_tolower.s	\
				ft_toupper.s	\
				ft_strlen.s		\
				ft_memcpy.s		\
				ft_memset.s		\
				# ft_strdup.s		\

OBJ_NAME =		$(SRC_NAME:.s=.o)

INC_NAME =		libasm.h

SRC =			$(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ =			$(addprefix $(OBJ_PATH),$(OBJ_NAME))
INC =			$(addprefix $(INC_PATH),$(INC_NAME))

################################################################################
### COMPILATION 
################################################################################

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $@ $^
	@ranlib $(NAME)

$(OBJ_PATH)%.o:	$(SRC_PATH)%.s
	@mkdir -p $(OBJ_PATH)
	@$(CC) $(CFLAG) -I$(INC_PATH)  $< -o $@

clean:
	@rm -rf $(OBJ_PATH)

fclean: clean
	@rm -f $(NAME)

re: fclean
	@make