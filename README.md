# PFA test suite

This project is test suite for the pfa project. It will help you to know if you're code works and to debug if it does not.

![Screenshot at 2025-02-14 00-18-36](https://github.com/user-attachments/assets/162134b0-6d4c-468a-9b81-f19382579200)

## Installation

To install it on whatever plateform, download the [testsuite.m](https://github.com/lomination/pfa-testsuite/blob/main/testsuite.m) file and put it into the directory containing your implementation of the integrator class.

Alternatiely, on a Linux computer (including computers of the PIE), you can go to the directory containing your implementation of the integrator class and run the following command:

```bash
curl https://github.com/lomination/pfa-testsuite/blob/main/testsuite.m > testsuite.m
```

Then you need to change the visibility of the properties of the integrator class so the tests can access these properties. To do so, replace the `protected` keyword by `public` in the following code that you should find in the beginning of your integrator.m file:

```matlab
classdef integrator < handle

  properties (Access = protected) % replace with "properties (Access = public)"
    method;
    xk;
    wk;
    dx;
  endproperties

  ...
endclassdef
```

## Updating

This testsuite will be often updated. Don't forget to redownload the latest version from time to time!

## Usage

To run the tests of this test suite, simply type `testsuite` in your octave cli.

![Screenshot at 2025-02-14 00-16-38](https://github.com/user-attachments/assets/0ad28e6f-cf6c-4f78-b9b9-79e2119ce927)

> [!NOTE]
> - `[Success]` means that a test succeeded,
> - `[Failure]` means that a test failed (the tested value was not the expected one),
> - `[Error]` means that an unhandled error has been thrown, see the provided message to fix it.

## Support

Feel free to ask for help on discord to @lomination.

## Contributing

This repository is open to any suggestion and feeback. If you have some, please let me know in the issues or via discord.

Also, feel free to open pull requests.

## Licensing

This project is under GNU General Public License.
