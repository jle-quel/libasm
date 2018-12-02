#include <libasm.h>
#include <stdio.h>
#include <strings.h>
#include <fcntl.h>
#include <unistd.h>
#include <ctype.h>

////////////////////////////////////////////////////////////////////////////////
/// STATIC FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

static void test_memalloc(void)
{
	char *ptr = NULL;

	ptr = ft_memalloc(0);

	if (ptr == NULL)
		printf("Ok\n");

	ptr = ft_memalloc(42);

	for (uint32_t index = 0; index < 42; index++)
		printf("%d", ptr[index]);

	printf("\n");

	free((void *)ptr);
}

static void test_strchr(void)
{
	char *str = "Salut a tous";

	printf("%s\n", ft_strchr(NULL, 'a'));

	printf("search for \'v\' in %s\n", str);
	printf("%s\n", strchr("salut", 'v'));
	printf("search for \'v\' in %s\n", str);
	printf("%s\n", ft_strchr("salut", 'v'));

	printf("search for \'0x0\' in %s\n", str);
	printf("%s\n", strchr("salut", 0x0));
	printf("search for \'0x0\' in %s\n", str);
	printf("%s\n", ft_strchr("salut", 0x0));

	printf("search for \'a\' in %s\n", str);
	printf("%s\n", strchr("salut", 'a'));
	printf("search for \'a\' in %s\n", str);
	printf("%s\n", ft_strchr("salut", 'a'));
}

static void test_putchar(void)
{
	ft_putchar('a', 1);
	ft_putchar('\n', 1);
}

static void test_putendl(void)
{
	int fd;

	fd = open("file", O_RDWR | O_CREAT, 0644);
	if (fd == -1)
		printf("ERROR\n");

	ft_putendl(NULL, 1);
	ft_putendl("Salut", 2);
	ft_putendl("Salut", fd);

	close(fd);
}

static void test_strncat(void)
{
	char *hello = "hello ";
	char *world = "world";
	char *mine = NULL;
	char *real = NULL;

	mine = malloc(sizeof(char) * 42);
	ft_bzero(mine, 42);
	real = malloc(sizeof(char) * 42);
	ft_bzero(real, 42);

	printf("%s\n", ft_strncat(NULL, NULL, strlen(hello)));
	mine = ft_strncat(mine, hello, strlen(hello));
	real = strncat(real, hello, strlen(hello));
	printf("hello == %s\n", mine);
	printf("hello == %s\n", real);
	printf("hello world == %s\n", ft_strncat(mine, world, strlen(world)));
	printf("hello world == %s\n", strncat(real, world, strlen(world)));

	free(mine);
	free(real);
}

static void test_strdup(void)
{
	char *mine = NULL;
	char *real = NULL;

	printf("%s\n", ft_strdup(NULL));
	mine = ft_strdup("salut");
	real = strdup("salut");

	printf("%s\n", mine);
	printf("%s\n", real);

	free(mine);
	free(real);
}

static void test_memcpy(void)
{
	char *mine = NULL;
	char *real = NULL;

	mine = malloc(42);
	real = malloc(42);

	ft_bzero(mine, 42);
	ft_bzero(real, 42);

	ft_memcpy(NULL, "hello", 4);

	ft_memcpy(mine, "hello", 4);
	memcpy(real, "hello", 4);

	printf("%s\n", mine);
	printf("%s\n", real);

	free(mine);
	free(real);
}

static void test_memset(void)
{
	char *mine = NULL;
	char *real = NULL;

	mine = malloc(42);
	real = malloc(42);

	ft_bzero(mine, 42);
	ft_bzero(real, 42);

	ft_memset(NULL, 'a', 9);
	ft_memset(mine, 'a', 9);
	memset(real, 'a', 9);

	printf("%s\n", mine);
	printf("%s\n", real);

	free(mine);
	free(real);
}

static void test_strlen(void)
{
	char *q = "";
	char *w = "salut";

	printf("%lu\n", ft_strlen(NULL));

	printf("%lu\n", strlen(q));
	printf("%lu\n", ft_strlen(q));

	printf("%lu\n", strlen(w));
	printf("%lu\n", ft_strlen(w));
}

