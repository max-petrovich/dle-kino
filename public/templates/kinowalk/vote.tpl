<div class="vote-wrap">			
		<div class="vote-title">
			{title}
		</div>
		<div class="vote-list">
			[votelist]<form method="post" name="vote">[/votelist]
			{list}
			[voteresult]<div class="vote-count">Stimmen gesamt: {votes}</div>[/voteresult]			
			[votelist]
				<input type="hidden" name="vote_action" value="vote" />
				<input type="hidden" name="vote_id" id="vote_id" value="{vote_id}" />
			<div class="vote-buts clearfix">
				<button class="vvote" type="submit" onclick="doVote('vote'); return false;" >Voten</button>
				<!-- <button class="vall" type="submit" onclick="ShowAllVotes(); return false;" ><i class="fa fa-bar-chart"></i></button> -->
				<button class="vres" type="button" onclick="doVote('results'); return false;" ><i class="fa fa-align-left"></i> Ergebnisse</button>
			</div>
			</form>
			[/votelist]
	</div>
</div>	