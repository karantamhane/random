package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if((c < 0)||(r < 0))  throw new java.util.NoSuchElementException
    else {
      if((c == 0)||(c == r)) 1
      else pascal(c-1, r-1) + pascal(c, r-1)
    }
  }

  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
    def bal(counter: Int, str: List[Char]): Boolean = {
      //print("counter: " + counter + " str: " + str)
      //println()
      if(str.isEmpty) counter == 0
      else {
        if(str.head == ')') {
          if(counter <= 0) false
          else bal(counter-1, str.tail)
        }
        else {
          if(str.head == '(') bal(counter+1, str.tail)
          else bal(counter, str.tail)
        }
      }
    }
    bal(0, chars)
  }

  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if(money < 0 || coins.isEmpty) 0
    else {
      if(money == 0) 1
      else countChange(money-coins.head, coins) + countChange(money, coins.tail)
    }
  }
}
