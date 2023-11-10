+++
date = 2014-08-01T23:38:21Z
description = ""
draft = false
image = "photo-1523484489927-4aa8bf9a99d8.jpg"
slug = "decode-pre-2011-apple-mac-efifirmware-passwords"
title = "Decode pre-2011 Apple Mac EFI/Firmware Passwords"
+++

On Mac computers it is possible to prevent booting to alternative media which could get around OS X&#39;s security.

Post-2011, the only way to reset the password is to take it to Apple to be serviced&#8211;they will check the serial number to make sure has not been reported as stolen.

For pre-2011 machines, use the Decoder:

```js
<script type="text/javascript">
	function decode()
	{
		// Get hash text from input
		var hashtext = document.inputform.hashinput.value;
		// Split hash text on % into array
		var hasharray = hashtext.split("%");
		// Remove the first (empty) array element
		hasharray.shift();
		// For each array element:
		// -- take the hex 2-character string and convert to int/binary
		// -- XOR (^) the int with 170 (10101010) (this reverses every other bit)
		// -- convert semi-XORed int to ASCII character
		// -- add the character to plainstring
		plainstring = "";
		hasharray.forEach(function(hashchar) {
		plainstring = plainstring + String.fromCharCode(parseInt(hashchar, 16)^170);
		});
		// Display plainstring
		document.inputform.plainoutput.value = plainstring;
	}
</script>
```

### Decoder

1. Boot up the Mac and log into an account with admin/root privileges
1. Open the Terminal app
1. Run the command:`sudo nvram security-password`
1. You should get output like:`security-password %fa%cb%d9%d9%dd%c5%d8%ce`
1. Enter the code as displayed (without 'security-password ') into the Hash input text box below and press the Decode button

```html
<form name="inputform">
Hash input <input type="textbox" name="hashinput"> <input type="button" onclick="decode();" value="Decode" /><br>
Plaintext output <input type="textbox" id="plainoutput" >
</form>
```

## Reference
Developed using the information at c|net's [Use the Calculator to reveal a Mac's firmware password](http://www.cnet.com/au/news/use-the-calculator-to-reveal-a-macs-firmware-password/)