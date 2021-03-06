﻿function New-SapiVoice {
  $prototype = New-Prototype @{Message0 = "This is Message 0"}
  $prototype | Update-TypeName
  $prototype | Add-Function say {
    param([string]$message)
    $speaker = new-object -com SAPI.SpVoice
    ($speaker.Speak($message, 1)) | out-null
  }
  
  # always return the base prototype
  $prototype
}

$voice = New-SapiVoice
 
$voice.say("Hello, World!")
# says 'Hello, World!'
