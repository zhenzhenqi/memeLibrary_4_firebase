<admin>
  <div class="memeMaker">
    <input type="text" ref="urlEl" placeholder="Enter url">
    <input type="text" ref="captionEl" placeholder="Enter caption">
    <input type="text" ref="funnyEl" placeholder="Enter funness (0 to 5)">

    <button type="button" onclick={ saveMeme }>Add Meme</button>
  </div>

  <div show={ myMemes.length == 0 }>
    <p>NO MEMEs. Add a meme from above.</p>
  </div>

  <admin_entry each={ myMemes }></admin_entry>

  <script>
    //console.log(this);
    var tag = this;

    //prepare to push into memes subdirectory in our database
    var messagesRef = rootRef.child('/memes');

    this.myMemes = [];

    this.remove = function (event) {
      console.log('EVENT:', event);
      // console.log('EVENT.ITEM', event.item);
      var memeObj = event.item;
      //in this context, since this function is invoked by child.tag. so this == child

      var index = that.myMemes.indexOf(memeObj);
      //remember the remove button is called by child. so we cannot type this to refer to the parent we have to give it a new name
      that.myMemes.splice(index, 1);
      //try to comment out this line and see what happens in riot, js object data value only gets updated by user event trigger. since in this case, event is triggered by child, parent data won't be updated until we call it to update manually.
      that.update();
    };

    this.saveMeme = function () {
      var key = messagesRef.push().key;
      var meme = {
        id: key,
        url: this.refs.urlEl.value,
        caption: this.refs.captionEl.value,
        funness: this.refs.funnyEl.value
      }
      messagesRef.child(key).set(meme);

      //clean up default input values
      this.refs.urlEl.value = "";
      this.refs.captionEl.value = "";
      this.refs.funnyEl.value = "";
    }

    messagesRef.on('value', function (snap) {
      let datafromfb = snap.val();
      console.log("datafromfb", datafromfb);
      var tempData = [];
      for (key in datafromfb){
          tempData.push(datafromfb[key]);
      }
      // console.log("myMemes", tag.myMemes);
      tag.myMemes = tempData;
      observable.trigger('updateMemes', tempData);

      tag.update();
    });
  </script>

  <style>
    :scope {
      display: block;
      padding: 2em;
    }

    .memeMaker {
      padding: 2em;
      background-color: grey;
    }
  </style>
</admin>
