# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %(app lib config test spec feature)

## Uncomment to clear the screen before every task
# clearing :on

guard :shell do
  watch /.*/ do |m|
    m[0] + " has changed."
    system("bundle exec ruby #{m[0]}")
  end
end
