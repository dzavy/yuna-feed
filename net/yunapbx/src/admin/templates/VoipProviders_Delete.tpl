<h2>VoIP Providers</h2>
<br />
<p style="font-weight: bold;">
	Are you sure you want to permanently delete this VoIP provider ({$Provider.Name})?
</p>
<br />
<p>
	<form method="post" action="VoipProviders_Delete.php">
		<input type="hidden" name="PK_SipProvider" value="{$Provider.PK_SipProvider}" />
		<button type="submit" name="submit" value="delete_confirm" class="important">Yes, Delete Provider</button>
	</form>
</p>