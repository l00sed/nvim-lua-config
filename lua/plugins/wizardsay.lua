local M = {}

local wizard = [[
                      .
    █    ╓◉╖
   /___\   ╟◈╢       .
  //. .\\  ╙┰╜     .
  \] m [/   ┃
  /l\ /j\   ⌸     . O
 /. ~~~ ,\_/┃        .
 \\L___j^__/┃     o
  \/───v}   ┃   o  *  .
  |     ┃   ┃ ----------
  |     ┃   c(`        ')o
  |  l  ┃   ┃ \.      ,/
_/j  L  l\_ !_//^────^\\_
]]

local char_top_bottom = "─"
local char_sides = "│"
local char_top_left = "╭"
local char_top_right = "╮"
local char_bottom_right = "╯"
local char_bottom_left = "╰"

-- NOTE: Don't use the emdash "—" in quotes, it breaks the formatting

local predefined_quotes = {
  {
    "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.",
    "",
    "—Brian Kernighan",
  },
  {
    "If you don't finish then you're just busy, not productive.",
    "",
    "—Anonymous"
  },
  {
    "Adapting old programs to fit new machines usually means adapting new machines to behave like old ones.",
    "",
    "—Alan Perlis",
  },
  {
    "Fools ignore complexity. Pragmatists suffer it. Some can avoid it. Geniuses remove it.",
    "",
    "—Alan Perlis"
  },
  {
    "It is easier to change the specification to fit the program than vice versa.",
    "",
    "—Alan Perlis"
  },
  {
    "Simplicity does not precede complexity, but follows it.",
    "",
    "—Alan Perlis"
  },
  {
    "Optimization hinders evolution.",
    "",
    "—Alan Perlis"
  },
  {
    "Recursion is the root of computation since it trades description for time.",
    "",
    "—Alan Perlis"
  },
  {
    "It is better to have 100 functions operate on one data structure than 10 functions on 10 data structures.",
    "",
    "—Alan Perlis",
  },
  {
    "There is nothing quite so useless as doing with great efficiency something that should not be done at all.",
    "",
    "—Peter Drucker",
  },
  {
    "If you don't fail at least 90% of the time, you're not aiming high enough.",
    "",
    "—Alan Kay"
  },
  {
    "I think a lot of new programmers like to use advanced data structures and advanced language features as a way of demonstrating their ability. I call it the lion-tamer syndrome. Such demonstrations are impressive, but unless they actually translate into real wins for the project, avoid them.",
    "",
    "—Glyn Williams",
  },
  {
    "I would rather die of passion than of boredom.",
    "",
    "—Vincent Van Gogh"
  },
  {
    "If a system is to serve the creative spirit, it must be entirely comprehensible to a single individual.",
    "",
    "—Anonymous",
  },
  {
    "The computing scientist's main challenge is not to get confused by the complexities of his own making.",
    "",
    "—Edsger W. Dijkstra",
  },
  {
    "Progress in a fixed context is almost always a form of optimization. Creative acts generally don't stay in the context that they are in.",
    "",
    "—Alan Kay",
  },
  {
    "The essence of XML is this: the problem it solves is not hard, and it does not solve the problem well.",
    "",
    "—Phil Wadler",
  },
  {
    "A good programmer is someone who always looks both ways before crossing a one-way street.",
    "",
    "—Doug Linder",
  },
  {
    'Patterns mean "I have run out of language."',
    "",
    "—Rich Hickey"
  },
  {
    "Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.",
    "",
    "—John Woods",
  },
  {
    "Unix was not designed to stop its users from doing stupid things, as that would also stop them from doing clever things.",
    "",
    "—Anonymous",
  },
  {
    "Contrary to popular belief, Unix is user friendly.\nIt just happens to be very selective about who it decides to make friends with.",
    "",
    "—Anonymous",
  },
  {
    "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.",
    "",
    "—Anonymous",
  },
  {
    "There are two ways of constructing a software design: One way is to make it so simple that there are obviously no deficiencies, and the other way is to make it so complicated that there are no obvious deficiencies.",
    "",
    "—C.A.R. Hoare",
  },
  {
    "If you don't make mistakes, you're not working on hard enough problems.",
    "",
    "—Frank Wilczek"
  },
  {
    "If you don't start with a spec, every piece of code you write is a patch.",
    "",
    "—Leslie Lamport"
  },
  {
    "Caches are bugs waiting to happen.",
    "",
    "—Rob Pike"
  },
  {
    "Abstraction is not about vagueness, it is about being precise at a new semantic level.",
    "",
    "—Edsger W. Dijkstra",
  },
  {
    "dd is horrible on purpose.\nIt's a joke about OS/360 JCL. But today it's an internationally standardized joke. I guess that says it all.",
    "",
    "—Rob Pike",
  },
  {
    "All loops are infinite ones for faulty RAM modules.",
    "",
    "—Anonymous"
  },
  {
    "All idioms must be learned. Good idioms only need to be learned once.",
    "",
    "—Alan Cooper"
  },
  {
    "For a successful technology, reality must take precedence over public relations, for Nature cannot be fooled.",
    "",
    "—Richard Feynman",
  },
  {
    "If programmers were electricians, parallel programmers would be bomb disposal experts. Both cut wires.",
    "",
    "—Bartosz Milewski",
  },
  {
    "Computers are harder to maintain at high altitude. Thinner air means less cushion between disk heads and platters. Also more radiation.",
    "",
    "—Anonymous",
  },
  {
    "Almost every programming language is overrated by its practitioners.",
    "",
    "—Larry Wall"
  },
  {
    "Fancy algorithms are slow when n is small, and n is usually small.",
    "",
    "—Rob Pike"
  },
  {
    "Methods are just functions with a special first argument.",
    "",
    "—Andrew Gerrand"
  },
  {
    "Care about your craft. Why spend your life developing software unless you care about doing it well?",
    "",
    "—Anonymous",
  },
  {
    "Provide options, don't make lame excuses. Instead of excuses, provide options. Don't say it can't be done; explain what can be done.",
    "",
    "—Anonymous",
  },
  {
    "Be a catalyst for change.\nYou can't force change on people. Instead, show them how the future might be and help them participate in creating it.",
    "",
    "—Anonymous",
  },
  {
    "Make quality a requirements issue.\nInvolve your users in determining the project's real quality requirements.",
    "",
    "—Anonymous",
  },
  {
    "Critically analyze what you read and hear.\nDon't be swayed by vendors, media hype, or dogma. Analyze information in terms of you and your project.",
    "",
    "—Anonymous",
  },
  {
    "DRY (Don't Repeat Yourself).\nEvery piece of knowledge must have a single, unambiguous, authoritative representation within a system.",
    "",
    "—Anonymous",
  },
  {
    "Eliminate effects between unrelated things.\nDesign components that are self-contained, independent, and have a single, well-defined purpose.",
    "",
    "—Anonymous",
  },
  {
    "Use tracer bullets to find the target.\nTracer bullets let you home in on your target by trying things and seeing how close they land.",
    "",
    "—Anonymous",
  },
  {
    "Program close to the problem domain. Design and code in your user's language.",
    "",
    "—Anonymous"
  },
  {
    "Iterate the schedule with the code.\nUse experience you gain as you implement to refine the project time scales.",
    "",
    "—Anonymous",
  },
  {
    "Use the power of command shells. Use the shell when graphical user interfaces don't cut it.",
    "",
    "—Anonymous"
  },
  {
    "Always use source code control.\nSource code control is a time machine for your work (you can go back).",
    "",
    "—Anonymous",
  },
  {
    "Don't panic when debugging\nTake a deep breath and THINK! about what could be causing the bug.",
    "",
    "—Anonymous",
  },
  {
    "Don't assume it, prove it.\nProve your assumptions in the actual environment, with real data and boundary conditions.",
    "",
    "—Anonymous",
  },
  {
    "Write code that writes code.\nCode generators increase your productivity and help avoid duplication.",
    "",
    "—Anonymous",
  },
  {
    "Design With contracts.\nUse contracts to document and verify that code does no more and no less than it claims to do.",
    "",
    "—Anonymous",
  },
  {
    "Use assertions to prevent the impossible.\nAssertions validate your assumptions. Use them to protect your code from an uncertain world.",
    "",
    "—Anonymous",
  },
  {
    "Finish what you start.\nWhere possible, the routine or object that allocates a resource should be responsible for deallocating it.",
    "",
    "—Anonymous",
  },
  {
    "Configure, don't integrate.\nImplement technology choices for an application as configuration options, not through integration or engineering.",
    "",
    "—Anonymous",
  },
  {
    "Analyze workflow to improve concurrency. Exploit concurrency in your user's workflow.",
    "",
    "—Anonymous"
  },
  {
    "Always design for concurrency.\nAllow for concurrency, and you'll design cleaner interfaces with fewer assumptions.",
    "",
    "—Anonymous",
  },
  {
    "Use blackboards to coordinate workflow.\nUse blackboards to coordinate disparate facts and agents, while maintaining independence and isolation among participants.",
    "",
    "—Anonymous",
  },
  {
    "Estimate the order of your algorithms.\nGet a feel for how long things are likely to take before you write code.",
    "",
    "—Anonymous",
  },
  {
    "Refactor early, refactor often.\nJust as you might weed and rearrange a garden, rewrite, rework, and re-architect code when it needs it. Fix the root of the problem.",
    "",
    "—Anonymous",
  },
  {
    "Test your software, or your users will.\nTest ruthlessly. Don't make your users find bugs for you.\n",
    "",
    "—Anonymous"
  },
  {
    "Don't gather requirements, dig for them.\nRequirements rarely lie on the surface. They're buried deep beneath layers of assumptions, misconceptions, and politics.\n",
    "",
    "—Anonymous"
  },
  {
    "Abstractions live longer than details.\nInvest in the abstraction, not the implementation. Abstractions can survive the barrage of changes from different implementations and new technologies.",
    "",
    "—Anonymous"
  },
  {
    'Don\'t think outside the box, find the box.\nWhen faced with an impossible problem, identify the real constraints. Ask yourself: "Does it have to be done this way? Does it have to be done at all?"',
    "",
    "—Anonymous"
  },
  {
    "Some things are better done than described.\nDon't fall into the specification spiral, at some point you need to start coding.",
    "",
    "—Anonymous"
  },
  {
    "Costly tools don't produce better designs.\nBeware of vendor hype, industry dogma, and the aura of the price tag. Judge tools on their merits.",
    "",
    "—Anonymous"
  },
  {
    "Don't use manual procedures.\nA shell script or batch file will execute the same instructions, in the same order, time after time.",
    "",
    "—Anonymous"
  },
  {
    "Coding ain't done 'til all the Tests run.\n'Nuff said.",
    "",
    "—Anonymous"
  },
  {
    "Test state coverage, not code coverage.\nIdentify and test significant program states. Just testing lines of code isn't enough.",
    "",
    "—Anonymous"
  },
  {
    "English is just a programming language.\nWrite documents as you would write code: honor the DRY principle, use metadata, MVC, automatic generation, and so on.",
    "",
    "—Anonymous"
  },
  {
    "Gently exceed your users' expectations.\nCome to understand your users' expectations, then deliver just that little bit more.",
    "",
    "—Anonymous"
  },
  {
    "Think about your work.\nTurn off the autopilot and take control. Constantly critique and appraise your work.",
    "",
    "—Anonymous"
  },
  {
    "Don't live with broken windows.\nFix bad designs, wrong decisions, and poor code when you see them.",
    "",
    "—Anonymous"
  },
  {
    "Remember the big picture.\nDon't get so engrossed in the details that you forget to check what's happening around you.",
    "",
    "—Anonymous"
  },
  {
    "Invest regularly in your knowledge portfolio.\nMake learning a habit.",
    "",
    "—Anonymous"
  },
  {
    "It's both what you say and the way you say it.\nThere's no point in having great ideas if you don't communicate them effectively.",
    "",
    "—Anonymous"
  },
  {
    "Make it easy to reuse.\nIf it's easy to reuse, people will. Create an environment that supports reuse.",
    "",
    "—Anonymous"
  },
  {
    "There are no final decisions.\nNo decision is cast in stone. Instead, consider each as being written in the sand at the beach, and plan for change.",
    "",
    "—Anonymous"
  },
  {
    "Prototype to learn.\nPrototyping is a learning experience. Its value lies not in the code you produce, but in the lessons you learn.",
    "",
    "—Anonymous"
  },
  {
    "Estimate to avoid surprises.\nEstimate before you start. You'll spot potential problems up front.",
    "",
    "—Anonymous"
  },
  {
    "Keep knowledge in plain text.\nPlain text won't become obsolete. It helps leverage your work and simplifies debugging and testing.",
    "",
    "—Anonymous"
  },
  {
    "Use a single editor well.\nThe editor should be an extension of your hand; make sure your editor is configurable, extensible, and programmable.",
    "",
    "—Anonymous"
  },
  {
    "Fix the problem, not the blame.\nIt doesn't really matter whether the bug is your fault or someone else's, it is still your problem, and it still needs to be fixed.",
    "",
    "—Anonymous"
  },
  {
    '"select" isn\'t broken.\nIt is rare to find a bug in the OS or the compiler, or even a third-party product or library. The bug is most likely in the application.',
    "",
    "—Anonymous"
  },
  {
    "Learn a text manipulation language.\nYou spend a large part of each day working with text. Why not have the computer do some of it for you?",
    "",
    "—Anonymous"
  },
  {
    "You can't write perfect software.\nSoftware can't be perfect. Protect your code and users from the inevitable errors.",
    "",
    "—Anonymous"
  },
  {
    "Crash early.\nA dead program normally does a lot less damage than a crippled one.",
    "",
    "—Anonymous"
  },
  {
    "Use exceptions for exceptional problems.\nExceptions can suffer from all the readability and maintainability problems of classic spaghetti code. Reserve exceptions for exceptional things.",
    "",
    "—Anonymous"
  },
  {
    'Minimize coupling between modules.\nAvoid coupling by writing "shy" code and applying the Law of Demeter.',
    "",
    "—Anonymous"
  },
  {
    "Put abstractions in code, details in metadata.\nProgram for the general case, and put the specifics outside the compiled code base.",
    "",
    "—Anonymous"
  },
  {
    "Design using services.\nDesign in terms of services-independent, concurrent objects behind well-defined, consistent interfaces.",
    "",
    "—Anonymous"
  },
  {
    "Separate views from models.\nGain flexibility at low cost by designing your application in terms of models and views.",
    "",
    "—Anonymous"
  },
  {
    "Don't program by coincidence.\nRely only on reliable things. Beware of accidental complexity, and don't confuse a happy coincidence with a purposeful plan.",
    "",
    "—Anonymous"
  },
  {
    "Test your estimates.\nMathematical analysis of algorithms doesn't tell you everything. Try timing your code in its target environment.",
    "",
    "—Anonymous"
  },
  {
    "Design to test.\nStart thinking about testing before you write a line of code.",
    "",
    "—Anonymous"
  },
  {
    "Don't use wizard code you don't understand.\nWizards can generate reams of code. Make sure you understand all of it before you incorporate it into your project.",
    "",
    "—Anonymous"
  },
  {
    "Work with a user to think like a user.\nIt's the best way to gain insight into how the system will really be used.",
    "",
    "—Anonymous"
  },
  {
    "Use a project glossary.\nCreate and maintain a single source of all the specific terms and vocabulary for a project.",
    "",
    "—Anonymous"
  },
  {
    "Start when you're ready.\nYou've been building experience all your life. Don't ignore niggling doubts.",
    "",
    "—Anonymous"
  },
  {
    "Don't be a slave to formal methods.\nDon't blindly adopt any technique without putting it into the context of your development practices and capabilities.",
    "",
    "—Anonymous"
  },
  {
    "Organize teams around functionality.\nDon't separate designers from coders, testers from data modelers. Build teams the way you build code.",
    "",
    "—Anonymous"
  },
  {
    "Test early. Test often. Test automatically.\nTests that run with every build are much more effective than test plans that sit on a shelf.",
    "",
    "—Anonymous"
  },
  {
    "Use saboteurs to test your testing.\nIntroduce bugs on purpose in a separate copy of the source to verify that testing will catch them.",
    "",
    "—Anonymous"
  },
  {
    "Find bugs once.\nOnce a human tester finds a bug, it should be the last time a human tester finds that bug. Automatic tests should check for it from then on.",
    "",
    "—Anonymous"
  },
  {
    "Sign your work.\nCraftsmen of an earlier age were proud to sign their work. You should be, too.",
    "",
    "—Anonymous"
  },
  {
    "Think twice, code once.",
    "",
    "—Anonymous"
  },
  {
    "No matter how far down the wrong road you have gone, turn back now.",
    "",
    "—Anonymous"
  },
  {
    "Why do we never have time to do it right, but always have time to do it over?",
    "",
    "—Anonymous"
  },
  {
    "Weeks of programming can save you hours of planning.",
    "",
    "—Anonymous"
  },
  {
    "To iterate is human, to recurse divine.",
    "",
    "—L. Peter Deutsch"
  },
  {
    "Computers are useless. They can only give you answers.",
    "",
    "—Pablo Picasso"
  },
  {
    "The question of whether computers can think is like the question of whether submarines can swim.",
    "",
    "—Edsger W. Dijkstra",
  },
  {
    "It's ridiculous to live 100 years and only be able to remember 30 million bytes. You know, less than a compact disc. The human condition is really becoming more obsolete every minute.",
    "",
    "—Marvin Minsky",
  },
  {
    "The city's central computer told you? R2D2, you know better than to trust a strange computer!",
    "",
    "—C3PO",
  },
  {
    "Most software today is very much like an Egyptian pyramid with millions of bricks piled on top of each other, with no structural integrity, but just done by brute force and thousands of slaves.",
    "",
    "—Alan Kay",
  },
  {
    'I\'ve finally learned what "upward compatible" means. It means we get to keep all our old mistakes.',
    "",
    "—Dennie van Tassel",
  },
  {
    "There are two major products that come out of Berkeley: LSD and UNIX. We don't believe this to be a coincidence.",
    "",
    "—Jeremy S. Anderson",
  },
  {
    "The bulk of all patents are crap. Spending time reading them is stupid. It's up to the patent owner to do so, and to enforce them.",
    "",
    "—Linus Torvalds",
  },
  {
    "Controlling complexity is the essence of computer programming.",
    "",
    "—Brian Kernighan",
  },
  {
    "Complexity kills. It sucks the life out of developers, it makes products difficult to plan, build and test, it introduces security challenges, and it causes end-user and administrator frustration.",
    "",
    "—Ray Ozzie",
  },
  {
    "The function of good software is to make the complex appear to be simple.",
    "",
    "—Grady Booch",
  },
  {
    "There's an old story about the person who wished his computer were as easy to use as his telephone. That wish has come true, since I no longer know how to use my telephone.",
    "",
    "—Bjarne Stroustrup",
  },
  {
    'There are only two industries that refer to their customers as "users".',
    "",
    "—Edward Tufte",
  },
  {
    "Most of you are familiar with the virtues of a programmer. There are three, of course: laziness, impatience, and hubris.",
    "",
    "—Larry Wall",
  },
  {
    "Computer science education cannot make anybody an expert programmer any more than studying brushes and pigment can make somebody an expert painter.",
    "",
    "—Eric S. Raymond",
  },
  {
    "Optimism is an occupational hazard of programming; feedback is the treatment.",
    "",
    "—Kent Beck",
  },
  {
    "First, solve the problem. Then, write the code.",
    "",
    "—John Johnson",
  },
  {
    "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.",
    "",
    "—Bill Gates",
  },
  {
    "Don't worry if it doesn't work right. If everything did, you'd be out of a job.",
    "",
    "—Mosher's Law of Software Engineering",
  },
  {
    "A LISP programmer knows the value of everything, but the cost of nothing.",
    "",
    "—Alan J. Perlis",
  },
  {
    "All problems in computer science can be solved with another level of indirection.",
    "",
    "—David Wheeler",
  },
  {
    "Functions delay binding; data structures induce binding. Moral: Structure data late in the programming process.",
    "",
    "—Alan J. Perlis",
  },
  {
    "Easy things should be easy and hard things should be possible.",
    "",
    "—Larry Wall",
  },
  {
    "Nothing is more permanent than a temporary solution.",
    "",
    "—Anonymous",
  },
  {
    "If you can't explain something to a six-year-old, you really don't understand it yourself.",
    "",
    "—Albert Einstein",
  },
  {
    "All programming is an exercise in caching.",
    "",
    "—Terje Mathisen",
  },
  {
    "Software is hard.",
    "",
    "—Donald Knuth",
  },
  {
    "They did not know it was impossible, so they did it!",
    "",
    "—Mark Twain",
  },
  {
    "The object-oriented model makes it easy to build up programs by accretion. What this often means, in practice, is that it provides a structured way to write spaghetti code.",
    "",
    "—Paul Graham",
  },
  {
    "Question: How does a large software project get to be one year late?\nAnswer: One day at a time!",
    "",
    "—Anonymous"
  },
  {
    "The first 90% of the code accounts for the first 90% of the development time. The remaining 10% of the code accounts for the other 90% of the development time.",
    "",
    "—Tom Cargill",
  },
  {
    "In software, we rarely have meaningful requirements. Even if we do, the only measure of success that matters is whether our solution solves the customer's shifting idea of what their problem is.",
    "",
    "—Jeff Atwood",
  },
  {
    "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
    "",
    "—Edsger W. Dijkstra",
  },
  {
    "640K ought to be enough for anybody.",
    "",
    "—Bill Gates, 1981",
  },
  {
    "To understand recursion, one must first understand recursion.",
    "",
    "—Stephen Hawking",
  },
  {
    "Developing tolerance for imperfection is the key factor in turning chronic starters into consistent finishers.",
    "",
    "—Jon Acuff",
  },
  {
    "Every great developer you know got there by solving problems they were unqualified to solve until they actually did it.",
    "",
    "—Patrick McKenzie",
  },
  {
    "The average user doesn't give a damn what happens, as long as (1) it works and (2) it's fast.",
    "",
    "—Daniel J. Bernstein",
  },
  {
    "Walking on water and developing software from a specification are easy if both are frozen.",
    "",
    "—Edward V. Berard",
  },
  {
    "Be curious. Read widely. Try new things. I think a lot of what people call intelligence boils down to curiosity.",
    "",
    "—Aaron Swartz",
  },
  {
    "What one programmer can do in one month, two programmers can do in two months.",
    "",
    "—Frederick P. Brooks",
  },
  -- Figures in Computer Science
  {
    "Mathematics is less related to accounting than it is to philosophy.",
    "",
    "—Leonard Adleman"
  },
  {
    "But biology and computer science, life and computation, are related. I am confident that at their interface great discoveries await those who seek them.",
    "",
    "—Leonard Adleman"
  },
  {
    "The RSA crypto system is an acronym of it's creators: Ron Rivest, Adi Shamir and Leonard Adleman",
    "",
    "—Anonymous"
  },
  {
    "It is astonishing to me how much energy is going into the commercialization of technology that doesn't yet exist.",
    "",
    "—Ron Rivest (on quantum computing, 2021)"
  },
  {
    "The magic words are squeamish ossifrage.",
    "",
    "—Ron Rivest"
  },
  {
    "In science it often happens that scientists say, 'You know that's a really good argument; my position is mistaken,' and then they would actually change their minds and you never hear that old view from them again. They really do it. It doesn't happen as often as it should, because scientists are human and change is sometimes painful. But it happens every day. I cannot recall the last time something like that happened in politics or religion.",
    "",
    "—Carl Sagan (1987)"
  },
  {
    "The RSA crypto system is an acronym of it's creators: Ron Rivest, Adi Shamir and Leonard Adleman",
    "",
    "—Anonymous"
  },
}

-- Function to wrap a string to fit the specified width
local function wrap_text(input, linewidth)
  local lines = {}
  local line_len = 0
  local line = ""
  for word in input:gmatch("[^%s]+") do
    if line_len + #word > linewidth then
      table.insert(lines, line)
      line_len = 0
      line = ""
    end
    if line == "" then
      line = word
    else
      line = line .. " " .. word
    end
    line_len = line_len + #word + 1
  end
  table.insert(lines, line)
  return lines
end

-- The draw_rectangle function
local function draw_rectangle(h_padding, v_padding)
  -- Max width is 100
  local max_width = 50 - 2 * h_padding

  -- Select a quote - for this example, always the first one
  -- Produce more random-ness xD
  math.randomseed(os.time())
  local random_number = math.random(#predefined_quotes)
  local chosen_quote = predefined_quotes[random_number]

  -- Wrap the first part of the quote
  local wrapped_quote = wrap_text(chosen_quote[1], max_width - 2)
  local wrapped_author = wrap_text(chosen_quote[3], max_width - 2)

  -- Calculate the necessary width and height
  local width = max_width
  local height = #wrapped_quote + #wrapped_author + 2 + 2 * v_padding -- Plus input[2] i.e., blank

  -- Top border
  local rectangle = char_top_left .. string.rep(char_top_bottom, width + 2 * h_padding) .. char_top_right .. "\n"

  -- Add top padding
  for i = 1, v_padding do
    rectangle = rectangle .. char_sides .. string.rep(" ", width + 2 * h_padding) .. char_sides .. "\n"
  end

  -- Add the wrapped quote
  for _, line in ipairs(wrapped_quote) do
    rectangle = rectangle
      .. char_sides
      .. string.rep(" ", h_padding)
      .. line
      .. string.rep(" ", width - #line + h_padding)
      .. char_sides
      .. "\n"
  end

  -- Add the blank line
  rectangle = rectangle .. char_sides .. string.rep(" ", width + 2 * h_padding) .. char_sides .. "\n"

  -- Add the wrapped author
  for _, line in ipairs(wrapped_author) do
    rectangle = rectangle
      .. char_sides
      .. string.rep(" ", h_padding)
      .. line
      .. string.rep(" ", width - #line + 2 + h_padding)
      .. char_sides
      .. "\n"
  end

  -- Add bottom padding
  for i = 1, v_padding do
    rectangle = rectangle .. char_sides .. string.rep(" ", width + 2 * h_padding) .. char_sides .. "\n"
  end

  -- Bottom border
  rectangle = rectangle
    .. char_bottom_left
    .. string.rep(char_top_bottom, width + 2 * h_padding)
    .. char_bottom_right
    .. "\n"

  return rectangle
end

function M.wizardsays()
  local r = table.concat({ draw_rectangle(1, 0), wizard }, "\n")
	local t = {}
	for line in r:gmatch("[^\n]+") do
		table.insert(t, line)
	end
	return t
end

return M
