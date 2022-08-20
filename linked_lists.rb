class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  def append(value)
    if !self.head.nil?
      cur = self.head
      status = true
      while status
        if cur.next_node.nil?
          cur.next_node = Node.new(value)
          status = false
        else
          cur = cur.next_node
        end
      end
    end

    if self.head.nil?
      self.head = Node.new(value)
    end
  end

  def prepend(value)
    if !self.head.nil?
      prev = Node.new(value, self.head)
      self.head = prev
    end

    if self.head.nil?
      self.head = Node.new(value)
    end
  end

  def size
    if self.head.nil?
      return 0
    end

    if !self.head.nil?
      cur = self.head
      size = 1
      status = true
      while status
        if cur.next_node.nil?
          return size
        else
          cur = cur.next_node
          size += 1
        end
      end
    end
  end

  def head
    return @head
  end

  def tail
    if self.head.nil?
      return @head
    end

    if !self.head.nil?
      cur = self.head
      status = true
      while status
        if cur.next_node.nil?
          return cur
        else
          cur = cur.next_node
        end
      end
    end
  end

  def at(index)
    cur = self.head
    i = 0
    status = true
    return cur if index == 0
    while i < index
        cur = cur.next_node
        i += 1
    end
  cur
  end

  def pop
    if self.head.nil?
      return 'List is empty'
    end

    prev = self.head
    cur = prev.next_node

    status = true
    while status
      puts "prev: #{prev}"
      puts "cur: #{cur}"
      if cur.next_node.nil?
        prev.next_node = nil
        status = false
      else
         prev = cur
         cur = cur.next_node
      end
    end
  end

  def contains?(value)
    if self.head.nil?
      return 'List is empty'
    end

      cur = self.head
      status = true
      while status
        if cur.next_node.nil?
          return false
          status = false

        elsif cur.value == value || cur.next_node.value == value
          return true
          status = false
        else
          cur = cur.next_node
        end
      end
  end

  def find(value)
    if self.head.nil?
      return 'List is empty'
    end

    cur = self.head
    i = 0
    status = true
    while status
      if cur.next_node.nil?
        return nil
        status = false

      elsif cur.value == value
        return i
        status = false
      elsif cur.next_node.value == value
        return i + 1
        status = false
      else
        cur = cur.next_node
        i += 1
      end
    end
  end

  def to_s
    if self.head.nil?
      return 'List is empty'
    end
    cur = self.head
    status = true
    while status
      if cur.next_node.nil?
        print "( #{cur.value} ) -> nil"
        status = false
      else
        print "( #{cur.value} ) -> "
        cur = cur.next_node
      end
    end 
  end

  def insert_at(value, index)
    new_node = Node.new(value, self.at(index))
    if index == 0
      self.head = new_node
    else
      self.at(index - 1).next_node = new_node
    end
  end

  def remove_at(index)
    if index == 0
      self.head = self.at(index + 1)
    else
      self.at(index - 1).next_node = self.at(index + 1)
    end
  end
end

list = LinkedList.new
list.append(3)
list.prepend(1)
list.append(6)
list.to_s
p list.at(1)
list.remove_at(1)
list.to_s
list.insert_at(3, 1)
list.to_s