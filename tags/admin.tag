<admin>
  	<div class="memeMaker">
  		<input type="text" ref="urlEl" placeholder="Enter url">
  		<input type="text" ref="captionEl" placeholder="Enter caption">
      <input type="text" ref="funnyEl" placeholder="Enter funness (0 to 5)">

  		<button type="button" onclick={ addMeme }>Add Meme</button>
  	</div>

  	<div show={ myMemes.length == 0 }>
  		<p>NO MEMEs. Add a meme from above.</p>
  	</div>

  	<admin_entry each={ myMemes } >
  	</admin_entry>

  	<script>
  		//console.log(this);
  		var that = this;

  		this.myMemes = [
  		{
  			url: "https://pixel.nymag.com/imgs/daily/selectall/2016/08/11/11-gavin.w700.h700.jpg",
  			caption: "when i first heard about js",
        funness: 3
      },
  		{
  			url: "https://proxy.topixcdn.com/ipicimg/PKACK3N1SJ7P27PO-cp0x0x1328x664-fill810x415x",
  			caption:"hihi",
        funness: 2
      },
  		{
  			url: "http://indiannationalnews.com/wp-content/uploads/2017/10/hqdefault-1.jpg",
  			caption: "hihihi" ,
        funness: 1
      }
  		];

  		var that  =  this;

  		this.remove = function(event) {
  			console.log('EVENT:', event);
  			// console.log('EVENT.ITEM', event.item);
  			var memeObj = event.item;
  			//in this context, since this function is invoked by child.tag. so this == child

  			var index = that.myMemes.indexOf(memeObj);
  			//remember the remove button is called by child. so we cannot type this to refer to the parent
  			//we have to give it a new name
  			that.myMemes.splice(index, 1);
  			//try to comment out this line and see what happens
  			//in riot, js object data value only gets updated by user event trigger.
  			//since in this case, event is triggered by child, parent data won't be updated until
  			//we call it to update manually.
  			that.update();
  		};

  		this.addMeme = function() {
  			//console.log(event);
  			var url = this.refs.urlEl.value;
  			var caption = this.refs.captionEl.value;
        var funness = this.refs.funnyEl.value;
  			var meme = {
          url: url,
          caption: caption,
          funness: funnes
          };
  			// We are adding a book object to the source of truth array.
  			this.myMemes.push(meme);
  			// RESET INPUTS this.refs.urlEl.value = "";
  			this.refs.captionEl.value = "";
  		};
  	</script>

  	<style>
  		:scope {
  			display: block;
  		  padding: 2em;
  		}

      .memeMaker{
        padding: 2em;
        background-color: grey;
      }
  	</style>
</admin>
