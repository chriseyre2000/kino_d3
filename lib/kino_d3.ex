defmodule Kino.SmartCell.D3 do
  @moduledoc false

  use Kino.JS
  use Kino.SmartCell, name: "Kino D3"
  use Kino.JS.Live

  def new(html) do
    Kino.JS.new(__MODULE__, html)
  end

  @setup """
  {
    "width": 400,
    "height": 800
  }
  """

  @impl true
  def to_source(_) do
    quote do
      Kino.SmartCell.D3.new("""
      {
        "width": 400,
        "height": 400
      }
      """)
    end
    |> Kino.SmartCell.quoted_to_string()
  end

  @impl true
  def to_attrs(_), do: %{}

  asset "main.js" do
    """
    import "https://d3js.org/d3.v7.js"
    export function init(ctx, params) {
      const input = JSON.parse(params)

      const width = input.width || 400;
      const height = input.height || 400;

      ctx.root.innerHTML = '<svg id="svg1" style="margin: 0 auto; display: block;"></svg>';
      let svg = d3.select('#svg1')
        .attr('width', width)
        .attr('height', height)
        .style('background-color', 'black');

      svg.append('line')
        .style("stroke", "lightgreen")
        .style("stroke-width", 10)
        .attr("x1", 0)
        .attr("y1", 0)
        .attr("x2", 200)
        .attr("y2", 200);
    }
    """
  end

  @impl true
  def handle_connect(ctx) do
    {:ok, @setup, ctx}
  end
end
