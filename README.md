# PS2 Client (ruby)

This is a (partial) re-implementation of ps2client in `ruby` - intended to form
the non-ps2-side of the testing harness, as well as (eventually) having a
command-line script like the ps2client binary itself.

The reason for making this is mainly that I want one program to be able to
orchestrate the ps2's bootup, ps2link, program-launching and test result
collection. Also, `ps2client listen` eats a core because the devs didn't add a
sleep or using non-blocking i/o, which is a bit yikes.

Each part of the process will be individually runnable (for debugging purposes,
or in case your needs are more complex than mine), so you could use this program
for, say, booting up the ps2 to ps2link, so you can run a program via other
means. Or running a program assuming ps2link is already booted (could be useful
for working with an emulator perhaps?)

The plan is for it to supercede the scripts in [ps2runner][ps2runner] - so
ps2client-rb will implement the ps2boot, ps2bootlink and ps2shutdown commands
(probably as subcommands), and to implement the server-side of the exit-code
protocol to allow propagation of exit codes. The idea is something like this:

    $ ps2client execee host:hello-world.elf
      Hello world
    $ echo $?
      0
    $ ps2client execee host:hello-world-exit-1.elf
      Hello world, this program returns exit code 1.
    $ echo $?
      1

## Installation

### HEY!!! I recommend you wait til 1.0 before trying to use this tool

You will need Ruby 2.7 and LIRC installed, with LIRC configured to act as a
ps2 remote.

TODO: put instructions here for configuring LIRC

    $ git clone https://github.com/telyn/ps2client-rb.git
    $ gem build ps2client
    $ gem install *.gem

### Docker

TODO: Dockerfile, docker instructions

## Usage

TODO: divide into sections, document flags

General concept is to be similar to git - a few 'porcelain' commands, dedicated
to providing a nice UI / wrapping up lots of functionality, and a bunch of
smaller commands for the nitty-gritty.

(at least) the following will be implemented from ps2client, with completely
compatible flags and arguments (though perhaps not output & exit codes):

* execee
* execiop
* listen
* netdump
* scrdump

In addition, the following will be implemented, in a compatible manner with the
scripts from `ps2runner`:

* boot
* bootlink
* shutdown

And finally, a single command to wrap things up:

* run
  * boots the PS2 (into ps2link)
  * executes the program on the ps2
  * shuts down the PS2 afterwards.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/telyn/ps2client-rb.

If you fork this repo or otherwise make changes to the code - please do open a
PR. Also if you just use this repo for whatever, I'd love to hear what you're
doing with it - just open an issue to say hi!

## Future plans

* Secondary stream to receive framebuffer data from a framebuffer-capturing
  library I intend to write.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
