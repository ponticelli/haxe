/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package python.io;

import haxe.io.Eof;
import haxe.io.Input;

import python.io.IInput;
import python.io.IoTools;
import python.lib.Bytearray;
import python.lib.io.RawIOBase;
import python.lib.io.IOBase.SeekSet;


class NativeBytesInput extends NativeInput<RawIOBase> implements IInput {


	public function new (stream:RawIOBase) {
		super(stream);

	}

	override public function readByte():Int
	{

		var ret = stream.read(1);

		if (ret.length == 0) throwEof();

		return ret.get(0);
	}

	override public function seek( p : Int, pos : sys.io.FileSeek ) : Void
	{
		wasEof = false;
		return IoTools.seekInBinaryMode(stream, p, pos);
	}

	override function readinto (b:Bytearray):Int {
		return stream.readinto(b);
	}


}