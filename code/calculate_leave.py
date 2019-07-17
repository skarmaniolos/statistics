#!/usr/bin/env python3
# Computing the days off given leave hours.

import click


def time_off(a_leave, p_leave):
        total_hours = a_leave + p_leave
        days_off = total_hours / 7.6
        weeks_off = days_off / 5.0
        print(' =================== ')
        print('  Days off  :  {}'.format(round(days_off,2)))
        print('  Weeks off :  {}'.format(round(weeks_off,2)))
        print(' =================== ')


@click.command()
def main():
        a_leave = float(input('Enter your annual leave hours: '))
        p_leave = float(input('Enter your personal leave hours: '))
        time_off(a_leave, p_leave)


if __name__ == "__main__":
        main()
