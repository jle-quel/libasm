#include <libasm.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

int main(void)
{
	for (int16_t index = -2; index < 129; index++)
	{
		// printf("%s ", isalpha(index) ? "true" : "false");
		// printf("%s\n", ft_isalpha(index) ? "true" : "false");

		// printf("%s ", isdigit(index) ? "true" : "false");
		// printf("%s\n", ft_isdigit(index) ? "true" : "false");

		// printf("%s ", isalnum(index) ? "true" : "false");
		// printf("%s\n", ft_isalnum(index) ? "true" : "false");

		// printf("%s ", isascii(index) ? "true" : "false");
		// printf("%s\n", ft_isascii(index) ? "true" : "false");

		// printf("%s ", isprint(index) ? "true" : "false");
		// printf("%s\n", ft_isprint(index) ? "true" : "false");

		// printf("%c ", tolower(index));
		// printf("%c\n", ft_tolower(index));

		printf("%c ", toupper(index));
		printf("%c\n", ft_toupper(index));
	}
}