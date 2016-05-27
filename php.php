<?php
include ("tidyHtml5.php");

// Load XML file
$xml = new DOMDocument;
$xml->load('xml.xml'); 

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('../xsl.xsl');

// Configure the transformer
$proc = new XSLTProcessor;

// Attach the xsl rules
$proc->importStyleSheet($xsl);

// echo $proc->transformToXML($xml);
$html = $proc->transformToXML($xml);

// Specify configuration
// $config = array('indent'=>true,'output-xhtml'=>true,'wrap'=>200);
// $tidy = new tidy;
// $html = $tidy->repairString($html, $config, 'utf8');

$html = tidyHTML5($html);
echo $html;

file_put_contents ($name . '.html', $html);
// header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
// header ('location: ' . $name . '.html', false);
?>