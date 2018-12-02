/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jle-quel <jle-quel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/18 17:50:03 by ysan-seb          #+#    #+#             */
/*   Updated: 2018/12/02 16:13:58 by jle-quel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
#define LIBFTS_H

#include <stdlib.h>

void ft_bzero(void *s, size_t n);
int ft_puts(const char *s);
char *ft_strcat(char *restrict s1, const char *restrict s2);
int ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isalnum(int c);
int ft_isascii(int c);
int ft_isprint(int c);
int ft_tolower(int c);
int ft_toupper(int c);
size_t ft_strlen(const char *s);
void *ft_memset(void *b, int c, size_t len);
void *ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
char *ft_strdup(const char *s1);
void ft_cat(int fd);

char *ft_strncat(char *restrict s1, const char *restrict s2, size_t n);
void *ft_memalloc(size_t const size);
char *ft_strchr(const char *s, int const c);
void ft_putchar(const char c, int const fd);
void ft_putendl(const char *s, int const fd);

#endif
