<?php
/**
 * This file is part of FPDI
 *
 * @package   FPDI
 * @copyright Copyright (c) 2017 Setasign - Jan Slabon (https://www.setasign.com)
 * @license   http://opensource.org/licenses/mit-license The MIT License
 * @version   1.6.2
 */

/**
 * This file is used as a bridge between TCPDF or FPDF
 * It will dynamically create the class extending the available
 * class FPDF or TCPDF.
 *
 * This way it is possible to use FPDI for both FPDF and TCPDF with one FPDI version.
 */
if (!class_exists('TCPDF', false)) {
    /**
     * Class fpdi_bridge
     */
    class fpdi_bridge extends FPDF
    {
        // empty body
    }

} else {

    /**
     * Class fpdi_bridge
     */
    class fpdi_bridge extends TCPDF
    {
        /**
         * Array of Tpl-Data
         *
         * @var array
         */
        protected $_tpls = array();

        /**
         * Name-prefix of Templates used in Resources-Dictionary
         *
         * @var string A String defining the Prefix used as Template-Object-Names. Have to begin with an /
         */
        public $tplPrefix = "/TPL";

        /**
         * Current Object Id.
         *
         * @var integer
         */
        protected $_currentObjId;

        /**
         * Return XObjects Dictionary.
         *
         * Overwritten to add additional XObjects to the resources dictionary of TCPDF
         *
         * @return string
         */
        protected function _getxobjectdict()
        {
            $out = parent::_getxobjectdict();
            foreach ($this->_tpls as $tplIdx => $tpl) {
                $out .= sprintf('%s%d %d 0 R', $this->tplPrefix, $tplIdx, $tpl['n']);
            }

            return $out;
        }

        /**
         * Writes a PDF value to the resulting document.
         *
         * Prepares the value for encryption of imported data by FPDI
         *
         * @param array $value
         */
        protected function _prepareValue(&$value)
        {
            switch ($value[0]) {
                case pdf_parser::TYPE_STRING:
                    if ($this->encrypted) {
                        $value[1] = $this->_unescape($value[1]);
                        $value[1] = $this->_encrypt_data($this->_currentObjId, $value[1]);
                        $value[1] = TCPDF_STATIC::_escape($value[1]);
                    }
                    break;

                case pdf_parser::TYPE_STREAM:
                    if ($this->encrypted) {
                        $value[2][1] = $this->_encrypt_data($this->_currentObjId, $value[2][1]);
                        $value[1][1]['/Length'] = array(
                            pdf_parser::TYPE_NUMERIC,
                            strlen($value[2][1])
                        );
                    }
                    break;

                case pdf_parser::TYPE_HEX:
                    if ($this->encrypted) {
                        $value[1] = $this->hex2str($value[1]);
                        $value[1] = $this->_encrypt_data($this->_currentObjId, $value[1]);

                        // remake hexstring of encrypted string
                        $value[1] = $this->str2hex($value[1]);
                    }
                    break;
            }
        }

        /**
         * Un-escapes a PDF string
         *
         * @param string $s
         * @return string
         */
        protected function _unescape($s)
        {
            $out = '';
            for ($count = 0, $n = strlen($s); $count < $n; $count++) {
                if ($s[$count] != '\\' || $count == $n-1) {
                    $out .= $s[$count];
                } else {
                    switch ($s[++$count]) {
                        case ')':
                        case '(':
                        case '\\':
                            $out .= $s[$count];
                            break;
                        case 'f':
                            $out .= chr(0x0C);
                            break;
                        case 'b':
                            $out .= chr(0x08);
                            break;
                        case 't':
                            $out .= chr(0x09);
                            break;
                        case 'r':
                            $out .= chr(0x0D);
                            break;
                        case 'n':
                            $out .= chr(0x0A);
                            break;
                        case "\r":
                            if ($count != $n-1 && $s[$count+1] == "\n")
                                $count++;
                            break;
                        case "\n":
                            break;
                        default:
                            // Octal-Values
                            if (ord($s[$count]) >= ord('0') &&
                                ord($s[$count]) <= ord('9')) {
                                $oct = ''. $s[$count];

                                if (ord($s[$count+1]) >= ord('0') &&
                                    ord($s[$count+1]) <= ord('9')) {
                                    $oct .= $s[++$count];

                                    if (ord($s[$count+1]) >= ord('0') &&
                                        ord($s[$count+1]) <= ord('9')) {
                                        $oct .= $s[++$count];
                                    }
                                }

                                $out .= chr(octdec($oct));
                            } else {
                                $out .= $s[$count];
                            }
                    }
                }
            }
            return $out;
        }

        /**
         * Hexadecimal to string
         *
         * @param string $data
         * @return string
         */
        public function hex2str($data)
        {
            $data = preg_replace('/[^0-9A-Fa-f]/', '', rtrim($data, '>'));
            if ((strlen($data) % 2) == 1) {
                $data .= '0';
            }

            return pack('H*', $data);
        }

        /**
         * String to hexadecimal
         *
         * @param string $str
         * @return string
         */
        public function str2hex($str)
        {
            return current(unpack('H*', $str));
        }
		
	/**
	 * Send the document to a given destination: string, local file or browser.
	 * In the last case, the plug-in may be used (if present) or a download ("Save as" dialog box) may be forced.<br />
	 * The method first calls Close() if necessary to terminate the document.
	 * @param $name (string) The name of the file when saved. Note that special characters are removed and blanks characters are replaced with the underscore character.
	 * @param $dest (string) Destination where to send the document. It can take one of the following values:<ul><li>I: send the file inline to the browser (default). The plug-in is used if available. The name given by name is used when one selects the "Save as" option on the link generating the PDF.</li><li>D: send to the browser and force a file download with the name given by name.</li><li>F: save to a local server file with the name given by name.</li><li>S: return the document as a string (name is ignored).</li><li>FI: equivalent to F + I option</li><li>FD: equivalent to F + D option</li><li>E: return the document as base64 mime multi-part email attachment (RFC 2045)</li></ul>
	 * @return string
	 * @public
	 * @since 1.0
	 * @see Close()
	 */
	public function Output($name, $dest) {
		//Output PDF to some destination
		//Finish document if necessary
		if ($this->state < 3) {
			$this->Close();
		}
		$dest = strtoupper($dest);
		if ($dest[0] != 'F') {
			$name = preg_replace('/[\s]+/', '_', $name);
			$name = preg_replace('/[^a-zA-Z0-9_\.-]/', '', $name);
		}

		// save PDF to a local file
		$f = $this->fopenLocal($name, 'wb');
		if (!$f) {
			$this->Error('Unable to create output file: '.$name);
		}
		fwrite($f, $this->getBuffer(), $this->bufferlen);
		fclose($f);
	}
	
	
	public static function fopenLocal($filename, $mode) {
		if (strpos($filename, '://') === false) {
			$filename = $filename;
		} elseif (stream_is_local($filename) !== true) {
			return false;
		}
		return fopen($filename, $mode);
	}
		
	public function endPage($tocpage=false) {
		// check if page is already closed
		if (($this->page == 0) OR ($this->numpages > $this->page) OR (!$this->pageopen[$this->page])) {
			return;
		}
		// print page footer
		$this->setFooter();
		// close page
		$this->_endpage();
		// mark page as closed
		$this->pageopen[$this->page] = false;
		if ($tocpage) {
			$this->tocpage = false;
		}
	}
	

	/**
	 * get raw output stream.
	 * @param $s (string) string to output.
	 * @param $n (int) object reference for encryption mode
	 * @protected
	 * @author Nicola Asuni
	 * @since 5.5.000 (2010-06-22)
	 */
	protected function _getrawstream($s, $n=0) {
		if ($n <= 0) {
			// default to current object
			$n = $this->n;
		}
		return $this->_encrypt_data($n, $s);
	}
	
	/**
	 * Encrypt the input string.
	 * @param $n (int) object number
	 * @param $s (string) data string to encrypt
	 * @return encrypted string
	 * @protected
	 * @author Nicola Asuni
	 * @since 5.0.005 (2010-05-11)
	 */
	protected function _encrypt_data($n, $s) {
		if (!$this->encrypted) {
			return $s;
		}
		switch ($this->encryptdata['mode']) {
			case 0:   // RC4-40
			case 1: { // RC4-128
				$s = TCPDF_STATIC::_RC4($this->_objectkey($n), $s, $this->last_enc_key, $this->last_enc_key_c);
				break;
			}
			case 2: { // AES-128
				$s = TCPDF_STATIC::_AES($this->_objectkey($n), $s);
				break;
			}
			case 3: { // AES-256
				$s = TCPDF_STATIC::_AES($this->encryptdata['key'], $s);
				break;
			}
		}
		return $s;
	}
	
	
    }
}