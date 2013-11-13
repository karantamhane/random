#map!
def codename(names):
  return map(hash, names)

#use map, reduce, filter to calc avg height
def avg_height(people):
  height_data = filter(lambda x: 'height' in x, people)
  heights = reduce(lambda a,x: a + x['height'], height_data, 0)
  count = reduce(lambda a,x: a + 1, height_data, 0)
  try:
    avg = heights/count
    return avg
  except ZeroDivisionError:
    print("Cannot divide by zero")

#string parsing using rules zero and one
def zero(s):
  return s[0] == '0'

def one(s):
  return s[0] == '1'

def rule_sequence(string, rules):
  if rules == []:
    return string
  elif rules[0](string):
    return rule_sequence(string[1:], rules[1:])

# Return a fn that is a rule
def character_rule(c):
  def func(s):
    return s[0] == c
  return func


# Implement pipeline_each so that the pipeline_each call
# above returns:
 
# => [{'name': 'Sunset Rubdown', 'active': False, 'country': 'Canada'},
#     {'name': 'Women', 'active': False, 'country': 'Canada' },
#     {'name': 'A Silver Mt Zion', 'active': True, 'country': 'Canada'}]

def assoc(_d, key, value):
    from copy import deepcopy
    d = deepcopy(_d)
    d[key] = value
    return d
 
def set_canada_as_country(band):
    return assoc(band, 'country', "Canada")
 
def strip_punctuation_from_name(band):
    return assoc(band, 'name', band['name'].replace('.', ''))
 
def capitalize_names(band):
    return assoc(band, 'name', band['name'].title())

def pipeline_each(bands, lst_of_fns):
  return reduce(lambda a,x: map(x, a), lst_of_fns, bands)


# More abstraction by generalizing all functions to be outputs of call()

def call(fn, key):
  def apply_fn(record):
    return assoc(record, key, fn(record.get(key)))
  return apply_fn


# Implement pluck so that the pipeline_each call
# above returns the bands below.
# I have given you my implementation of pipeline_each 
# just in case yours is not finished.
 
# => [{'name': 'Sunset Rubdown', 'country': 'Canada'},
#     {'name': 'Women', 'country': 'Canada' },
#     {'name': 'A Silver Mt Zion', 'country': 'Canada'}]

def pluck(lst_of_keys):
  def apply_pluck(band):
    return reduce(lambda a,x: assoc(a, x, band.get(x)), lst_of_keys, {})
  return apply_pluck














