<admin_entry>
		<!-- <img src={ url } alt="user image" /> -->
    <p>url: {url}</p>
		<p>caption: { caption }</p>
		<p>funness: { funness }</p>
		<button type="button" onclick={ parent.remove }>Remove This</button>
<style>
	:scope {
		display: inline-block;
    background-color: pink;
    margin-top: 2em;
    padding: 2em;
	}

</style>

	<script>
			console.log(this.parent);
	</script>


</admin_entry>
