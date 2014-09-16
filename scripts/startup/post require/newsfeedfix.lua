if tweak_data and tweak_data.ACPConfig then
	function NewsFeedGui:make_news_request()
		Steam:http_request( "http://assycustompayday2.site50.net/syndication.php?fid=2&limit=5", callback( self, self, "news_result" ) )
	end

	function NewsFeedGui:news_result( success, body )
		print( "news_result()", success )
		if not alive( self._panel ) then
			return 
		end

		if success then
			self._titles = self:_get_text_block( body, "<title>", "</title>", self.MAX_NEWS )
			self._links = self:_get_text_block( body, "<link>", "</link>", self.MAX_NEWS )
			self._news = { i = 0 } -- , next = Application:time(), wait = 3 }
			self._next = true
			self._panel:child( "title_announcement" ):set_visible( #self._titles > 0 )
		end
	end
	NewsFeedGui.MAX_NEWS = 1
	NewsFeedGui.SUSTAIN_TIME = 600

	function NewsFeedGui:_get_text_block( s, sp, ep, max_results )
		local result = {}
		local len = string.len( s )
		local i = 1
		
		local f = function( s, sp, ep, max_results)
			local s1, e1 = string.find( s, sp, 1, true )
			if not e1 then
				return
			end
			local s2, e2 = string.find( s, ep, e1, true )
			
			local text = string.sub( s, e1 + 1, s2 - 1 )
			if sp == "<title>" and text == "Photo" then
				return
			end
			
			table.insert( result, text )
		end
		
		while( i < len and #result < max_results ) do
			local s1,e1 = string.find( s, "<item>", i, true )
			if not e1 then
				break
			end
			
			local s2,e2 = string.find( s, "</item>", e1, true )
			local item_s = string.sub( s, e1+1, s2-1 )
			f( item_s, sp, ep, max_results )
			
			i = e1	
		end
		
		return result
	end
end