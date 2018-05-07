text = File.read('seneca-clean.html')

letters = text.split('<p>&nbsp;')
letters.shift

letters.map do |l|
  name = l.split('"')[1]
  content = "<h2>#{l.split('<h2>')[1]}"
    .gsub(/\((\d+)\)/, '<sup>\1</sup>')
    .gsub(/(\s-\s)/, '&nbsp;— ')
    .gsub(/(\s--\s)/, '&nbsp;— ')
    .gsub(/(--)/, '—')
  html = <<-FOO
<html lang="uk">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700i" rel="stylesheet">
  <link rel="stylesheet" href="/style.css">
</head>
<body>
  <header>
    <h1><a href="/">Моральні листи до Луцілія</a></h1>
    <p>Луцій Анней Сенека</p>
  </header>

  <main>
    <article>
      #{content}
    </article>
  </main>

  <footer>
    <a href='/'>Зміст</a>
    &nbsp;&nbsp;
    <a href='/expl.html'>Примітки</a>
  </footer>
</body>
</html>
FOO

  File.open("#{name}.html", 'w') { |f| f.write(html) }
end
