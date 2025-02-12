/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ioner <ioner@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/12 11:41:02 by ioner             #+#    #+#             */
/*   Updated: 2025/02/12 12:03:44 by ioner            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include <unistd.h>

void	ft_putnbr(int nbr)
{
	char	*digit;

	digit = "0123456789";
	if (nbr >= 10)
		ft_putnbr(nbr / 10);
	write(1, &digit[nbr % 10], 1);
}

void	ft_bit_advance(int sig)
{
	static int	bit = 128;
	static int	ptr = 0;

	if (sig == SIGUSR1)
		ptr = ptr + bit;
	bit = bit / 2;
	if (bit == 0)
	{
		if (ptr == 0)
			write(1, "\n", 1);
		write(1, &ptr, 1);
		bit = 128;
		ptr = 0;
	}
}

int	main(void)
{
	write(1, "PID : ", 6);
	ft_putnbr(getpid());
	write(1, "\n", 1);
	signal(SIGUSR1, ft_bit_advance);
	signal(SIGUSR2, ft_bit_advance);
	while (1)
	{
		usleep(10);
		pause();
	}
}
