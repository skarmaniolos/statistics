#!/usr/bin/env python3
# Computing my days off given leave hours.

import click


def time_off(a_leave, p_leave):
	total_hours = a_leave + p_leave
	days_off = total_hours / 7.6
	weeks_off = days_off / 5.0
	print(' =================== ')
	print('  Days off  :  {}'.format(round(days_off,2)))
	print('  Weeks off :  {}'.format(round(weeks_off,2)))
	print(' =================== ')
  print('        ...          ')
  main()

	
def pay_calc(a_leave, p_leave, hourly_rate):
  total_hours = a_leave + p_leave
  total_pay = total_hours * hourly_rate
  print(' =================== ')
  print('  Total Hours:  {}').format(round(total_hours,2))
  print('  Total Pay  :  {}').format(round(total_pay,2))
  print(' =================== ')
  print('        ...          ')
  main()


def menu(option):
	if option == 1:
		a_leave = input('Enter your annual leave hours: ')
		p_leave = input('Enter your personal leave hours: ')
		time_off(a_leave, p_leave)
	elif option == 2:
		a_leave = input('Enter your annual leave hours: ')
		p_leave = input('Enter your personal leave hours: ')
		hourly_rate = input('Enter your hourly pay rate: ')
		pay_calc(a_leave, p_leave, hourly_rate)
	elif option == 0:
		exit()
		

def main():
	print(' =================== ')
	print('  Menu:')
	print('  1 : Time Off (Time)')
	print('  2 : Time Off ($)')
	print('  0 : Exit')
	print(' =================== ')
	option = input('>')
	menu(option)

main()
