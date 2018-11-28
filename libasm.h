/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jle-quel <jle-quel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/18 17:50:03 by ysan-seb          #+#    #+#             */
/*   Updated: 2018/11/28 22:20:40 by jle-quel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
#define LIBFTS_H

#include <stdlib.h>

void ft_bzero(void *s, size_t n);
int ft_puts(const char *s);
char *ft_strcat(char *restrict s1, const char *restrict s2);
char *ft_strncat(char *restrict s1, const char *restrict s2, size_t n);

#endif
