defmodule UrlsTest do
  use ExUnit.Case

  test "Urls are constructed correctly based on type" do
    expected = 
      %{
        :assets => "https://api.xero.com/assets.xro/1.0/resource",
        :core => "https://api.xero.com/api.xro/2.0/resource",
        :files => "https://api.xero.com/files.xro/1.0/resource",
        :payroll => "https://api.xero.com/payroll.xro/1.0/resource",
      }
    
    actual = 
      %{ 
        :assets => EliXero.Utils.Urls.api("resource", :assets),
        :core => EliXero.Utils.Urls.api("resource", :core),
        :files => EliXero.Utils.Urls.api("resource", :files),
        :payroll => EliXero.Utils.Urls.api("resource", :payroll)
      }
    assert expected == actual
  end

  test "Query params are constructed, and encoded, correctly" do
    query_filters = [{"where", "Status==\"DRAFT\" AND Type==\"ACCREC\""}, {"order", "UpdatedDateUTC"}]
    query_string = EliXero.Utils.Urls.append_query_filters "", query_filters

    assert query_string == "?where=Status%3D%3D%22DRAFT%22%20AND%20Type%3D%3D%22ACCREC%22&order=UpdatedDateUTC"
  end
end
