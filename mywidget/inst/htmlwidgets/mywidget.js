HTMLWidgets.widget({
  name: "mywidget",
  type: "output",

  factory: function(el, width, height) {

    // This 'factory' function returns an object with renderValue and resize methods.
    // The el is the DOM element in which your widget will be rendered.

    return {
      renderValue: function(x) {
        // If your data is in a data.frame-like structure from R, use HTMLWidgets.dataframeToD3
        // to convert it to a JavaScript array of objects.
        var dat = [];
        HTMLWidgets.dataframeToD3(x.data).forEach(function(v) {
          dat.push([v.k, v.v]);
        });
        x.data = dat;

        // Use the D3Funnel constructor from the JS library you included
        // 'el' is the HTML element - the container for your funnel chart
        var funnel = new D3Funnel(el);

        // Draw the funnel with the data and options passed from R
        funnel.draw(x.data, x.options);
      },

      resize: function(width, height) {
        // If the D3Funnel library supports resizing, you can implement something here.
        // Otherwise, this can be left empty or handle a redraw on resize.
      }
    };
  }
});