static void test_toupper(void)
{
	printf("%c\n", toupper('a'));
	printf("%c\n", toupper('A'));
	printf("%c\n", toupper('!'));

	printf("%c\n", ft_toupper('a'));
	printf("%c\n", ft_toupper('A'));
	printf("%c\n", ft_toupper('!'));
}

static void test_tolower(void)
{
	printf("%c\n", tolower('a'));
	printf("%c\n", tolower('A'));
	printf("%c\n", tolower('!'));

	printf("%c\n", ft_tolower('a'));
	printf("%c\n", ft_tolower('A'));
	printf("%c\n", ft_tolower('!'));
}

static void test_isprint(void)
{
	printf("%d\n", isprint('a'));
	printf("%d\n", isprint(12));

	printf("%d\n", ft_isprint('a'));
	printf("%d\n", ft_isprint(12));
}

static void test_isascii(void)
{
	printf("%d\n", isascii('a'));
	printf("%d\n", isascii(12));

	printf("%d\n", ft_isascii('a'));
	printf("%d\n", ft_isascii(12));
}

static void test_isalnum(void)
{
	printf("%d\n", isalnum('a'));
	printf("%d\n", isalnum(12));

	printf("%d\n", ft_isalnum('a'));
	printf("%d\n", ft_isalnum(12));
}

static void test_isdigit(void)
{
	printf("%d\n", isdigit('a'));
	printf("%d\n", isdigit('0'));

	printf("%d\n", ft_isdigit('a'));
	printf("%d\n", ft_isdigit('0'));
}

static void test_isalpha(void)
{
	printf("%d\n", isalpha('a'));
	printf("%d\n", isalpha('0'));

	printf("%d\n", ft_isalpha('a'));
	printf("%d\n", ft_isalpha('0'));
}

static void test_strcat(void)
{
	char *hello = "hello ";
	char *world = "world";
	char *mine = NULL;
	char *real = NULL;

	mine = malloc(sizeof(char) * 42);
	ft_bzero(mine, 42);
	real = malloc(sizeof(char) * 42);
	ft_bzero(real, 42);

	printf("%s\n", ft_strcat(NULL, NULL));
	mine = ft_strcat(mine, hello);
	real = strcat(real, hello);
	printf("hello == %s\n", mine);
	printf("hello == %s\n", real);
	printf("hello world == %s\n", ft_strcat(mine, world));
	printf("hello world == %s\n", strcat(real, world));

	free(mine);
	free(real);
}

static void test_puts(void)
{
	ft_puts("Hello");
	puts("Hello");

	ft_puts(NULL);
	puts(NULL);
}

static void test_cat(void)
{
	int fd;

	fd = open("Makefile", O_RDONLY, 0644);

	ft_cat(fd);

	close(fd);
}

////////////////////////////////////////////////////////////////////////////////
/// PUBLIC FUNCTION
////////////////////////////////////////////////////////////////////////////////

int main(void)
{
	printf("ft_puts\n");
	test_puts();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_strcat\n");
	test_strcat();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isalpha\n");
	test_isalpha();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isdigit\n");
	test_isdigit();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isalnum\n");
	test_isalnum();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isascii\n");
	test_isascii();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isprint\n");
	test_isprint();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_isprint\n");
	test_isprint();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_tolower\n");
	test_tolower();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_toupper\n");
	test_toupper();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_strlen\n");
	test_strlen();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_memset\n");
	test_memset();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_memcpy\n");
	test_memcpy();
	printf("\n");

	printf("ft_strdup\n");
	test_strdup();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_strncat\n");
	test_strncat();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_memalloc\n");
	test_memalloc();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_strchr\n");
	test_strchr();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_putchar\n");
	test_putchar();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_putendl\n");
	test_putendl();
	printf("\n");

	printf("////////////////////////////////////////////////////////////////////////////////\n\n");

	printf("ft_cat\n");
	test_cat();
}