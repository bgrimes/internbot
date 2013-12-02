yourmoms = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMBK0-Wjh780ScVTq-fBSGjgzWqD10rP_hVM3UuSrSii4xWWUJXg"
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTL8_sNrGqIP93e0mng1dKJQPaWMfKY3Jrzw8YzLN5IBSK2JqSv"
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ89M_GRnikCKK4TTlhD1Rh1pzlGZ9Cx8a9GCqcVLhfkfV1uJ_8"
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRYkR-qcfWmPbmh2WYKd99Z8EDlBv808RpKkGI-2rx9JYuFfS_VRA"
]

module.exports = (robot) ->
  robot.hear /your mom/i, (msg) ->
    msg.send msg.random yourmoms
