class LinkedList
  attr_accessor :name, :head, :tail

  def initialize(name)
    @name = name
    @head = nil
    @tail = nil
  end

  def append(value)
    if @tail.nil?
      @tail = Node.new(value)
      @head = @tail
      puts "Adding first #{value}"
    else
      @tail.nest = Node.new(value)
      @tail = @tail.nest
      puts "Adding #{value}"
    end
  end

  def show_all_elements
    puts "Showing all elements from \"#{name} \" list."
    puts "End of list: #{@tail}"
    tmp = @head
    until tmp.nil?
      puts "Data: #{tmp.data}"
      puts "Next: #{tmp.nest}"
      tmp = tmp.nest
    end
  end

  def prepend(value)
    if @head.nil?
      tmp = Node.new(value)
      tmp.nest = @head
      @head = tmp
    else
      tmp = Node.new(value)
      tmp.nest = @head.nest
      @head = tmp
      @tail = @head
    end
  end

  def size
    puts 'Counting elements.'
    tmp = @head
    count = 0
    until tmp.nil?
      count += 1
      tmp = tmp.nest
    end
    count
  end

  def at(index)
    tmp = @head
    count = 0
    index.times do
      tmp = tmp.nest
    end
    tmp
  end

  def pop
    puts 'Poping...'
    tmp = at(size - 2)
    tmp.nest = nil
    @tail = tmp
  end

  def contains?(data_check)
    tmp = @head
    until tmp.nil?
      if tmp.data == data_check
        return true
      else
        tmp = tmp.nest
      end
    end
    false
  end

  def find(data_check)
    tmp = @head
    cont = 0
    until tmp.nil?
      if tmp.data == data_check
        return cont
      else
        tmp = tmp.nest
      end

      cont += 1
    end
    cont
  end
  
  def to_s
    tmp = @head
    string_result = ""
    until tmp.nil?
      string_result << "(#{tmp.data}) ->"      
      tmp = tmp.nest
    end
    string_result << " nil"
  end
end

class Node
  attr_accessor :data, :nest

  def initialize(data = nil, nest = nil, _index = nil)
    @nest = nest
    @data = data
  end
end

lista = LinkedList.new('lista')

lista.append('hola')
lista.append('bo')
lista.append('no digas bo, bo')
lista.append('ta bo, perdon bo')
lista.prepend('coso')
puts lista.head
puts lista.tail
lista.show_all_elements
puts lista.size
puts lista.at(2)
lista.pop
lista.show_all_elements
puts lista.contains?('no digas bo, bo')
puts lista.find('no digas bo, bo')
puts lista.to_s
